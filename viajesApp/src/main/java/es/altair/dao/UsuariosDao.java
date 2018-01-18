package es.altair.dao;

import es.altair.bean.Usuarios;

public interface UsuariosDao {

	boolean validarEmail(Usuarios usu);

	int insertar(Usuarios usu);

}
