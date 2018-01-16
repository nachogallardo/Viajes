package es.altair.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
@Entity
@Table(name="viajes")
public class Viajes implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idViaje;
	private String nombre;
	private String descripcion;
	private int precio;
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(
		name="billetes", 
		joinColumns = @JoinColumn (name="idViaje"), 
		inverseJoinColumns = @JoinColumn(name="idUsuario")
	)
	private Set<Usuarios> usuarios = new HashSet<Usuarios>();

	public Viajes() {
		super();
	}
	
	public Viajes(int idViaje, String nombre, String descripcion, int precio) {
		super();
		this.idViaje = idViaje;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
	}

	
	
	public int getIdViaje() {
		return idViaje;
	}
	public void setIdViaje(int idViaje) {
		this.idViaje = idViaje;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	

	public Set<Usuarios> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(Set<Usuarios> usuarios) {
		this.usuarios = usuarios;
	}

	@Override
	public String toString() {
		return "Viajes [idViaje=" + idViaje + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio="
				+ precio + "]";
	}
	
	
	
}
