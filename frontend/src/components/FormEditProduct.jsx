import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

const FormEditProduct = () => {
  const [nome, setNome] = useState("");
  const [valor, setValor] = useState("");
  const [quantidade, setQtd] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();
  const { id } = useParams();

  useEffect(() => {
    const getProductById = async () => {
      try {
        const response = await axios.get(
          `http://localhost:5000/produtos/${id}`
        );
        setNome(response.data.nome);
        setValor(response.data.valor);
        setQtd(response.data.quantidade);
      } catch (error) {
        if (error.response) {
          setMsg(error.response.data.msg);
        }
      }
    };
    getProductById();
  }, [id]);

  const updateProduct = async (e) => {
    e.preventDefault();
    try {
      await axios.patch(`http://localhost:5000/produtos/${id}`, {
        nome: nome,
        valor: valor,
        quantidade: quantidade,
      });
      navigate("/produtos");
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };

  return (
    <div>
      <h1 className="title">Produtos</h1>
      <h2 className="subtitle">Editar produto</h2>
      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={updateProduct}>
              <p className="has-text-centered">{msg}</p>
              <div className="field">
                <label className="label">Nome</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={nome}
                    onChange={(e) => setNome(e.target.value)}
                    placeholder="Nome do produto"
                  />
                </div>
              </div>
              <div className="field">
                <label className="label">Valor</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={valor}
                    onChange={(e) => setValor(e.target.value)}
                    placeholder="R$ Valor"
                  />
                </div>
              </div>

              <div className="field">
                <label className="label">Quantidade</label>
                <div className="control">
                  <input
                    type="number"
                    className="input"
                    value={quantidade}
                    onChange={(e) => setQtd(e.target.value)}
                    placeholder="1"
                  />
                </div>
              </div>

              <div className="field">
                <div className="control">
                  <button type="submit" className="button is-success">
                    Atualizar
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FormEditProduct;
