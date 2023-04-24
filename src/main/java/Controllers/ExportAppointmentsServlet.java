package Controllers;

import java.io.IOException;

import DAO.AppointmentDao;
import jakarta.servlet.http.*;


public class ExportAppointmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			AppointmentDao.export(response, "NULL");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	

}
