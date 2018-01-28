package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;

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
		boolean comprado=true;
		Session sesion = SessionProvider.getSession();
		Usuarios usu=new Usuarios();
		Viajes viaje=new Viajes();
		
		int hayBillete=0;
		try {
			sesion.beginTransaction();			
		//sesion.save(usu);
			hayBillete=(Integer) sesion.createSQLQuery("select idViaje from billetes where idViaje=:idViaje and idUsuario=:idUsuario").setParameter("idViaje", idViaje).setParameter("idUsuario", idUsuario).uniqueResult();
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			
			// sf.close();
		}
		if(hayBillete>0)
			comprado=false;
		
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

		try {
			sesion.beginTransaction();			
		//sesion.save(usu);
			sesion.save(viaje);
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
		return comprado;
		
	}



	public void agregarViaje(String nombre, String descripcion, int precio, byte[] bs) {
		Session sesion = SessionProvider.getSession();
		Viajes v= new Viajes(nombre, descripcion, precio, bs);
		try {
			sesion.beginTransaction();

			sesion.save(v);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public void borrarViaje(int idViaje) {
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			sesion.createQuery("delete from Viajes where idViaje=:i").setParameter("i", idViaje).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public List<Viajes> listarViajesUsuario(int id) {
		List<Viajes>viajes=new ArrayList<Viajes>();
		org.hibernate.Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();
			List<Integer> idViajes=sesion.createSQLQuery("select distinct idViaje from billetes where idUsuario=:i").setParameter("i", id).list();
			for (Integer integer : idViajes) {
				System.out.println(integer);
				viajes.add((Viajes) sesion.createQuery("FROM Viajes where idViaje=:id").setParameter("id", integer).uniqueResult());
			}
			

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		return viajes;
	}

	public void cancelarViaje(int idViaje, int idUsuario) {
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
		
		viaje.getUsuarios().remove(usu);
		usu.getViajes().remove(viaje);
		int filas=0;
		try {sesion.beginTransaction();			
		//sesion.save(usu);
			sesion.save(viaje);
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

}
