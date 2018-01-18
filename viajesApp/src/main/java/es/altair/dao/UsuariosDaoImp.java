package es.altair.dao;

import org.hibernate.Session;

import es.altair.bean.Usuarios;
import es.altair.util.SessionProvider;

public class UsuariosDaoImp implements UsuariosDao {

	public boolean validarEmail(Usuarios usu) {
		boolean correcto = true;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			if ((Usuarios) sesion.createQuery("From Usuario Where email=:e")
					.setParameter("e", usu.getEmail())
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
							+ "values (:l, AES_ENCRYPT(:p, :passphrase), :e, :t, :d,:tipo)")
					.setParameter("l", usu.getNombre()).setParameter("p", usu.getContrasenia())
					.setParameter("passphrase", "altair").setParameter("e", usu.getEmail())
					.setParameter("t", usu.getTelefono()).setParameter("d", usu.getDireccion()).setParameter("tipo", usu.getTipoUsuario()).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return filas;
	}

}
