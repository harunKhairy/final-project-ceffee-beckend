const { db }=require('./../Connections')
const { uploader }=require('./../Helpers/uploader')
const fs=require('fs')



module.exports={
    addProduct: (req, res) => {
        const path = '/product'
            const upload = uploader(path, 'PROD').fields([{ name : 'image' }]);
            upload(req, res, (err) => {
                const { image } = req.files;
                const { nama, harga } = JSON.parse(req.body.data)
                const imagePath = image ? `${path}/${image[0].filename}` : null
        
                let sql = `INSERT INTO products (nama, harga, image) VALUES ('${nama}', ${harga}, '${imagePath}')`
                db.query(sql, req.body, (err, result) => {
                    if(err){
                        fs.unlinkSync(`./public${imagePath}`)
                        res.status(500).send(err.message)
                    }
                    res.status(200).send(result)
                })
            })
        },
    getProduct: (req, res) => {
        var sql = `select * from products`;
        db.query(sql, (err, result) => {
            if (err) res.status(500).send(err);
            return res.status(200).send(result);
        });
     },
     deleteProduct:(req,res)=>{
        const {id}=req.params//req.params.id
        var sql=`select * from products where id=${id}`
        db.query(sql,(err,result)=>{
            if (err) res.status(500).send(err)
            if(result.length){
                var obj={
                    isdeleted:1,
                    image:null
              }
                sql=`Update products set ? where id=${id}`         
                
                db.query(sql,obj,(err,result2)=>{
                    if (err) res.status(500).send(err)
                    console.log(result2)
                    if(result[0].image){
                        fs.unlinkSync('./public'+result[0].image)
                    }
                    sql=`select p.*,c.id as idcat,c.nama as catname 
                    from products p join category c on p.categoryid=c.id 
                    where p.isdeleted=0`
                    db.query(sql,(err,result1)=>{
                        if (err) res.status(500).send(err)
                        return res.status(200).send(result1)
                    })
                })
            }else{
                return res.status(500).send({message:'item not found'})
            }
        })
    }
}