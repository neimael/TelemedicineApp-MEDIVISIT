package Controllers;

import java.io.IOException;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import DAO.DoctorDao;

public class ExportDoctorsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			if(DoctorDao.export(response, "NULL")) {
//				response.sendRedirect("/telemedicine/AllDoctors?status=successExport");
//			}else {
//				response.sendRedirect("/telemedicine/AllDoctors?status=failed");
//			}
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		try {
			DoctorDao.export(response, "NULL");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}
