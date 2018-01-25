package es.altair.dao;

import java.util.List;

import es.altair.bean.Viajes;

public interface ViajesDao {
	public List<Viajes> listarTodosViajes();
	byte[] obtenerPortadaPorId(int idViaje);
	public boolean AñadirBilletes(int idUsuario, int idViaje);
}
