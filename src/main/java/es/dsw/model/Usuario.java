package es.dsw.model;

public class Usuario {
	private String Nombre;
	private int edad;
	
	private boolean error;
	private String msgerror;
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombreApellidos) {
		Nombre = nombreApellidos;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	public String getMsgerror() {
		return msgerror;
	}
	public void setMsgerror(String msgerror) {
		this.msgerror = msgerror;
	}
}
