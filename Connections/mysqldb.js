const mysql=require('mysql')

<<<<<<< Updated upstream
const db = mysql.createConnection ({
    host:'localhost',
    user:'root',
    password:'Ha22091984',
    database:'final_project',
    port:'3306'
});
=======
// const db=mysql.createConnection({
//     host : 'localhost',
//     user : 'root',
//     password : 'qweasdiop890',
//     database : 'ecommta',
//     port : '3306'
// })
const db=mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'Ha22091984',
    database : 'final_project',
    port : '3306'
})
>>>>>>> Stashed changes

db.connect(error => {
    if (error) {
        console.log(error)
    } console.log('mySql Connected')
});

module.exports = db