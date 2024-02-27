import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const FormAddProduct = () => {
  const [nome, setNome] = useState("");
  const [valor, setValor] = useState("");
  const [quantidade, setQtd] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const saveProduct = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5000/produtos", {
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
      <h2 className="subtitle">Add novo produto</h2>
      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={saveProduct}>
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
                    type="text"
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
                    Salvar
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

export default FormAddProduct;
