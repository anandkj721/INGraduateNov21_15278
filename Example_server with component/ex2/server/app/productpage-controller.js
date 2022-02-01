const db = require('../db/models');//index.js=>db

const Productpage = db.Productpage;

// 1. select * from Productpage => findAll
exports.findAll = (req, resp) => {
    Productpage.findAll()
        .then(data => resp.json(data))
        .catch(err => {
            resp.status(500)
                .send({
                    message: err.message ||
                        `Something went wrong`
                })
        });
};

// 2. seelct * from Productpage where id=?=>findByPK
exports.findByPk = (req, resp) => {
    const id = parseInt(req.params.id);
    Productpage.findByPk(id)
        .then(data => resp.json(data))
        .catch(err => {
            resp.status(500)
                .send({
                    message: err.message ||
                        `Something went wrong`
                })
        });
};

// //create a new Productpage
exports.createProductpage = (req, resp) => {
    if (!req.body.productName) {
        resp.status(400)
            .send({ message: "Product name must be provided" });
    }
    if (!req.body.productPrice) {
        resp.status(400)
            .send({ message: "Product price must be provided" });
    }
    if (!req.body.productImage) {
        resp.status(400)
            .send({ message: "Product image must be provided" });
    }
    if (!req.body.productDescription) {
        resp.status(400)
            .send({ message: "Product description must be provided" });
    }
    const newProductpage = {
        productId: req.body.productId,
        productName: req.body.productName,
        productPrice: req.body.productPrice,
        productImage: req.body.productImage,
        productDescription: req.body.productDescription,
        craetedAt: new Date(),
        updatedAt: new Date()
    };
    Productpage.create(newProductpage)
        .then(data => resp.send(data))
        .catch(err => {
            resp.status(500)
                .send({ message: err.message })
        })
};

//update by id
exports.updateProductpage = (req, resp) => {
    console.log("updateProductpage " + req.body);
    const c_id = parseInt(req.params.id);

    Productpage.update(req.body, { where: { id: c_id } })
        .then(num => {
            if (num > 0) {
                resp.send({ message: `Productpage with id= ${id} updated successfully` });
            }
            else {
                resp.send({ message: `cannot Productpage with id ${id} updated successfully` });
            }
        })
        .catch(err => {
            resp.status(500)
                .send({ message: err.message || "some error retriving Productpage data" })
        })

}

//delete
exports.deleteProductpage = (req, resp) => {
    const c_id = parseInt(req.params.id);
    Productpage.destroy({ where: { id: c_id } })
        .then(num => {
            if (num == 1) {
                resp.send({ message: `Productpage with id=${id} deleted sucessfully!` });
            }
            else {
                resp.send({ message: `Productpage can not delet with id=${id} deleted sucessfully may be Productpage not found!` });
            }
        })
        .catch((err => {
            resp.status(500).send({
                message: err.message || "could not delete Productpage with id =" + id
            })
        }))
}