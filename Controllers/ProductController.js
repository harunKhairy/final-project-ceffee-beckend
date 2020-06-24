const { db }=require('./../Connections')
const { uploader }=require('./../Helpers/uploader')
const fs=require('fs')



module.exports={
    

    getProduct: (req, res) => {
        let sql = 
            `select p.*,c.id as idcat, c.name as catname
            from products p join category c on p.categoryid=c.id
            where p.isdeleted=0`
        db.query (sql, (error, product) => {
            if (error) res.status(500).send(error)
            sql = `select id, name from category`
            db.query (sql, (error, category) => {
                if (error) res.status(500).send(error)
                return res.send({ product, category})
            })
        })
    },

    addProduct: (req, res) => {
        try {
            const path="/product";
            const upload = uploader(path, 'PROD').fields([{ name: 'image' }]);
            upload (req, res, (error) => {
                if (error) {
                    return res.status(500).json({ 
                        message: 'Upload image failed', 
                        error: error.message 
                    });
                } ;
                console.log('add foto berhasil')
                const { image } = req.files
                const imagePath = image ? path + '/' + image[0].filename : null
                const data = JSON.parse(req.body.data)
                data.image = imagePath
                let sql = `insert into products set ?`
                db.query (sql, data, (error, result) => {
                    if (error) {
                        fs.unlinkSync('./public' + imagePath)
                        return res.status(500).json({ 
                            message: "There's an error on the server. Please contact the administrator.",
                            error: error.message
                        })
                    }
                    sql = `select p.*,c.id as idcat, c.name as catname
                        from products p join category c on p.categoryid=c.id
                        where p.isdeleted=0`
                    db.query (sql, (error, result1) => {
                        if (error) res.status(500).send(error)
                        return res.status(200).send(result1)
                    })
                })
            })
        } catch (error) {
            return res.status(500).send(error)
        }
    },

    getCategory: (req, res) => {
        let sql = `select id, name from category`
        db.query (sql, (error, result) => {
            if (error) res.status(500).send(error)
            return res.status(200).send(result)
        })
    },

    deleteProduct: (req, res) => {
        const { id } = req.params
        let sql = `select * from products where id=${id}`
        db.query (sql, (error, result) => {
            if (error) res.status(500).send(err)
            if (result.length) {
                let obj = { isdeleted: 1, image: null }
                sql = `update products set ? where id=${id}`
                db.query (sql, obj, (error, result2) => {
                    if (error) res.status(500).send(error)
                    console.log(result2)
                    if (result[0].image) {
                        fs.unlinkSync('./public' + result[0].image)
                    }
                    sql = `select p.*,c.id as idcat,c.name as catname
                        from products p join category c on p.categoryid=c.id 
                        where p.isdeleted=0`
                    db.query (sql, (error, result1) => {
                        if (error) res.status(500).send(error)
                        return res.status(200).send(result1)
                    })
                })
            } else {
                return res.status(500).send({ message: 'idnya tidak ada'})
            }
        })
    },

    detailProduct: (req, res) => {
        const { id } = req.params
        let sql = `select * from products where id=${id}`
        db.query(sql,(err,result)=>{
            if(err) res.status(500).send(err)
            if(result.length){
                res.status(200).send(result[0])
            }else{
                res.status(500).send({message:'product not found'})
            }
        })
    }
    ,

    editProduct: (req, res) => {
        const { id } = req.params
        let sql = `select * from products where id=${id}`
        db.query (sql, (error, result) => {
            if (error) res.status(500).send(error)
            if (result.length) {
                try {
                    const path = '/product'
                    const upload = uploader(path, 'PROD').fields([{ name: 'image' }])
                    upload (req, res, (error) => {
                        if (error) {
                            return res.status(500).json({
                                message: "Upload post picture failed !",
                                error: error.message
                            })
                        }
                        console.log('edit foto berhasil')
                        const { image } = req.files;
                        const imagePath = image ? path + '/' + image[0].filename : null
                        const data = JSON.parse(req.body.data)

                        if (imagePath) {
                            data.image = imagePath
                        }
                        sql = `update products set ? where id =${id}`
                        db.query(sql, data, (error, result1) => {
                            if (error) {
                                if (imagePath) {
                                    fs.unlinkSync('./public' + imagePath)
                                }
                                return res.status(500).json({
                                    message: "There's an error on the server. Please contact the administrator.",
                                    error: error.message
                                })
                            }
                            if (imagePath) {
                                if (result[0].image) {
                                    fs.unlinkSync('./public' + result[0].image)
                                }
                            }
                            sql = `select p.*,c.id as idcat,c.name as catname
                                from products p join category c on p.categoryid=c.id 
                                where p.isdeleted=0`
                            db.query(sql, (error, result2) => {
                                if (error) res.status(500).send(error)
                                return res.status(200).send(result2)
                            })
                        })
                    })
                } catch (error) {
                    return res.status(500).send({ message: 'idnya tidak ada' })
                }
            }
        })
    },
    getDetailKelas:(req, res)=>{
        var id=req.params.selectedId
        var sql=`SELECT p.id, p.judul, p.idkategori, p.deskripsi, p.bab, p.materi FROM product p join category c on p.idkategori=c.idkat where p.id=${id}`
        mysql.query(sql, (err, res1)=>{
            if(err){
                return res.status(500).send(err)
            }
            return res.status(200).send(res1)
        })
    },

    getPageKelas:(req, res)=>{
        const sqlCount=`SELECT COUNT(*) AS count FROM product` 
        let dataCount
        mysql.query(sqlCount, (err, result)=>{
            if(err) res.status(500).send(err)
            dataCount=result[0].count 

            const page=parseInt(req.params.page)||1 
            const pageSize=9
            const pager=paginate(dataCount, page, pageSize)

            let offset 
            if(page === 1){
                offset=0
            }else{
                offset=pageSize * (page - 1)
            }

            sql=`SELECT * FROM product p join category c on p.idkategori=c.idkat LIMIT ? OFFSET ?`
            mysql.query(sql, [pageSize, offset], (err1, result2)=>{
                if(err) res.status(500).send(err1)
                const pageOfData=result2
                return res.status(200).send({pageOfData, pager})
            })
        })
    },
}