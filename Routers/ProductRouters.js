const express=require('express')
const {ProductController}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()

router.post('/addprod',ProductController.addproduct)
router.get('/allproduct',ProductController.getproduct)



module.exports=router