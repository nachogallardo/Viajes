package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;


import es.altair.bean.Usuarios;
import es.altair.util.SessionProvider;

public class UsuariosDaoImp implements UsuariosDao {
	private String pass = "Libros123$%";
	public boolean validarUsuario(Usuarios usu) {
		boolean correcto = false;
		Usuarios usuario=null;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usuario=(Usuarios) sesion.createSQLQuery("SELECT u FROM Usuarios u WHERE nombre=:n")
					.setParameter("n", usu.getNombre())
					.uniqueResult();
				

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		if(usuario!=null)
			correcto=true;
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

	public void Editar(int idUsuario, String nombre, String nuevaContrasenia, String email, int telefono,
			String direccion,int tipo) {
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.createQuery("UPDATE Usuarios SET nombre=:n, contrasenia=AES_ENCRYPT(:c, :passphrase), email=:e, telefono=:telefono, direccion=:d, tipoUsuario=:tipo where idUsuario=:i " )
					.setParameter("n", nombre)
					.setParameter("c", nuevaContrasenia)
					.setParameter("passphrase", pass)
					.setParameter("e", email)
					.setParameter("telefono", telefono)
					.setParameter("d", direccion)
					.setParameter("tipo", tipo)
					.setParameter("i", idUsuario)
					.executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

	}

	public List<Usuarios> listarUsuarios() {
		List<Usuarios> usuarios= new ArrayList<Usuarios>();
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usuarios= sesion.createQuery("from Usuarios").list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return usuarios;
	}

	public void borrarUsuario(int idUsuario) {
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.createQuery("delete from Usuarios where idUsuario=:i").setParameter("i", idUsuario).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public Usuarios usuarioPorId(int idUsuario) {
		Usuarios usu= new Usuarios();
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usu=(Usuarios)sesion.createQuery("from Usuarios where idUsuario=:i").setParameter("i", idUsuario).uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return usu;
	}

}
