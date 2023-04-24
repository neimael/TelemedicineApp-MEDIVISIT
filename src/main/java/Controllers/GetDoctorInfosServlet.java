package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import DAO.DoctorDao;
import DAO.PatientDao;
import jakarta.servlet.http.*;
import jakarta.servlet.*;


public class GetDoctorInfosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id " + id);
		Map<String, String> map = new HashMap<String, String>();

		if (id != null) { 
			ResultSet rs = DoctorDao.getDoctor(Integer.parseInt(id));
			try {
				rs.next();
				map.put("id", id);
				map.put("firstName", rs.getString(3));
				map.put("lastName", rs.getString(4));
				map.put("BirthDay", rs.getString(5));
				map.put("email", rs.getString(6));
				map.put("phoneNumber", rs.getString(7));
				map.put("sex", rs.getString(8));
				map.put("Specialty", rs.getString(10));
				map.put("address", rs.getString(9));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		write(response, map);
	}

	private void write(HttpServletResponse response, Map<String, String> map) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(map)); // this is how simple GSON works
	}
}