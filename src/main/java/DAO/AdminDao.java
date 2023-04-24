package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Models.Admin;
import Models.DataBaseConnection;
import Models.Patient;
import Models.Tools;

public class AdminDao {

	
	public static ResultSet login(String email, String password) {
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `admin` WHERE (Email = ? OR Username = ?) AND Password = ?");
			ps.setString(1, email);
			ps.setString(2, email);
			ps.setString(3, Tools.encryptPassword(password));
			ResultSet resultSet = ps.executeQuery();
			return resultSet;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static int updateAdmin(Admin admin, int id) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE `admin` SET `First_Name`=?,`Last_Name`=?,`BirthDay`=?,`Email`=?,`Phone_Number`=?,"
					+ "`Username`=? WHERE id = ?");

			
			ps.setString(1, admin.getFirstName());
			ps.setString(2, admin.getLastName());
			ps.setString(3, admin.getBirthDay());
			ps.setString(4, admin.getEmail());
			ps.setString(5, admin.getPhoneNumber());
			ps.setString(6, admin.getUsername());
			ps.setInt(7, id);
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int updatePassword(String password, int id) {
		int status = 0;
		try {
			Connection con = DataBaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE `admin` SET `Password`=? WHERE id = ?");
			ps.setString(1, Tools.encryptPassword(password));
			ps.setInt(2, id);
			status = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
