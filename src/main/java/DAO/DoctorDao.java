package DAO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.*;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import Models.DataBaseConnection;
import Models.Doctor;
import Models.Tools;

public class DoctorDao {

	public static int addDoctor(Doctor doctor) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO `doctor`(`Image_Path`, `First_Name`, `Last_Name`, `BirthDay`, `Email`, "
							+ "`Number_Phone`, `Sex`, `Address`, `Speciality`, `Work_Days`, `Work_Hours`, `Username`, `Password`) "
							+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			String workingDays = "";
			String workingHours = "";
			for (String s : doctor.getWorkingDays()) {
				workingDays += s + "-";
			}
			for (String s : doctor.getWorkingHours()) {
				workingHours += s + "-";
			}
			String username = "";
			String password = Tools.generatePassword(10);
			boolean exist;
			do {
				username = doctor.getLastName() + Tools.generateNumber(5);
				exist = Tools.checkField("doctor", "Username", username);
			} while (exist == true);
			System.out.println(exist);
			System.out.println(username);
			ps.setString(1, doctor.getImagePath());
			ps.setString(2, doctor.getFirstName());
			ps.setString(3, doctor.getLastName());
			ps.setString(4, doctor.getBirthDay());
			ps.setString(5, doctor.getEmail());
			ps.setString(6, doctor.getPhoneNumber());
			ps.setString(7, doctor.getSex());
			ps.setString(8, doctor.getAddress());
			ps.setString(9, doctor.getSpecialty());
			ps.setString(10, workingDays);
			ps.setString(11, workingHours);
			ps.setString(12, username);
			ps.setString(13, Tools.encryptPassword(password));
			status = ps.executeUpdate();
			ps.close();
			con.close();
			Tools.sendEmail( doctor.getEmail(), doctor.getLastName(), doctor.getFirstName(), username, password, "New Account");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int updateDoctor(Doctor doctor, int id) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE `doctor` SET `Image_Path`=?,`First_Name`=?,`Last_Name`=?,`BirthDay`=?,`Email`=?,`Number_Phone`=?,"
					+ "`Sex`=?,`Address`=?,`Speciality`=?,`Work_Days`=?,`Work_Hours`=? WHERE id = ?");
			String workingDays = "";
			String workingHours = "";
			for (String s : doctor.getWorkingDays()) {
				workingDays += s + "-";
			}
			for (String s : doctor.getWorkingHours()) {
				workingHours += s + "-";
			}
			
			ps.setString(1, doctor.getImagePath());
			ps.setString(2, doctor.getFirstName());
			ps.setString(3, doctor.getLastName());
			ps.setString(4, doctor.getBirthDay());
			ps.setString(5, doctor.getEmail());
			ps.setString(6, doctor.getPhoneNumber());
			ps.setString(7, doctor.getSex());
			ps.setString(8, doctor.getAddress());
			ps.setString(9, doctor.getSpecialty());
			ps.setString(10, workingDays);
			ps.setString(11, workingHours);
			ps.setInt(12, id);
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static ResultSet getAllDoctors(String type) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctor` WHERE `deleted_at`IS " + type);
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
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM `doctor` WHERE `deleted_at`IS NULL" );
			ResultSet resultSet = ps.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int Income() {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM `doctor` WHERE `deleted_at`IS NULL" );
			ResultSet resultSet = ps.executeQuery();
			resultSet.next();
			return resultSet.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static ResultSet searchDoctors(String type, String val) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM `doctor` WHERE (First_Name LIKE '%" + val + "%' OR Last_Name LIKE '%" + val + "%' OR Speciality  LIKE '%" + val + "%' OR Email  LIKE '%" + val + "%' OR Number_Phone  LIKE '%" + val + "%') AND `deleted_at`IS " + type);
			ResultSet resultSet = ps.executeQuery();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static ResultSet getDoctor(int id) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctor` WHERE id = ?");
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
			ResultSet rs = getDoctor(id);
			rs.next();
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE `doctor` SET `deleted_at`= CURRENT_TIMESTAMP Where id = ?");
			ps.setInt(1, id);
			Tools.sendEmail( rs.getString(6), rs.getString(4), rs.getString(3), "", "", "Delete Account");
			return ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int restePassword(int id) {
		try {
			ResultSet rs = getDoctor(id);
			rs.next();
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE `doctor` SET username = ? , `password`= ? Where id = ?");
			String username = "";
			String password = Tools.generatePassword(10);
			boolean exist;
			do {
				username = rs.getString(4) + Tools.generateNumber(5);
				exist = Tools.checkField("doctor", "Username", username);
			} while (exist == true);
			ps.setString(1, username);
			ps.setString(2, Tools.encryptPassword(password));
			ps.setInt(3, id);
			Tools.sendEmail( rs.getString(6), rs.getString(4), rs.getString(3), username, password, "Update Account");
			return ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public static boolean hardDelete(int id) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM `doctor` WHERE id = ?");
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
			PreparedStatement ps = con.prepareStatement("UPDATE `doctor` SET `deleted_at`= null Where id = ?");
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
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctor` WHERE `deleted_at`IS " + type);
			ResultSet resultSet = ps.executeQuery();

            XSSFWorkbook XFWB = new XSSFWorkbook();
            XSSFSheet XFSheet = XFWB.createSheet("Doctors List");
            XSSFRow HeaderRow = XFSheet.createRow(0);
            HeaderRow.createCell(0).setCellValue("Id");
            HeaderRow.createCell(1).setCellValue("First Name");
            HeaderRow.createCell(2).setCellValue("First Name");
            HeaderRow.createCell(3).setCellValue("Date of Birth");
            HeaderRow.createCell(4).setCellValue("Email");
            HeaderRow.createCell(5).setCellValue("Phone Number");
            HeaderRow.createCell(6).setCellValue("Sex");
            HeaderRow.createCell(7).setCellValue("Address");
            HeaderRow.createCell(8).setCellValue("Speciality");
            HeaderRow.createCell(9).setCellValue("Working Days");
            HeaderRow.createCell(10).setCellValue("Working Hours");
            HeaderRow.createCell(11).setCellValue("Username");


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
                Row.createCell(7).setCellValue(resultSet.getString(9));
                Row.createCell(8).setCellValue(resultSet.getString(10));
                Row.createCell(9).setCellValue(resultSet.getString(11));
                Row.createCell(10).setCellValue(resultSet.getString(12));
                Row.createCell(11).setCellValue(resultSet.getString(13));
                RowNum++;
            }
            response.setContentType( "application/vnd.ms-excel" );
            XFWB.write(response.getOutputStream());
            XFWB.close();
            return true;
//            try (FileOutputStream FileOutStr = new FileOutputStream("Exported/Clients.xlsx")) {
//                XFWB.write(FileOutStr);
//                System.out.println("Okay");
//            }
        } catch ( SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
	
	public static boolean exportSearchResult(HttpServletResponse response, String type, String search) throws ClassNotFoundException, IOException {
        try {
        	
			ResultSet resultSet = searchDoctors(type, search);

            XSSFWorkbook XFWB = new XSSFWorkbook();
            XSSFSheet XFSheet = XFWB.createSheet("Doctors List");
            XSSFRow HeaderRow = XFSheet.createRow(0);
            HeaderRow.createCell(0).setCellValue("Id");
            HeaderRow.createCell(1).setCellValue("First Name");
            HeaderRow.createCell(2).setCellValue("First Name");
            HeaderRow.createCell(3).setCellValue("Date of Birth");
            HeaderRow.createCell(4).setCellValue("Email");
            HeaderRow.createCell(5).setCellValue("Phone Number");
            HeaderRow.createCell(6).setCellValue("Sex");
            HeaderRow.createCell(7).setCellValue("Address");
            HeaderRow.createCell(8).setCellValue("Speciality");
            HeaderRow.createCell(9).setCellValue("Working Days");
            HeaderRow.createCell(10).setCellValue("Working Hours");
            HeaderRow.createCell(11).setCellValue("Username");


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
                Row.createCell(7).setCellValue(resultSet.getString(9));
                Row.createCell(8).setCellValue(resultSet.getString(10));
                Row.createCell(9).setCellValue(resultSet.getString(11));
                Row.createCell(10).setCellValue(resultSet.getString(12));
                Row.createCell(11).setCellValue(resultSet.getString(13));
                RowNum++;
            }
            response.setContentType( "application/vnd.ms-excel" );
            XFWB.write(response.getOutputStream());
            XFWB.close();
            return true;
//            try (FileOutputStream FileOutStr = new FileOutputStream("Exported/Clients.xlsx")) {
//                XFWB.write(FileOutStr);
//                System.out.println("Okay");
//            }
        } catch ( SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
	


}
