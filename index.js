const express=require('express')
const app=express()
const cors=require('cors')
const BodyParser=require('body-parser')
const fs=require('fs') 

const port = 5000

app.use(cors()) 
app.use(BodyParser.urlencoded({extended:false}))
app.use(BodyParser.json())
app.use(express.static('public'))


app.get('/', (req, res) => {
    return res.status(200).send('<h1>API FINALPROJECT</h1>')
})


app.listen(port, ()=> console.log(`API CONNECT DI ${port}`))