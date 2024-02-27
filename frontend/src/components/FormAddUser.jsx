import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const FormAddUser = () => {
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [confSenha, setConfSenha] = useState("");
  const [cargo, setCargo] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const saveUser = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5000/usuarios", {
        nome: nome,
        email: email,
        senha: senha,
        confSenha: confSenha,
        cargo: cargo,
      });
      navigate("/usuarios");
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };
  return (
    <div>
      <h1 className="title">Usuários</h1>
      <h2 className="subtitle">Add novo usuário</h2>
      <div className="card is-shadowless">
        <div className="card-content">
          <div className="content">
            <form onSubmit={saveUser}>
              <p className="has-text-centered">{msg}</p>
              <div className="field">
                <label className="label">Nome</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={nome}
                    onChange={(e) => setNome(e.target.value)}
                    placeholder="Name"
                  />
                </div>
              </div>
              <div className="field">
                <label className="label">Email</label>
                <div className="control">
                  <input
                    type="text"
                    className="input"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Email"
                  />
                </div>
              </div>
              <div className="field">
                <label className="label">Senha</label>
                <div className="control">
                  <input
                    type="password"
                    className="input"
                    value={senha}
                    onChange={(e) => setSenha(e.target.value)}
                    placeholder="******"
                  />
                </div>
              </div>
              <div className="field">
                <label className="label">Confirme a senha</label>
                <div className="control">
                  <input
                    type="password"
                    className="input"
                    value={confSenha}
                    onChange={(e) => setConfSenha(e.target.value)}
                    placeholder="******"
                  />
                </div>
              </div>

              <div className="field">
                <label className="label">Cargo</label>
                <div className="control">
                  <div className="select is-fullwidth">
                    <select
                      value={cargo}
                      onChange={(e) => setCargo(e.target.value)}
                    >
                      <option value="">Selecione o cargo</option>
                      <option value="admin">Admin</option>
                      <option value="user">User</option>
                    </select>
                  </div>
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

export default FormAddUser;
