const express=require('express')
const { AuthController }=require('./../Controllers')
const {auth}=require('./../helpers/Auth')

const router=express.Router()

router.get('/enpass', AuthController.crypto)
router.post('/register', AuthController.register)
router.put('/verifikasimail', AuthController.verifikasimail)


module.exports=router