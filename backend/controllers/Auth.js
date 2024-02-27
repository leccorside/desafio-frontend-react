import User from "../models/UserModel.js";
import argon2 from "argon2";

export const Login = async (req, res) =>{
    const user = await User.findOne({
        where: {
            email: req.body.email
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    const match = await argon2.verify(user.senha, req.body.senha);
    if(!match) return res.status(400).json({msg: "Senha incorreta"});
    req.session.userId = user.uuid;
    const uuid = user.uuid;
    const nome = user.nome;
    const email = user.email;
    const cargo = user.cargo;
    res.status(200).json({uuid, nome, email, cargo});
}

export const Me = async (req, res) =>{
    if(!req.session.userId){
        return res.status(401).json({msg: "Por favor, faça login na sua conta!"});
    }
    const user = await User.findOne({
        attributes:['uuid','nome','email','cargo'],
        where: {
            uuid: req.session.userId
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    res.status(200).json(user);
}

export const logOut = (req, res) =>{
    req.session.destroy((err)=>{
        if(err) return res.status(400).json({msg: "Não é possível sair"});
        res.status(200).json({msg: "você deslogou!"});
    });
}