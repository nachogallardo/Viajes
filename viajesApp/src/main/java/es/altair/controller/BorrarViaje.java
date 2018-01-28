package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.dao.ViajesDao;
import es.altair.dao.ViajesDaoImp;

/**
 * Servlet implementation class BorrarViaje
 */
public class BorrarViaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarViaje() {
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
		int idViaje=Integer.parseInt(request.getParameter("id"));
		ViajesDao vDao = new ViajesDaoImp();
		vDao.borrarViaje(idViaje);
		response.sendRedirect("jsp/borrarViajes.jsp");
	}

}
