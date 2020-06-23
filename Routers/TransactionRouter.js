const express=require('express')
const { TransactionController }=require('./../Controllers')
const {auth}=require('./../Helpers/Auth')

const router=express.Router()

router.post('/sendtocart' ,TransactionController.sendToCart)
router.get('/getcartdata/:id',TransactionController.getDataCart)
router.get('/deletecart/:id',TransactionController.deleteCart)
router.get('/minqty/:id',TransactionController.minQty)
router.get('/plusqty/:id',TransactionController.plusQty)
router.get('/gettotalcart/:id',TransactionController.getTotalCart)
router.post('/checkout/:transactionid',TransactionController.checkout)
router.get('/transactionhistory/:userid',TransactionController.transactionhistory)
router.get('/transactiondetail/:transactionid',TransactionController.gettransactiondetail)
router.get('/alltransactions',TransactionController.getalltransaction)
router.get('/verifypayment/:transactionid',TransactionController.verifypayment)
router.get('/processorder/:transactionid',TransactionController.processorder)


module.exports=router