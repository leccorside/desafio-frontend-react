import express from "express";
import {
    getProducts,
    getProductById,
    createProduct,
    updateProduct,
    deleteProduct
} from "../controllers/Products.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get('/produtos', verifyUser, getProducts);
router.get('/produtos/:id', verifyUser, getProductById);
router.post('/produtos', verifyUser, createProduct);
router.patch('/produtos/:id', verifyUser, updateProduct);
router.delete('/produtos/:id', verifyUser, deleteProduct);

export default router;