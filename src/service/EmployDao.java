//2018.06.26 박원우
package service;

import java.sql.Connection;	//import.
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployDao {
	//고용한 사람의 이름과 나이를 DB에 입력하는 메서드
	public int insertEmploy(Employ employ) {	//매개변수에 담긴 값은 객체주소값, 데이터 타입은 클래스
		Connection conn = null;
		PreparedStatement pstmt = null;	//초기값 설정
		int a = 0;	//리턴값을 설정하기 위한 변수 선언
		
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
			
			a = pstmt.executeUpdate();	//쿼리 실행, 실행 결과가 1이면 입력,0이면 입력실패
			System.out.println(a+" : 쿼리실행값");
			} catch (ClassNotFoundException e) { //드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
		return a;
	}
}
