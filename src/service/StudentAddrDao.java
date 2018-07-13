//28 김호순 2018.7.3(화)
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentAddrDao {
	
	//주소수정 액션
	public void updateStudentAddr(StudentAddr studentAddr) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt1 = conn.prepareStatement("select student_no from student_addr where student_no=?");
			pstmt1.setInt(1, studentAddr.getStudentNo());
			resultSet = pstmt1.executeQuery();
			
			if(resultSet.next()) {
				pstmt2 = conn.prepareStatement("update student_addr set student_addr_content=? where student_addr_no=?");
				pstmt2.setString(1, studentAddr.getStudentAddrContent());
				pstmt2.setInt(2, studentAddr.getStudentAddrNo());
			} else {
				pstmt2 = conn.prepareStatement("insert into student_addr(student_no, student_addr_content) values(?, ?)");
				pstmt2.setInt(1, studentAddr.getStudentNo());
				pstmt2.setString(2, studentAddr.getStudentAddrContent());
			}
			
			pstmt2.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	//주소 수정폼
	public StudentAddr updateStudentAddrForm(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		StudentAddr studentAddr = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("select student_addr_content from student_addr where student_addr_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				studentAddr = new StudentAddr();
				studentAddr.setStudentAddrContent(resultSet.getString("student_addr_content"));
			}else {
				studentAddr = new StudentAddr();
				studentAddr.setStudentAddrContent("주소를 입력해주세요!");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return studentAddr;
	}
	//주소 행 삭제
	public void deleteStudentAddr(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw"; 
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("delete from student_addr where student_addr_no=?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	//주소 리스트
	public ArrayList<StudentAddr> selectStudentAddr(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		StudentAddr studentAddr = null;
		ArrayList<StudentAddr> list = new ArrayList<StudentAddr>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("select student_addr_content, student_addr_no from student_addr where student_no=? order by student_addr_no desc");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				studentAddr = new StudentAddr();
				studentAddr.setStudentAddrContent(resultSet.getString("student_addr_content"));
				studentAddr.setStudentAddrNo(resultSet.getInt("student_addr_no"));
				list.add(studentAddr);
			}
			if(!resultSet.previous()) {
				studentAddr = new StudentAddr();
				studentAddr.setStudentAddrContent("주소를 입력해주세요!");
				list.add(studentAddr);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return list;
	}
	// 주소 입력
	public void insertStudentAddr(StudentAddr studentAddr, int no) {	// 메서드명(insertStudentAddr) , StudentAddr class data type 의 매개변수 studentAddr,  받아온 넘버 매개변수 no
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
			pstmt = conn.prepareStatement("insert into student_addr(student_no, student_addr_content) values(?, ?)");	// student 테이블 안에 번호와 주소를 입력하는 쿼리문.
			pstmt.setInt(1, no);	// 첫번째 ? 에  studemt_no 를 가져와 세팅
			pstmt.setString(2, studentAddr.getStudentAddrContent());	// 두번째 ? 에  studentAddr의 주소값을 찾아가서 studentAddr class의 studentAddrContent을 가져와 student_addr_content에 셋팅한다.
			
			pstmt.executeUpdate();	// 쿼리 실행
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}finally{	// 오류처리 여부와 관계없이 실행
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
		}
	} 
}
