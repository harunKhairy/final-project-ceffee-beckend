const {db} =require('./../connection')
const transporter=require('./../Helpers/mailer')
const {createJWTToken}=require('./../Helpers/jwt')
const crypto=require('./../Helpers/crypto')
const {uploader}=require('./../Helpers/uploader')
const fs = require('fs')

const queryAsync = query => new Promise((resolve, reject) => {
    db.query(query, (err, result) => {
      if(err) return reject(err)
      resolve(result)
    })
})

module.exports={
    sendToCart:(req,res)=>{
        const {userid, productid, qty, username}=req.body
        var sql=`   SELECT * 
                    FROM transaction 
                    WHERE id=${userid} AND status='oncart'`
        db.query(sql,(err,result)=>{
            if(err) return res.status(500).send({message:'error get data'})
            if(result.length){ //kalo udah punya card
                sql=`   SELECT * 
                        FROM transaction t
                            JOIN transactiondetails td
                            ON t.id=td.transactionid
                        WHERE t.userid = ${userid} AND t.status='oncart' AND td.productid=${productid} AND td.isdeleted=0`
                db.query(sql,(err4,result4)=>{
                    if(err4) return res.status(500).send({message:'error select data product yg sama dalam satu cart'})
                    if(result4.length){ //kalo di card ada product yg sama
                        var newqty=result4[0].qty+qty
                        console.log(newqty)
                        sql=`   UPDATE transactiondetails
                                SET qty = ${newqty}
                                WHERE transactionid=${result4[0].transactionid} AND productid=${productid}`
                        db.query(sql,(err5,result5)=>{
                            console.log('sampe sini')
                            if(err5) return res.status(500).send({err5,message:'error add qty product yg sama dalam satu cart'})
                            const token=createJWTToken({id:userid,username})
                            sql=`   SELECT * 
                                    FROM transaction 
                                    WHERE userid=${userid} AND status='oncart'` //get data yg udah ada
                            db.query(sql,(err6,result6)=>{
                                if(err6) return res.status(500).send({message:'error get data oncart'})
                                res.status(200).send({...result6[0]})
                            })
                        })
                    }else{
                        datadetails={
                            transactionid:result[0].id,
                            productid,
                            qty
                        }
                        sql=` INSERT INTO transactiondetails SET ?` // kalo di card ga ada produk sama, add new product to transaction details
                        db.query(sql,datadetails,(err7,result7)=>{
                            if(err7) return res.status(500).send({err7,message:'error create new transactiondetails'})
                            const token=createJWTToken({id:userid,username})
                            sql=`   SELECT * 
                                    FROM transaction
                                    WHERE userid=${userid} AND status='oncart'` //get data yg udah ada
                            db.query(sql,(err8,result8)=>{
                                if(err8) return res.status(500).send({err8,message:'error get data oncart'})
                                res.status(200).send({...result8[0],token:token})
                            })
                        })
                    }
                })
            }else{
                data={
                    userid:userid,
                    method:'credit card',
                    status:'oncart',
                }
                sql=`INSERT INTO transaction SET ?` //kalo user belum punya cart, maka buat dulu
                db.query(sql,data,(err1,result1)=>{
                    if(err1) return res.status(500).send({message:'error create new transaction'})
                    datadetails={
                        transactionid:result1.insertId,
                        productid,
                        qty
                    }
                    sql=`INSERT INTO transactiondetails SET ?` //buat transaction details
                    db.query(sql,datadetails,(err2,result2)=>{
                        if(err2) return res.status(500).send({message:'error create new transactiondetails'})
                        const token=createJWTToken({id:userid,username})
                        sql=`   SELECT * 
                                FROM transaction 
                                WHERE userid=${userid} AND status='oncart'` //get data yg udah ada
                        db.query(sql,(err3,result3)=>{
                            if(err3) return res.status(500).send({message:'error get data oncart'})
                            res.status(200).send({...result3[0],token:token})
                        })
                    })
                })
            }
        })
    },
    getDataCart:(req,res)=>{
        const {id}= req.params
        var sql=`   SELECT p.name,p.image,p.price, p.id AS productid,td.qty,td.id AS transactiondetailsid, t.id AS transactionid
                    FROM transaction t
                        JOIN transactiondetails td
                        ON t.id=td.transactionid
                        JOIN products p
                        ON td.productid=p.id
                    WHERE t.userid = ${id} AND t.status='oncart' AND td.isdeleted=0`
        db.query(sql,(err,result)=>{
            if(err) return res.status(500).send({err,message:'error get cart data'})
            // const token=createJWTToken({id:id,username})
            res.status(200).send(result)
        })
    },
    deleteCart:(req,res)=>{
        const {id}= req.params
        var sql=`   UPDATE transactiondetails SET isdeleted=1  
                    WHERE id=${id}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error update isdeleted'})
            res.status(200).send(result)
        })
    },
    minQty:(req,res)=>{
        const {id}=req.params
        var sql=`   UPDATE transactiondetails SET qty=qty-1  
                    WHERE id=${id}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error update qty-1'})
            res.status(200).send(result)
        })
    },
    plusQty:(req,res)=>{
        const {id}=req.params
        var sql=`   UPDATE transactiondetails SET qty=qty+1  
                    WHERE id=${id}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error update qty+1'})
            res.status(200).send(result)
        })
    },
    getTotalCart:(req,res)=>{
        const {id}=req.params
        var sql= `  SELECT SUM(qty) AS totalqty
                    FROM transaction t
                        JOIN transactiondetails td
                        ON t.id=td.transactionid
                        JOIN products p
                        ON td.productid=p.id
                    WHERE t.userid = ${id} AND t.status='oncart' AND td.isdeleted=0`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error get totalqty'})
            res.status(200).send(result)
        })
    },
    checkout:(req,res)=>{
        const {ccnumber}=req.body
        const {transactionid}=req.params
        var data={
            status:'onpaymentverification',
            creditcard_number:ccnumber
        }
        var sql=`   UPDATE transaction SET ?  
                    WHERE id=${transactionid}`
        db.query(sql,data,(err,result)=>{
            if (err) res.status(500).send({err,message:'error checkout'})
            res.status(200).send(result)
        })
    },
    transactionhistory:(req,res)=>{
        const {userid}=req.params
        var sql= `  SELECT t.id as transactionid, t.userid, t.method, t.status
                    FROM transaction t
                        JOIN transactiondetails td
                        ON t.id=td.transactionid
                    WHERE t.userid = ${userid} AND td.isdeleted=0
                    GROUP BY transactionid
                    ORDER BY transactionid DESC`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error get transaction history'})
            var arr=[]
            result.forEach(element => {
                arr.push(queryAsync(`   SELECT td.id AS transactiondetailid, td.transactionid, td.qty, p.name, p.image, p.price
                                        FROM transaction t
                                            JOIN transactiondetails td
                                            ON t.id=td.transactionid
                                            JOIN products p
                                            ON td.productid=p.id
                                        WHERE t.id=${element.transactionid} AND td.isdeleted=0;`))
            });
            Promise.all(arr)
            .then(result1=>{
                result1.forEach((element,index)=>{
                    result[index].transactiondetails=element
                })
                res.status(200).send(result)
            })
        })
    },
    gettransactiondetail:(req,res)=>{
        const {transactionid}=req.params
        var sql=`    SELECT t.id as transactionid, p.name,p.image,p.price, p.id AS productid,td.qty,td.id AS transactiondetailsid, t.status, u.username, u.address, u.phonenumber, t.method, t.creditcard_number
                        FROM transaction t
                            JOIN transactiondetails td
                            ON t.id=td.transactionid
                            JOIN products p
                            ON td.productid=p.id
                            JOIN users u
                            ON u.id=t.userid
                        WHERE transactionid = ${transactionid} AND td.isdeleted=0`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error get transaction detail'})
            res.status(200).send(result)
        })
    },
    getalltransaction:(req,res)=>{
        var sql= `  SELECT t.id as transactionid, t.userid, t.method, t.status, u.username
                    FROM transaction t
                        JOIN transactiondetails td
                        ON t.id=td.transactionid
                        JOIN users u
                        ON t.userid=u.id
                    WHERE status!='oncart' AND td.isdeleted=0
                    GROUP BY transactionid 
                    ORDER BY transactionid DESC`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error get all transaction id'})
            var arr=[]
            result.forEach(element => {
                arr.push(queryAsync(`   SELECT td.id AS transactiondetailid, td.transactionid, td.qty, p.name, p.image, p.price
                                        FROM transaction t
                                            JOIN transactiondetails td
                                            ON t.id=td.transactionid
                                            JOIN products p
                                            ON td.productid=p.id
                                        WHERE t.id=${element.transactionid} AND td.isdeleted=0;`))
            });
            Promise.all(arr)
            .then(result1=>{
                result1.forEach((element,index)=>{
                    result[index].transactiondetails=element
                })
                res.status(200).send(result)
            })
        })
    },
    verifypayment:(req,res)=>{
        const {transactionid}=req.params
        var sql=`   UPDATE transaction SET status='onprocess'  
                    WHERE id=${transactionid}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error verifypayment'})
            res.status(200).send(result)
        })
    },
    processorder:(req,res)=>{
        const {transactionid}=req.params
        var sql=`   UPDATE transaction SET status='completed'  
                    WHERE id=${transactionid}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send({err,message:'error processorder'})
            res.status(200).send(result)
        })
    }

}