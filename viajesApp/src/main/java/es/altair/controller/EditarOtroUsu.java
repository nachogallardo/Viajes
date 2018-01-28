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
 * Servlet implementation class EditarOtroUsu
 */
public class EditarOtroUsu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarOtroUsu() {
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
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		String nombre = request.getParameter("nombre");
		String nuevaContrasenia =request.getParameter("nuevaContrasenia");
		String email = request.getParameter("email");
		int tipoUsuario=Integer.parseInt(request.getParameter("tipoUsuario"));
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String direccion = request.getParameter("direccion");
		
		UsuariosDao uDao=new UsuariosDaoImp();
		uDao.Editar(idUsuario,nombre,nuevaContrasenia,email,telefono,direccion,tipoUsuario);
		
		response.sendRedirect("jsp/administrador.jsp?info=Usuario Editado");

		}
	
}
