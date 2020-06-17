const {db}=require('./../Connections')
const fs=require('fs') 
const hexpass=require('./../Helpers/crypto')
const transporter=require('./../Helpers/mailer')

///============TEST==========\\\
//  test dari joni

module.exports={
    crypto: (req,res)=>{
        const hashpassword = hexpass(req.query.password)
        res.send({encryptan: hashpassword, panjangencypt: hashpassword.length})
    },
    register: (req,res)=>{
        var {username, password, email}=req.body

        var sql=`SELECT * FROM user WHERE username='${username}'`
        db.query(sql, (err, result)=>{
            if(err) return res.status(500).send({err})
            if(result.length>0) return res.status(200).send({status:'error', message: 'Akun sudah terdaftar'})
            else{
                var hashpassword=hexpass(password)
                var datauser={
                    username,
                    email,
                    password:hashpassword,
                    isverified:'0',
                    role:'2',
                    lastlogin:new Date()
                }
                sql=`INSERT INTO user SET ?`
                db.query(sql, datauser, (err1, res1)=>{
                    if(err1) return res.status(500).send({err1})
                    var LinkVerifikasi=`http://localhost:3000/verified?username=${username}&password=${hashpassword}`
                    var mailoptions={
                        from:'KOPIKO <fauuzi3@gmail.com>',
                        to:email,
                        subject:'Verifikasi Email',
                        html:`Klik Link untuk verifikasi : 
                        <a href=${LinkVerifikasi} > Join Kopi </a>`
                    }
                    transporter.sendMail(mailoptions, (err2, res2)=>{
                        if(err2) return res.status(500).send({err2})
                        return res.status(200).send({username, email, isverified:'unverified'})
                    })
                })
            }
        })
    },
    verifikasimail: (req,res)=>{
        var {username, password}=req.body
        var sql=`SELECT * FROM user WHERE username='${username}'`
        db.query(sql, (err, results)=>{
            if(err) return res.status(500).send({status:'error',err})
            if(results.length===0){
                return res.status(500).send({status:'error', err1:'User tidak ditemukan'})
            }
            sql=`UPDATE user SET isverified='1' WHERE username='${username}' and password='${password}'`
            db.query(sql, (err, results2)=>{
                if(err){
                    return res.status(500).send({status:'error', err})
                }else{
                    return res.status(200).send({username:results[0].username, isverified:'1'})
                }
            })
        })
    }, 
    login:(req,res)=>{
        const {username,password}=req.query
        var sql=`SELECT * FROM user WHERE username='${username} and password='${hexpass(password)}'` 
        db.query(sql,(err,result)=>{
            if(err){
                return res.status(500).send(err)
            }else{
                return res.status(200).send({status:false})
            }
        })
     },
}