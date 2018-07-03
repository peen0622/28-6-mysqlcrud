//28 김호순 2018.7.3(화요일)
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentAddrDao {

	// 주소 입력
		public int insertStudentAddr(StudentAddr studentAddr, int no) {	// 메서드명(insertStudentAddr) , StudentAddr class data type 의 매개변수 studentAddr,  받아온 넘버 매개변수 no
			Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
			PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
			int r = 0;
			
			try {	// 예외처리를 하기위한 try...catch...finally 문 시작
				Class.forName("com.mysql.jdbc.Driver");	// 드라이버 로딩하기
				
				// DB 연결 시작
				String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
				String dbId = "mysqlcrudid";
				String dbPw = "mysqlcrudpw";
			
				conn = DriverManager.getConnection(dbUrl, dbId, dbPw);	// DB 연결 끝
				
				//	Query 실행을 위한 prepareStatemet 객체 생성
				pstmt = conn.prepareStatement("INSERT INTO student_addr(student_no, student_addr_content) VALUES(?, ?)");	// student 테이블 안에 번호와 주소를 입력하는 쿼리문.
				
				pstmt.setInt(1, no);	// 첫번째 ? 에  studemt_no 를 가져와 세팅
				pstmt.setString(2, studentAddr.getStudentAddrContent());	// 두번째 ? 에  studentAddr의 주소값을 찾아가서 studentAddr class의 studentAddrContent을 가져와 student_addr_content에 셋팅한다.
				r= pstmt.executeUpdate();	// 쿼리 실행
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();			
			}finally{	// 오류처리 여부와 관계없이 실행
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
			}
			return r;
		} 
		//주소 리스트
		public StudentAddr selectStudentAddr(int no) {
			Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
			PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
			ResultSet resultSet = null;	// select 에 필요한 클래스 의 변수 resultSet의 값을 초기화
			StudentAddr s = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
				String dbUser = "mysqlcrudid";
				String dbPass = "mysqlcrudpw";
				
				conn = DriverManager.getConnection(URL, dbUser, dbPass);
				System.out.println(conn+ "<-- conn");
				
				pstmt = conn.prepareStatement("select student_addr_content from student_addr where student_no=?");	// 주소를 학생 번호를 찾아 조회
				pstmt.setInt(1, no);
				resultSet = pstmt.executeQuery();
				System.out.println(resultSet+"<--resultSet");
				
				if(resultSet.next()) {
					s = new StudentAddr();	// 생성자 메서드 StudentAddr()에서 주소값을 호출하여 s에 대입
					s.setStudentAddrContent(resultSet.getString("student_addr_content"));	// resultSet의 주소값을  찾아가 주소 내용을 얻어와 s에 세팅한다
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try { conn.close(); } catch(SQLException e) {}
			}
			return s;
		}
}
