import User from "../models/UserModel.js";
import argon2 from "argon2";

export const getUsers = async(req, res) =>{
    try {
        const response = await User.findAll();
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const getUserById = async(req, res) =>{
    try {
        const response = await User.findOne({
            attributes:['uuid','nome','email','senha','cargo'],
            where: {
                uuid: req.params.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({msg: error.message});
    }
}

export const createUser = async(req, res) =>{
    const {nome, email, senha, confSenha, cargo} = req.body;
    if(senha !== confSenha) return res.status(400).json({msg: "Senha e confirmação de senha não coincidem"});
    const hashPassword = await argon2.hash(senha);
    try {
        await User.create({
            nome: nome,
            email: email,
            senha: hashPassword,
            cargo: cargo
        });
        res.status(201).json({msg: "Usuário registrado com sucesso!"});
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}

export const updateUser = async(req, res) =>{
    const user = await User.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    const {nome, email, senha, confSenha, cargo} = req.body;
    let hashPassword;
    if(senha === "" || senha === null){
        hashPassword = user.senha
    }else{
        hashPassword = await argon2.hash(senha);
    }
    if(senha !== confSenha) return res.status(400).json({msg: "Senha e confirmação de senha não coincidem"});
    try {
        await User.update({
            nome: nome,
            email: email,
            senha: hashPassword,
            cargo: cargo
        },{
            where:{
                id: user.id
            }
        });
        res.status(200).json({msg: "Usuário atualizado com sucesso!"});
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}

export const deleteUser = async(req, res) =>{
    const user = await User.findOne({
        where: {
            uuid: req.params.id
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    try {
        await User.destroy({
            where:{
                id: user.id
            }
        });
        res.status(200).json({msg: "Usuário deletado com sucesso!"});
    } catch (error) {
        res.status(400).json({msg: error.message});
    }
}