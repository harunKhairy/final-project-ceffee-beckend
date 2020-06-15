const express=require('express')
const { AuthController }=require('./../Controllers')
const router=express.Router()

router.post('/register', AuthController.register)