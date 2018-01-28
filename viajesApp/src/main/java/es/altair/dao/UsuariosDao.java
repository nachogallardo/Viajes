package es.altair.dao;

import java.util.List;

import es.altair.bean.Usuarios;

public interface UsuariosDao {

	boolean validarUsuario(Usuarios usu);

	int insertar(Usuarios usu);

	Usuarios comprobarUsuario(String usuario, String password);

	void Editar(int idUsuario, String nombre, String nuevaContrasenia, String email, int telefono, String direccion,int tipo);
	List<Usuarios> listarUsuarios();

	void borrarUsuario(int idUsuario);
	Usuarios usuarioPorId(int idUsuario);
}
