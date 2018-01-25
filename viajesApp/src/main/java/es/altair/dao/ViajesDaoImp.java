package es.altair.dao;

import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Usuarios;
import es.altair.bean.Viajes;
import es.altair.util.SessionProvider;

public class ViajesDaoImp implements ViajesDao {

	public List<Viajes> listarTodosViajes() {
		List<Viajes>viajes=null;
		org.hibernate.Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			viajes = sesion.createQuery("FROM Viajes").list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		return viajes;
	}

	public byte[] obtenerPortadaPorId(int idViaje) {
		
			byte[] imagen = null;

			Session sesion = SessionProvider.getSession();
			try {
				sesion.beginTransaction();

				imagen = (byte[]) sesion.createQuery("Select v.portada From Viajes v Where v.idViaje=:id")
						.setParameter("id", idViaje).uniqueResult();

				sesion.getTransaction().commit();
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				sesion.close();
				// sf.close();
			}

			return imagen;
		
	}

	public boolean AñadirBilletes(int idUsuario, int idViaje) {
		boolean comprado=false;
		Session sesion = SessionProvider.getSession();
		Usuarios usu=new Usuarios();
		Viajes viaje=new Viajes();
		try {
			sesion.beginTransaction();
			
			usu=(Usuarios)sesion.createQuery("from Usuarios  where idUsuario=:id").setParameter("id", idUsuario).uniqueResult();
			viaje=(Viajes)sesion.createQuery("from Viajes  where idViaje=:id").setParameter("id", idViaje).uniqueResult();
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			
			// sf.close();
		}
		
		viaje.getUsuarios().add(usu);
		usu.getViajes().add(viaje);
		int filas=0;
		try {sesion.beginTransaction();			
		//sesion.save(usu);
			filas=(Integer) sesion.save(viaje);
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		if(filas==1)
			comprado=true;
		return comprado;
		
	}

}
