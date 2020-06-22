const mysql=require('mysql')

// const db=mysql.createConnection({
//     host : 'localhost',
//     user : 'root',
//     password : 'modarkoee3',
//     database : 'ecommta',
//     port : '3306'
// })

const db=mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'Ha22091984',
    database : 'from_aldo',
    port : '3306'
})

module.exports=db