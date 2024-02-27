import Product from "../models/ProductModel.js";
import User from "../models/UserModel.js";
import {Op} from "sequelize";

export const getProducts = async (req, res) =>{
    try {
        let response;
        if(req.cargo === "admin"){
            response = await Product.findAll({
                attributes:['uuid','nome','valor','quantidade'],
                include:[{
                    model: User,
                    attributes:['nome','email']
                }]
            });
        }else{
            response = await Product.findAll({
                attributes:['uuid','nome','valor','quantidade'],
                where:{
                    userId: req.userId
                },
                include:[{
                    model: User,
                    attributes:['nome','email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const getProductById = async(req, res) =>{
    try {
        const product = await Product.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!product) return res.status(404).json({msg: "Dados não encontrados"});
        let response;
        if(req.cargo === "admin"){
            response = await Product.findOne({
                attributes:['uuid','nome','valor','quantidade'],
                where:{
                    id: product.id
                },
                include:[{
                    model: User,
                    attributes:['nome','email']
                }]
            });
        }else{
            response = await Product.findOne({
                attributes:['uuid','nome','valor','quantidade'],
                where:{
                    [Op.and]:[{id: product.id}, {userId: req.userId}]
                },
                include:[{
                    model: User,
                    attributes:['nome','email']
                }]
            });
        }
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const createProduct = async(req, res) =>{
    const {nome, valor, quantidade} = req.body;
    try {
        await Product.create({
            nome: nome,
            valor: valor,
            quantidade: quantidade,
            userId: req.userId
        });
        res.status(201).json({msg: "Produto criado com sucesso!"});
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const updateProduct = async(req, res) =>{
    try {
        const product = await Product.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!product) return res.status(404).json({msg: "Os dados não foram salvos"});
        const {nome, valor, quantidade,} = req.body;
        if(req.cargo === "admin"){
            await Product.update({nome, valor, quantidade},{
                where:{
                    id: product.id
                }
            });
        }else{
            if(req.userId !== product.userId) return res.status(403).json({msg: "Acesso negado"});
            await Product.update({nome, valor, quantidade},{
                where:{
                    [Op.and]:[{id: product.id}, {userId: req.userId}]
                }
            });
        }
        res.status(200).json({msg: "Produto atualizado com sucesso!"});
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const deleteProduct = async(req, res) =>{
    try {
        const product = await Product.findOne({
            where:{
                uuid: req.params.id
            }
        });
        if(!product) return res.status(404).json({msg: "Dados não encontrados"});
        const {nome, valor, quantidade} = req.body;
        if(req.cargo === "admin"){
            await Product.destroy({
                where:{
                    id: product.id
                }
            });
        }else{
            if(req.userId !== product.userId) return res.status(403).json({msg: "Acesso proibido"});
            await Product.destroy({
                where:{
                    [Op.and]:[{id: product.id}, {userId: req.userId}]
                }
            });
        }
        res.status(200).json({msg: "Produto deletado com sucesso!"});
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}