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
}