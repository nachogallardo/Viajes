package es.altair.controller;

import java.io.IOException;

import javax.persistence.Convert;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import es.altair.bean.Usuarios;
import es.altair.dao.UsuariosDao;
import es.altair.dao.UsuariosDaoImp;

/**
 * Servlet implementation class RegistrarUsuario
 */
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nombre = request.getParameter("nombre");
		String contrasenia = request.getParameter("password");
		String email = request.getParameter("email");
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String direccion = request.getParameter("direccion");
		
		Usuarios usu = new Usuarios(nombre, contrasenia, email, telefono, direccion,2);
		
		UsuariosDao uDAO = new UsuariosDaoImp();
		
		int filas = 0;
		String msg = "";		
		
		if (uDAO.validarEmail(usu)) {
			filas = uDAO.insertar(usu);
			if (filas == 1) {
				msg = "Usuario Registrado";
				
				response.sendRedirect("index.jsp?mensaje="+msg);
			}
			else {
				msg = "Error al Registrar al Usuario";
				
				response.sendRedirect("index.jsp?mensaje="+msg);
			}
		} else {
			msg = "Email ya registrado. Int�ntelo con otro email";
			
			response.sendRedirect("index.jsp?mensaje="+msg);
		}
		
		
	}

}
