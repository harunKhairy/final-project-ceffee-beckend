const express=require('express')
const {TransactionControllers}=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()

router.post('/sendtocart',TransactionControllers.sendToCart)
router.get('/getcartdata/:id',TransactionControllers.getDataCart)
router.get('/deletecart/:id',TransactionControllers.deleteCart)
router.get('/minqty/:id',TransactionControllers.minQty)
router.get('/plusqty/:id',TransactionControllers.plusQty)
router.get('/gettotalcart/:id',TransactionControllers.getTotalCart)
router.post('/checkout/:transactionid',TransactionControllers.checkout)
router.get('/transactionhistory/:userid',TransactionControllers.transactionhistory)
router.get('/transactiondetail/:transactionid',TransactionControllers.gettransactiondetail)
router.get('/alltransactions',TransactionControllers.getalltransactions)
router.get('/verifypayment/:transactionid',TransactionControllers.verifypayment)
router.get('/processorder/:transactionid',TransactionControllers.processorder)


module.exports=router