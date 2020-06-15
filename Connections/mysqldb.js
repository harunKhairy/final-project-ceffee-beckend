const mysql=require('mysql')

const db=mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'modarkoee3',
    database : 'ecommta',
    port : '3306'
})

module.exports=db