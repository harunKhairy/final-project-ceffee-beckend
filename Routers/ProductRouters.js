const express=require('express')
const {ProductController}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()

router.post('/addprod',ProductController.addproduct)



module.exports=router