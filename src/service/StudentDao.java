//28±â ±èÈ£¼ø 2018.6.26(È­)
package service;	
import java.sql.*;
import service.Student;

public class StudentDao {
	
	public int insertStudent(Student student) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("INSERT INTO student(student_name, student_age) VALUES(?, ?)");
			
			pstmt.setString(1, student.getStudentName());
			pstmt.setInt(2, student.getStudentAge());
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); 
				} catch(SQLException ex) {
				}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return 0;
	}
}
