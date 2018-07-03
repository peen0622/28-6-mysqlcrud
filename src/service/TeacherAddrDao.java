package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherAddrDao {
	
	//teacher_addr 테이블 teacher_addr_content 데이터
	public TeacherAddr selectTeacherAddr(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		TeacherAddr t = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("select teacher_addr_content from teacher_addr where teacher_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			System.out.println(resultSet+"<--resultSet");
			
			if(resultSet.next()) {
				t = new TeacherAddr();
				t.setTeacherAddrContent(resultSet.getString("teacher_addr_content"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return t;
	}
	
	//teacher_addr 테이블 입력
	public int insertTeacherAddr(TeacherAddr teacherAddr, int no) {
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 작성하기 위하여 만들어준 객체참조변수
		int r = 0; //int data type으로 리턴을 하기 위하여 만들어준 변수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("insert into teacher_addr(teacher_no, teacher_addr_content) values(?, ?)"); //teacher_addr 테이블에 insert 쿼리문 작성
			pstmt.setInt(1, no); //teacher 테이블의 teacher_name에 들어갈 값
			pstmt.setString(2, teacherAddr.getTeacherAddrContent()); //teacher 테이블의 teacher_age에 들어갈 값

			r = pstmt.executeUpdate(); //쿼리 실행값을 int r 변수에 대입합니다. (실행되면 1이 담기고 아니면 0이 담깁니다.)
			System.out.println(r+"<--r");
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //pstmt의 값이 null이 아닐 경우 pstmt를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //conn의 값이 null이 아닐 경우 conn를 종료시켜줍니다.
		}
		return r; //메서드 호출한 곳으로 r 변수가 반환됩니다.
	}
}
