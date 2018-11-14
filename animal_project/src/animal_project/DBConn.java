package animal_project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
<<<<<<< HEAD
			
			String url = "jdbc:mysql://localhost:3307/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
			String id = "root"; 		
			String pw = "qwer1234!"; 

=======
			
			String url = "jdbc:mysql://localhost:3306/animaldb?characterEncoding=EUC-KR&serverTimezone=UTC&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";
			String id = "root"; 		// 사용자계정
			String pw = "plus_1004"; 	// 사용자계정의 패스워드 
			
>>>>>>> branch 'master' of https://github.com/DobbyData/animal_project.git
			conn=DriverManager.getConnection(url,id,pw);
		}catch(SQLException e){
			System.err.println("Error" + e.getMessage());
			
		} catch(ClassNotFoundException e){
<<<<<<< HEAD
			System.err.println("JDBC class found exception error.");
=======
			System.err.println("JDBC 드라이버를 찾지 못했습니다.");
>>>>>>> branch 'master' of https://github.com/DobbyData/animal_project.git
		}
		return conn;
	}
}
