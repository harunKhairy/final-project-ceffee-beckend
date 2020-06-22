const {db}=require('./../Connections')
const fs=require('fs') 
const hexpass=require('./../Helpers/crypto')
const transporter=require('./../Helpers/mailer')
const {createJWTToken}=require('./../Helpers/jwt')

///============TEST==========\\\
//  test dari joni

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
                password:hexpass(password),
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
                        subject:'Verifikasi Email',
                        html:`Klik Link untuk verifikasi : 
                        <a href=${LinkVerifikasi} > Join Kopi </a>`
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
                subject:'Verifikasi Email',
                html:`Klik Link untuk verifikasi : 
                <a href=${LinkVerifikasi} > Join Kopi </a>`
            }
        transporter.sendMail(mailoptions,(err,result2)=>{
            if (err) return res.status(500).send(err)
            return res.status(200).send({pesan:true})
        })
    },
    login:(req,res)=>{
        const {username,password}=req.query
        var sql=`select * from user where username='${username}' and password='${hexpass(password)}'`
        db.query(sql,(err,result)=>{
            if(err) return res.status(500).send(err)
            if(result.length){
                sql=`select count(*) as jumlahcart from transactions t 
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
            sql=`select count(*) as jumlahcart from transactions t 
            join transactiondetails td on t.id=td.transactionid 
            where t.userid=${result[0].id} and t.status='oncart'`
            db.query(sql,(err,result1)=>{
                if(err) return res.status(500).send(err)
                const token=createJWTToken({id:result[0].id,username:result[0].username})
                res.status(200).send({...result[0],jumlahcart:result1[0].jumlahcart,token:token})
            })
        })
    },


    // !====================================Harun==================================================

    encryptpass(req,res){
        const {pass}=req.query
        const encryptpass=encrypt(pass)
        res.send(encryptpass)
    },

    login: (req, res) => {
        const { username, password } = req.query
        let sql = `select * from user where username='${username}' and password='${encrypt(password)}'`
        db.query(sql, (error, result) => {
            if (error) return res.status(500).send(error)
            if (result.length) {
                sql = 
                    `select count(*) as jumlahcart
                    from transaction t join transactiondetails td on t.id=td.transactionid
                    where t.userid=${result[0].id} and t.status='oncart'`
                db.query( sql, (error, result1) => {
                    if (error) return res.status(500).send(error)
                    const token = createJWTToken ({
                        id: result[0].id,
                        username: result[0].username
                    })
                    res.status(200).send({
                        ...result[0],
                        jumlahcart: result1[0].jumlahcart,
                        status: true,
                        token: token
                    })
                })
            } else {
                return res.status(200).send({ status: false })
            }
        })
    },

    register: (req, res) => {
        const { username, email, password } = req.body
        let sql = `select * from user where username ='${username}'`         // let sql = `select * from users where username = '${username}' or email = '${email}'`
        db.query (sql, (error, result) => {
            if (error) return res.status(500).send(error)
            if (result.length) {
                return res.status(200).send({ status: false })
            }
            sql = `insert into user set ?`
            let data = {
                username: username,
                password: encrypt(password),
                email: email,
                lastlogin: new Date()
            }
            db.query (sql, data, (error, result1) => {
                if (error) return res.status(500).send(error)
                const token = createJWTToken ({
                    id: result1.insertId,
                    username: username
                })
                let LinkVerifikasi = `http://localhost:3000/verified?token=${token}`
                let mailOptions = {
                    from: 'Harun <harun.khairy@gmail.com>',
                    to: email,
                    subject: 'Tugas Akhir',
                    html : 
                        `tolong klik link ini untuk verifikasi :
                        <a href=${LinkVerifikasi}>MInimales verified</a>`
                }
                transporter.sendMail(mailOptions, (error, result2) => {
                    if (error) return res.status(500).send(error)
                    sql = `select * from user where id=${result1.insertId}`
                    db.query (sql, (error, result3) => {
                        if (error) return res.status(500).send(error)
                        return res.status(200).send({ 
                            ...result3[0],
                            token,
                            status: true
                        })
                    })
                })
            })
        })
    },

    verified: (req, res) => {
        const { id } = req.user
        let obj = { isverified: 1 }
        let sql = `update user set ? where id = ${id}`
        db.query (sql, obj, (error, result) => {
            if (error) return res.status(500).send(error)
            sql = `select * from user where id = ${id}`
            db.query (sql, (error, result1) => {
                if (error) return res.status(500).send(error)
                return res.status(200).send(result1[0])
            })
        })
    },

    sendEmailVerified: (req, res) => {
        const { userid, username, email } = req.body
        const token = createJWTToken ({
            id: userid,
            username: username
        })
        let LinkVerifikasi = `http://localhost:3000/verified?token=${token}`
        let mailOptions = {
            from: 'Harun <harun.khairy@gmail.com>',
            to: email,
            subject: 'Misi Level A verified ulang',
            html:
                `tolong klik link ini untuk verifikasi :
                <a href=${LinkVerifikasi}>Minimales verified</a>`
        }
        transporter.sendMail(mailOptions, (error, result) => {
            if (error) return res.status(500).send(error)
            return res.status(200).send ({ message: true})
        })
    },

    

    keepLogin: (req, res) => {
        let sql = `select * from user where id=${req.user.id}`
        db.query(sql, (error, result) => {
            if (error) return res.status(500).send(error)
            sql = 
                `select count(*) as jumlahcart from transaction t
                join transactiondetails td on t.id=td.tracsactionid
                where t.userid=${result[0].id} and t.status='oncart'`
            db.query (sql, (error, result1) => {
                if (error) return res.status(500).send(error)
                const token = createJWTToken({
                    id: result[0].id,
                    username: result[0].username
                })
                res.status(200).send({
                    ...result[0],
                    jumlahcart: result1[0].jumlahcart,
                    token: token
                })
            })
        })
    },
}