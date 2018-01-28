package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.ViajesDao;
import es.altair.dao.ViajesDaoImp;

/**
 * Servlet implementation class CancelarViaje
 */
public class CancelarViaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelarViaje() {
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
		int idViaje=Integer.parseInt(request.getParameter("idViaje"));
		int idUsuario=Integer.parseInt(request.getParameter("idUsuario"));
		ViajesDao vDao = new ViajesDaoImp();
		vDao.cancelarViaje(idViaje,idUsuario);
		response.sendRedirect("jsp/gestionarViajes.jsp");
		
	}

}
