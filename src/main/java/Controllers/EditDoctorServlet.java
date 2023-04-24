package Controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;


import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import DAO.DoctorDao;
import Models.Doctor;
import Models.HelperClass;
import Models.Tools;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)

public class EditDoctorServlet extends HttpServlet {
	public static final String UPLOAD_DIR = "images";
	public String dbFileName = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/Admin/EditDoctor.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("submit") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String path = request.getParameter("path");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String sex = request.getParameter("sex");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			String BirthDay = request.getParameter("BirthDay");
			String specialty = request.getParameter("specialty");
			String workingDays[] = request.getParameterValues("workingDays");
			String workingHours[] = request.getParameterValues("workingHours");

			Part part = request.getPart("image");
			System.out.println("part " + part);
			String savePath;
			String img_url;
			try {
			String fileName = extractFileName(part);// file name

			/**
			 * *** Get The Absolute Path Of The Web Application ****
			 */
			String applicationPath = getServletContext().getRealPath("");
			String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
			System.out.println("applicationPath:" + applicationPath);
			File fileUploadDirectory = new File(uploadPath);
			if (!fileUploadDirectory.exists()) {
				fileUploadDirectory.mkdirs();
			}
			savePath = uploadPath + File.separator + fileName;
			System.out.println("savePath: " + savePath);
			String sRootPath = new File(savePath).getAbsolutePath();
			System.out.println("sRootPath: " + sRootPath);
			part.write(savePath + File.separator);
			File fileSaveDir1 = new File(savePath);
			/*
			 * if you may have more than one files with same name then you can calculate
			 * some random characters and append that characters in fileName so that it will
			 * make your each image name identical.
			 */
			dbFileName = UPLOAD_DIR + File.separator + fileName;
			part.write(savePath + File.separator);
			HelperClass save = new HelperClass();
			img_url = save.SaveImage(applicationPath, part);
			}catch(IOException ex) {
				img_url = path;
			}
			try {
				System.out.println(Tools.checkField("doctor", "Email", email));
				if (Tools.checkFieldOnUpdate("doctor", "Email", email, id)) {
					response.sendRedirect("/telemedicine/editDoctor?status=emailExist");
					request.setAttribute("test", "test");
					return;
				} else if (Tools.checkFieldOnUpdate("doctor", "Number_Phone", phoneNumber, id)) {
					response.sendRedirect("/telemedicine/editDoctor?status=phoneExist");
					return;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Doctor doctor = new Doctor(img_url, firstName, lastName, email, sex, address, phoneNumber, BirthDay,
					specialty, workingDays, workingHours);

			if (DoctorDao.updateDoctor(doctor, id) == 1) {
				response.sendRedirect("/telemedicine/AllDoctors?status=successUpdate");
			} else {
				response.sendRedirect("/telemedicine/editDoctor?status=failed");
			}
		}

	}
	
	 private String extractFileName(Part part) {//This method will print the file name.
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length() - 1);
	            }
	        }
	        return "";
	    }

}
