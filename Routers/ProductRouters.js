const express=require('express')
const ProductController=require('./../Controllers')

const router=express.Router()

router.post('/addprod',ProductController.addproduct)



module.exports=router