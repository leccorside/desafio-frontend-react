import User from "../models/UserModel.js";

export const verifyUser = async (req, res, next) =>{
    if(!req.session.userId){
        return res.status(401).json({msg: "Por favor, faça login na sua conta!"});
    }
    const user = await User.findOne({
        where: {
            uuid: req.session.userId
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    req.userId = user.id;
    req.cargo = user.cargo; 
    next();
}

export const adminOnly = async (req, res, next) =>{
    const user = await User.findOne({
        where: {
            uuid: req.session.userId
        }
    });
    if(!user) return res.status(404).json({msg: "Usuário não encontrado"});
    if(user.cargo !== "admin") return res.status(403).json({msg: "Acesso proibido"});
    next();
}