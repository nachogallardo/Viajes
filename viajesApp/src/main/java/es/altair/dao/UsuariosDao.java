package es.altair.dao;

import es.altair.bean.Usuarios;

public interface UsuariosDao {

	boolean validarUsuario(Usuarios usu);

	int insertar(Usuarios usu);

	Usuarios comprobarUsuario(String usuario, String password);

}
