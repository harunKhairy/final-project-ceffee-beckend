const {db}=require('./../Connections')
const fs=require('fs') 
const encrypt=require('./../Helpers/crypto')
const transporter=require('./../Helpers/mailer')
const {createJWTToken}=require('./../Helpers/jwt')


module.exports={
    register:(req,res)=>{
        const {username,password,email}=req.body
        var sql=`select * from user where username='${username}'`
        db.query(sql,(err,result)=>{
            if (err) return res.status(500).send(err)
            if(result.length){
                return res.status(200).send({status:false})
            }
            sql=`insert into user set ?`
            var data={
                username:username,
                password:encrypt(password),
                email:email,
                lastlogin: new Date()
            }
            db.query(sql,data,(err,result1)=>{
                if (err) return res.status(500).send(err)
                const token=createJWTToken({id:result1.insertId,username:username})
                var LinkVerifikasi=`http://localhost:3000/verified?token=${token}`
                var mailoptions={
                    from:'KOPIKO <fauuzi3@gmail.com>',
                    to:email,
                    subject:'verifikasi email',
                    html:`tolong klik link ini untuk verifikasi :
                    <a href=${LinkVerifikasi}>MInimales verified</a>`
                }
                transporter.sendMail(mailoptions,(err,result2)=>{
                    if (err) return res.status(500).send(err)
                    sql=`select * from user where id=${result1.insertId}`
                    db.query(sql,(err,result3)=>{
                        if (err) return res.status(500).send(err)
                        return res.status(200).send({...result3[0],token,status:true})
                    })
                })

            })
        })
    },
    verifieduser:(req,res)=>{
        const {id}=req.user
        var obj={
            isverified:1
        }
        var sql=`update user set ? where id=${id}`
        db.query(sql,obj,(err,result)=>{
            if(err) return res.status(500).send(err)
            sql=`select * from user where id=${id}`
            db.query(sql,(err,result1)=>{
                if (err) return res.status(500).send(err)
                return res.status(200).send(result1[0])
            })
        })
    },
    sendemailverified:(req,res)=>{
        const {userid,username,email}=req.body
        const token=createJWTToken({id:userid,username:username})
        var LinkVerifikasi=`http://localhost:3000/verified?token=${token}`
        var mailoptions={
            from:'KOPIKO <fauuzi3@gmail.com>',
            to:email,
            subject:'verifikasi email',
            html:`tolong klik link ini untuk verifikasi :
            <a href=${LinkVerifikasi}>MInimales verified</a>`
        }
        transporter.sendMail(mailoptions,(err,result2)=>{
            if (err) return res.status(500).send(err)
            return res.status(200).send({pesan:true})
        })
    },
    login:(req,res)=>{
        const {username,password}=req.query
        var sql=`select * from user where username='${username}' and password='${encrypt(password)}'`
        db.query(sql,(err,result)=>{
            if(err) return res.status(500).send(err)
            if(result.length){
                sql=`select count(*) as jumlahcart from transaction t 
                join transactiondetails td on t.id=td.transactionid 
                where t.userid=${result[0].id} and t.status='oncart'`
                db.query(sql,(err,result1)=>{
                    if(err) return res.status(500).send(err)
                    const token=createJWTToken({id:result[0].id,username:result[0].username})
                    res.status(200).send({...result[0],jumlahcart:result1[0].jumlahcart,status:true,token:token})
                })
            }else{
                return res.status(200).send({status:false})
            }
        })
    },
    keeplogin:(req,res)=>{
        var sql=`select * from user where id=${req.user.id}`
        db.query(sql,(err,result)=>{
            if(err){
                return res.status(500).send(err)
            }
            sql=`select count(*) as jumlahcart from transaction t 
            join transactiondetails td on t.id=td.transactionid 
            where t.userid=${result[0].id} and t.status='oncart'`
            db.query(sql,(err,result1)=>{
                if(err) return res.status(500).send(err)
                const token=createJWTToken({id:result[0].id,username:result[0].username})
                res.status(200).send({...result[0],jumlahcart:result1[0].jumlahcart,token:token})
            })
        })
    },
    
    encryptpass(req,res){
        const {pass}=req.query
        const encryptpass=encrypt(pass)
        res.send(encryptpass)
    }
}