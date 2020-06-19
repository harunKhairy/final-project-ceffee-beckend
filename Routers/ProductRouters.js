const express=require('express')
const {ProductController}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()


router.post('/addprod',auth,ProductController.addProduct)
router.get('/getprod',ProductController.getProduct)




module.exports=router