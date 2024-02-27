import React, { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

const Userlist = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    getUsers();
  }, []);

  const getUsers = async () => {
    const response = await axios.get("http://localhost:5000/usuarios");
    setUsers(response.data);
  };

  const deleteUser = async (userId) => {
    await axios.delete(`http://localhost:5000/usuarios/${userId}`);
    getUsers();
  };

  return (
    <div>
      <h1 className="title">Usuários</h1>
      <h2 className="subtitle">Lista de usuários</h2>
      <Link to="/usuarios/add" className="button is-primary mb-2">
        Add Novo
      </Link>
      <table className="table is-striped is-fullwidth">
        <thead>
          <tr>
            <th>No</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Cargo</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user, index) => (
            <tr key={user.uuid}>
              <td>{index + 1}</td>
              <td>{user.nome}</td>
              <td>{user.email}</td>
              <td>{user.cargo}</td>
              <td>
                <Link
                  to={`/usuarios/edit/${user.uuid}`}
                  className="button is-small is-info"
                >
                  Editar
                </Link>
                <button onClick={() => {if(window.confirm('Deseja deletar este usuário?')){deleteUser(user.uuid)};}}
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

export default Userlist;
