const express=require('express')
const {ProductController}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()


router.post('/addprod', auth, ProductController.addProduct)
router.get('/category', ProductController.getCategory)
router.get('/getprod', ProductController.getProduct)
router.delete('/deleteprod/:id', ProductController.deleteProduct)
router.put('/editprod/:id', auth, ProductController.editProduct)




module.exports=router