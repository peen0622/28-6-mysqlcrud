/*2018.06.26 박원우*/
package service;

import java.sql.Connection;	//import.
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployDao {
	public int insertEmploy(Employ employ) {	//insertEmploy 메서드 선언
		Connection conn = null;
		PreparedStatement pstmt = null;	//초기값 설정
		
		try {	//예외가 발생하면 catch로 이동
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement(
					"INSERT INTO employ(employ_name, employ_age) VALUES (?, ?)");	//쿼리 준비
			pstmt.setString(1, employ.getEmployName());	//변수 member에 대입된 주소값을 찾아가서 getMember_name메서드를 호출. 
			pstmt.setInt(2, employ.getEmployAge());		//리턴된 값이 ?에 대입.
			
			pstmt.executeUpdate();	//쿼리 실행
			} catch (ClassNotFoundException e) { //드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
	return 0;
	}
}
