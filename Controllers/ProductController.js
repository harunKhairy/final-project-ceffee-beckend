const { db }=require('./../Connections')
const { uploader }=require('./../Helpers/uploader')
const fs=require('fs')



module.exports={
    addproduct:(req,res)=>{
        try {
            const path='/product'//ini terserah
            const upload=uploader(path,'PROD').fields([{ name: 'image'}])
            upload(req,res,(err)=>{
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
                console.log('lewat')//pada tahap ini foto berhasil di upload
                const { image } = req.files;
                const imagePath = image ? path + '/' + image[0].filename : null;
                const data = JSON.parse(req.body.data); //json.parse mengubah json menjadi object javascript
                data.image=imagePath
                var sql=`insert into products set ?`
                db.query(sql,data,(err,result)=>{
                    if(err) {
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                    sql=`select p.*,c.id as idcat,c.nama as catnama
                            from products p join category c on p.categoryid=c.id 
                            where p.isdeleted=0`
                    db.query(sql,(err,result1)=>{
                        if (err) res.status(500).send(err)
                        return res.status(200).send(result1)
                    })
                })
            })
        } catch (error) {
            return res.status(500).send(error)            
        }
    },
    getproduct:(req,res)=>{
        var sql=`select p.*,c.id as idcat,c.nama as catnama
        from products p join category c on p.categoryid=c.id 
        where p.isdeleted=0`
        db.query(sql,(err,product)=>{
            if (err) res.status(500).send(err)
            sql=`Select id,nama from category`
            db.query(sql,(err,category)=>{
                if (err) res.status(500).send(err)
                return res.send({product,category})
            })
        })
    },
}