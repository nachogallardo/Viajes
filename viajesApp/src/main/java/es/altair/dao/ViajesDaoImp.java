package es.altair.dao;

import java.util.List;


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

}
