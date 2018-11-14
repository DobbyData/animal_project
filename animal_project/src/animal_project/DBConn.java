package animal_project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConn {
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			
			String url = "jdbc:mysql://localhost:3307/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
			String id = "root"; 		
			String pw = "qwer1234!"; 

			conn=DriverManager.getConnection(url,id,pw);
		}catch(SQLException e){
			System.err.println("Error" + e.getMessage());
			
		} catch(ClassNotFoundException e){
			System.err.println("JDBC class found exception error.");
		}
		return conn;
	}
}
