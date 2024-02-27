import express from "express";
import {
    getUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser
} from "../controllers/Users.js";
import { verifyUser, adminOnly } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/usuarios', verifyUser, adminOnly, getUsers);
router.get('/usuarios/:id', verifyUser, adminOnly, getUserById);
router.post('/usuarios', verifyUser, adminOnly, createUser);
router.patch('/usuarios/:id', verifyUser, adminOnly, updateUser);
router.delete('/usuarios/:id', verifyUser, adminOnly, deleteUser);

export default router;