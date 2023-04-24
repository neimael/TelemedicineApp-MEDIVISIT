package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {

    public static Connection con = null;


    public static Connection getConnection() throws ClassNotFoundException {
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/telemedicine", "root", "");
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
        return con;
    }

}
