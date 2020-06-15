const nodemailer=require('nodemailer')

var transporter=nodemailer.createTransport({
    service:'gmail',
    auth:{
        user:'fauuzi3@gmail.com',
        pass:'peindndtqxenssxjp'
    },
    tls:{
        rejectUnauthorized:false
    }
})

module.exports=transporter
