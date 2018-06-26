/*28기 김호순 2018.6.26(화)*/
package service;	
import java.sql.*;	// 드라이버 로딩에 핑요한 클래스들을 한번에 임포드 하였다. 
import service.Student;	// service 패키지내 Student 클래스를 임포트 하였다.

public class StudentDao {
	
	public int insertStudent(Student student) {	// 메서드명(insertStudent) , Student class data type 의 매개변수 student 
		Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
		PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
		
		try {	// 예외처리를 하기위한 try...catch...finally 문 시작
			Class.forName("com.mysql.jdbc.Driver");	// 드라이버 로딩하기
			
			// DB 연결 시작
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);	// DB 연결 끝
			
			//	Query 실행을 위한 prepareStatemet 객체 생성
			pstmt = conn.prepareStatement("INSERT INTO student(student_name, student_age) VALUES(?, ?)");	// student 테이블 안에 이름과 나이를 입력하는 쿼리문.
			
			pstmt.setString(1, student.getStudentName());	// 첫번째 ? 에  student의 주소값을 찾아가서 student class의 studentName을 가져와 student_name에 셋팅한다
			pstmt.setInt(2, student.getStudentAge());	// 두번째 ? 에  student의 주소값을 찾아가서 student class의 studentAge을 가져와 student_age에 셋팅한다.
			pstmt.executeUpdate();	// 쿼리 실행
			
		} catch (ClassNotFoundException | SQLException e) {	// class 를 못찾거나 sql에 예외가 있다면 오류처리
			e.printStackTrace();			
		}finally{	// 오류처리 여부와 관계없이 실행
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
		}
		return 0;	
	}
}
