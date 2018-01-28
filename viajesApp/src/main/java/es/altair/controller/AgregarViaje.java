package es.altair.controller;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import es.altair.bean.Viajes;
import es.altair.dao.ViajesDao;
import es.altair.dao.ViajesDaoImp;

/**
 * Servlet implementation class AgregarViaje
 */
@MultipartConfig
public class AgregarViaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarViaje() {
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
				String nombre = request.getParameter("nombre");
				int precio =Integer.parseInt(request.getParameter("precio"));
				String descripcion = request.getParameter("descripcion");
				// Tratamiento de la imagen
				Part filePart = request.getPart("portada");

				InputStream inputS = null;
				ByteArrayOutputStream os = null;
				if (!getFileName(filePart).equals("")) {
					inputS = filePart.getInputStream();

					// Escalar la imagen
					BufferedImage imageBuffer = ImageIO.read(inputS);
					Image tmp = imageBuffer.getScaledInstance(640, 640, BufferedImage.SCALE_FAST);
					BufferedImage buffered = new BufferedImage(640, 640, BufferedImage.TYPE_INT_RGB);
					buffered.getGraphics().drawImage(tmp, 0, 0, null);

					os = new ByteArrayOutputStream();
					ImageIO.write(buffered, "jpg", os);
				}
				ViajesDao vDao=new ViajesDaoImp();
				
				vDao.agregarViaje(nombre,descripcion,precio,os.toByteArray());
				response.sendRedirect("jsp/agregarViajes.jsp?info=Viaje agregado");
		
	}
	private String getFileName(Part filePart) {
		for(String content : filePart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename"))
				return content.substring(content.indexOf("=")+1).trim().replace("\"", "");
		}
		return null;
	}

}
