import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";

const ProductList = () => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    getProducts();
  }, []);

  const getProducts = async () => {
    const response = await axios.get("http://localhost:5000/produtos");
    setProducts(response.data);
  };

  const deleteProduct = async (productId) => {
    await axios.delete(`http://localhost:5000/produtos/${productId}`);
    getProducts();
  };

  return (
    <div>
      <h1 className="title">Produtos</h1>
      <h2 className="subtitle">Lista de produtos</h2>
      <Link to="/produtos/add" className="button is-primary mb-2">
        Add Novo
      </Link>
      <table className="table is-striped is-fullwidth">
        <thead>
          <tr>
            <th>No</th>
            <th>Nome do produto</th>
            <th>Valor</th>
            <th>Quantidade</th>
            <th>Data de criação</th>
            <th>Criador</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {products.map((product, index) => (
            <tr key={product.uuid}>
              <td>{index + 1}</td>
              <td>{product.nome}</td>
              <td>R${product.valor}</td>
              <td>{product.quantidade}</td>
              <td>{product.createdAt}</td>
              <td>{product.user.nome}</td>
              <td>
                <Link
                  to={`/produtos/edit/${product.uuid}`}
                  className="button is-small is-info"
                >
                  Editar
                </Link>
                <button onClick={() => {if(window.confirm('Deseja deletar este produto?')){deleteProduct(product.uuid)};}}
                  className="button is-small is-danger"
                >
                  Deletar
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ProductList;
