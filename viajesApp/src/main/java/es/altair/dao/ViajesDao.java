package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.List;

import es.altair.bean.Viajes;

public interface ViajesDao {
	public List<Viajes> listarTodosViajes();
	byte[] obtenerPortadaPorId(int idViaje);
	public boolean AñadirBilletes(int idUsuario, int idViaje);
	public void agregarViaje(String nombre, String descripcion, int precio, byte[] bs);
	public void borrarViaje(int idViaje);
	List<Viajes> listarViajesUsuario(int id);
	public void cancelarViaje(int idViaje, int idUsuario);
}
