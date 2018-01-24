package es.altair.dao;

import org.hibernate.Session;


import es.altair.bean.Usuarios;
import es.altair.util.SessionProvider;

public class UsuariosDaoImp implements UsuariosDao {
	private String pass = "Libros123$%";
	public boolean validarUsuario(Usuarios usu) {
		boolean correcto = true;
		

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			if ((Usuarios) sesion.createQuery("From Usuario Where nombre=:u")
					.setParameter("u", usu.getNombre())
					.uniqueResult() != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return correcto;
		
	}

	public int insertar(Usuarios usu) {
		int filas = 0;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			filas = sesion
					.createSQLQuery("INSERT INTO usuarios (nombre, contrasenia, email, telefono, direccion,tipoUsuario)"
							+ "values (:n, AES_ENCRYPT(:p, :passphrase), :e, :t, :d, :tipo)")
					.setParameter("n", usu.getNombre()).setParameter("p", usu.getContrasenia())
					.setParameter("passphrase", pass).setParameter("e", usu.getEmail())
					.setParameter("t", usu.getTelefono()).setParameter("d", usu.getDireccion()).setParameter("tipo", usu.getTipoUsuario()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return filas;
	}

	public Usuarios comprobarUsuario(String usuario, String password) {
		Usuarios usu = null;

		// SessionFactory sf = new Configuration().configure().buildSessionFactory();
		// Session sesion = sf.openSession();

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usu = (Usuarios) sesion
					.createQuery(
							"SELECT u FROM Usuarios u WHERE nombre=:n " + "AND contrasenia=AES_ENCRYPT(:p, :passphrase)")
					.setParameter("n", usuario).setParameter("p", password).setParameter("passphrase", pass)
					.uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usu;
	}

}
