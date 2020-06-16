const mysql=require('mysql')

const db=mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'qweasdiop890',
    database : 'ecommta',
    port : '3306'
})

module.exports=db