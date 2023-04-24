package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.http.*;

import Models.DataBaseConnection;
import Models.Patient;
import Models.Tools;

public class PatientDao {

	public static int addPatient(Patient patient) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO `patient`(`Image_Path`, `First_Name`, `Last_Name`, `BirthDay`, `Email`, "
							+ "`Number_Phone`, `Sex`, `Social_Account`, `Address`, `Username`, `Password`) "
							+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)");

			String username = "";
			String password = Tools.generatePassword(10);
			boolean exist;
			do {
				username = patient.getLastName() + Tools.generateNumber(5);
				exist = Tools.checkField("patient", "Username", username);
			} while (exist == true);
			System.out.println(exist);
			System.out.println(username);
			ps.setString(1, patient.getImagePath());
			ps.setString(2, patient.getFirstName());
			ps.setString(3, patient.getLastName());
			ps.setString(4, patient.getBirthDay());
			ps.setString(5, patient.getEmail());
			ps.setString(6, patient.getPhoneNumber());
			ps.setString(7, patient.getSex());
			ps.setString(8, patient.getSocialAccount());
			ps.setString(9, patient.getAddress());
			ps.setString(10, username);
			ps.setString(11, Tools.encryptPassword(password));
			status = ps.executeUpdate();
			ps.close();
			con.close();
			Tools.sendEmail(patient.getEmail(), patient.getLastName(), patient.getFirstName(), username, password,
					"New Account Patient");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int updatePatient(Patient patient, int id) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE `patient` SET `Image_Path`=?,`First_Name`=?,`Last_Name`=?,`BirthDay`=?,`Email`=?,`Number_Phone`=?,"
							+ "`Sex`=?,`Social_Account`=?,`Address`=? WHERE id = ?");

			ps.setString(1, patient.getImagePath());
			ps.setString(2, patient.getFirstName());
			ps.setString(3, patient.getLastName());
			ps.setString(4, patient.getBirthDay());
			ps.setString(5, patient.getEmail());
			ps.setString(6, patient.getPhoneNumber());
			ps.setString(7, patient.getSex());
			ps.setString(8, patient.getSocialAccount());
			ps.setString(9, patient.getAddress());
			ps.setInt(10, id);
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static ResultSet getAllPatients(String type) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` WHERE `deleted_at`IS " + type);
			ResultSet resultSet = ps.executeQuery();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static int count() {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM `patient` WHERE `deleted_at`IS NULL");
			ResultSet resultSet = ps.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}



	public static ResultSet searchPatients(String type, String val) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` WHERE (First_Name LIKE '%" + val
					+ "%' OR Last_Name LIKE '%" + val + "%' OR Social_Account  LIKE '%" + val + "%' OR Email  LIKE '%"
					+ val + "%' OR Number_Phone  LIKE '%" + val + "%') AND `deleted_at`IS " + type);
			ResultSet resultSet = ps.executeQuery();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static ResultSet getPatient(int id) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` WHERE id = ?");
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static int softDelete(int id) {
		try {
			ResultSet rs = getPatient(id);
			rs.next();
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE `patient` SET `deleted_at`= CURRENT_TIMESTAMP Where id = ?");
			ps.setInt(1, id);
			Tools.sendEmail(rs.getString(6), rs.getString(4), rs.getString(3), "", "", "Delete Account");
			return ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static int restePassword(int id) {
		try {
			ResultSet rs = getPatient(id);
			rs.next();
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE `patient` SET username = ? , `password`= ? Where id = ?");
			String username = "";
			String password = Tools.generatePassword(10);
			boolean exist;
			do {
				username = rs.getString(4) + Tools.generateNumber(5);
				exist = Tools.checkField("patient", "Username", username);
			} while (exist == true);
			ps.setString(1, username);
			ps.setString(2, Tools.encryptPassword(password));
			ps.setInt(3, id);
			Tools.sendEmail(rs.getString(6), rs.getString(4), rs.getString(3), username, password, "Update Account");
			return ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static boolean hardDelete(int id) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM `patient` WHERE id = ?");
			ps.setInt(1, id);
			return ps.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static int restore(int id) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE `patient` SET `deleted_at`= null Where id = ?");
			ps.setInt(1, id);
			return ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static boolean export(HttpServletResponse response, String type) throws ClassNotFoundException, IOException {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patient` WHERE `deleted_at`IS " + type);
			ResultSet resultSet = ps.executeQuery();

			XSSFWorkbook XFWB = new XSSFWorkbook();
			XSSFSheet XFSheet = XFWB.createSheet("Patients List");
			XSSFRow HeaderRow = XFSheet.createRow(0);
			HeaderRow.createCell(0).setCellValue("Id");
			HeaderRow.createCell(1).setCellValue("First Name");
			HeaderRow.createCell(2).setCellValue("First Name");
			HeaderRow.createCell(3).setCellValue("Date of Birth");
			HeaderRow.createCell(4).setCellValue("Email");
			HeaderRow.createCell(5).setCellValue("Phone Number");
			HeaderRow.createCell(6).setCellValue("Sex");
			HeaderRow.createCell(7).setCellValue("Address");
			HeaderRow.createCell(8).setCellValue("Social Account");
			HeaderRow.createCell(9).setCellValue("Username");

			int RowNum = 1;
			while (resultSet.next()) {
				XSSFRow Row = XFSheet.createRow(RowNum);
				Row.createCell(0).setCellValue(resultSet.getInt(1));
				Row.createCell(1).setCellValue(resultSet.getString(3));
				Row.createCell(2).setCellValue(resultSet.getString(4));
				Row.createCell(3).setCellValue(resultSet.getString(5));
				Row.createCell(4).setCellValue(resultSet.getString(6));
				Row.createCell(5).setCellValue(resultSet.getString(7));
				Row.createCell(6).setCellValue(resultSet.getString(8));
				Row.createCell(7).setCellValue(resultSet.getString(10));
				Row.createCell(8).setCellValue(resultSet.getString(9));
				Row.createCell(9).setCellValue(resultSet.getString(11));

				RowNum++;
			}
			response.setContentType("application/vnd.ms-excel");
			XFWB.write(response.getOutputStream());
			XFWB.close();
			return true;
//            try (FileOutputStream FileOutStr = new FileOutputStream("Exported/Clients.xlsx")) {
//                XFWB.write(FileOutStr);
//                System.out.println("Okay");
//            }
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static boolean exportSearchResult(HttpServletResponse response, String type, String search)
			throws ClassNotFoundException, IOException {
		try {
			ResultSet resultSet = searchPatients(type, search);

			XSSFWorkbook XFWB = new XSSFWorkbook();
			XSSFSheet XFSheet = XFWB.createSheet("Patients List");
			XSSFRow HeaderRow = XFSheet.createRow(0);
			HeaderRow.createCell(0).setCellValue("Id");
			HeaderRow.createCell(1).setCellValue("First Name");
			HeaderRow.createCell(2).setCellValue("First Name");
			HeaderRow.createCell(3).setCellValue("Date of Birth");
			HeaderRow.createCell(4).setCellValue("Email");
			HeaderRow.createCell(5).setCellValue("Phone Number");
			HeaderRow.createCell(6).setCellValue("Sex");
			HeaderRow.createCell(7).setCellValue("Address");
			HeaderRow.createCell(8).setCellValue("Social Account");
			HeaderRow.createCell(9).setCellValue("Username");

			int RowNum = 1;
			while (resultSet.next()) {
				XSSFRow Row = XFSheet.createRow(RowNum);
				Row.createCell(0).setCellValue(resultSet.getInt(1));
				Row.createCell(1).setCellValue(resultSet.getString(3));
				Row.createCell(2).setCellValue(resultSet.getString(4));
				Row.createCell(3).setCellValue(resultSet.getString(5));
				Row.createCell(4).setCellValue(resultSet.getString(6));
				Row.createCell(5).setCellValue(resultSet.getString(7));
				Row.createCell(6).setCellValue(resultSet.getString(8));
				Row.createCell(7).setCellValue(resultSet.getString(10));
				Row.createCell(8).setCellValue(resultSet.getString(9));
				Row.createCell(9).setCellValue(resultSet.getString(11));

				RowNum++;
			}
			response.setContentType("application/vnd.ms-excel");
			XFWB.write(response.getOutputStream());
			XFWB.close();
			return true;
//            try (FileOutputStream FileOutStr = new FileOutputStream("Exported/Clients.xlsx")) {
//                XFWB.write(FileOutStr);
//                System.out.println("Okay");
//            }
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
