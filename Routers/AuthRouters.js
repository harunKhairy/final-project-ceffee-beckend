const express=require('express')
const { AuthController }=require('./../Controllers')
const {auth}=require('./../helpers/Auth')

const router=express.Router()

router.post('/register', AuthController.register)
router.get('/verified',auth,AuthController.verifieduser)
router.post('/sendemailverified',AuthController.sendemailverified)
router.get('/login',AuthController.login)
router.get('/keeplogin',auth,AuthController.keeplogin)

module.exports=router