package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import es.altair.bean.Usuarios;
import es.altair.dao.UsuariosDao;
import es.altair.dao.UsuariosDaoImp;

/**
 * Servlet implementation class ValidarUsuario
 */
public class ValidarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		UsuariosDao uDAO = new UsuariosDaoImp();
		
		Usuarios usu = uDAO.comprobarUsuario(usuario, password);
		if (usu!=null) {
			// Usuario correcto
			// Poner al usuario en sesión
			HttpSession sesion = request.getSession();
			sesion.setAttribute("usuLogeado", usu);
			
			switch (usu.getTipoUsuario()) {
			case 2:
				// Usuario Normal
				response.sendRedirect("jsp/usuario.jsp");
				break;
			case 1:
				// Administrador
				response.sendRedirect("jsp/administrador.jsp");
				break;

			default:
				break;
			}
			System.out.println(usu);
		} else {
			// Error Usuario
			response.sendRedirect("index.jsp?fallo=Usuario y/o Password Incorrecto");
		}
	}

}
