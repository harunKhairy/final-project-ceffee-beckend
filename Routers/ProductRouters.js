const express=require('express')
const {ProductController}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()


router.post('/addprod',auth,ProductController.addproduct)
router.get('/getprod',ProductController.getproduct)




module.exports=router