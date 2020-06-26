const nodemailer=require('nodemailer')

var transporter=nodemailer.createTransport({
    service:'gmail',
    auth:{
        user:'fauuzi3@gmail.com',
        pass:'eindndtqxenssxjp'
    },
    tls:{
        rejectUnauthorized:false
    }
})
//asd//
module.exports=transporter
