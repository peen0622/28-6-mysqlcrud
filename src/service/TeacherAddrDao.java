//2018-07-10 이응빈
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherAddrDao {
	
	//teacher_addr 테이블 수정
	public void updateTeacherAddr(TeacherAddr teacherAddr) {
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
			
			pstmt1 = conn.prepareStatement("select teacher_no from teacher_addr where teacher_no=?");
			pstmt1.setInt(1, teacherAddr.getTeacherNo());
			resultSet = pstmt1.executeQuery();
			
			if(resultSet.next()) {
				pstmt2 = conn.prepareStatement("update teacher_addr set teacher_addr_content=? where teacher_addr_no=?");
				pstmt2.setString(1, teacherAddr.getTeacherAddrContent());
				pstmt2.setInt(2, teacherAddr.getTeacherAddrNo());
			} else {
				pstmt2 = conn.prepareStatement("insert into teacher_addr(teacher_no, teacher_addr_content) values(?, ?)");
				pstmt2.setInt(1, teacherAddr.getTeacherNo());
				pstmt2.setString(2, teacherAddr.getTeacherAddrContent());
			}
			
			pstmt2.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//teacher_addr 테이블 수정 폼
		public TeacherAddr updateTeacherAddrForm(int no) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet resultSet = null;
			TeacherAddr teacherAddr = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
				
				String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
				String dbId = "mysqlcrudid"; //DB 아이디
				String dbPw = "mysqlcrudpw"; //DB 비밀번호
				
				conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
				
				pstmt = conn.prepareStatement("select teacher_addr_content from teacher_addr where teacher_addr_no=?");
				pstmt.setInt(1, no);
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next()) {
					teacherAddr = new TeacherAddr();
					teacherAddr.setTeacherAddrContent(resultSet.getString("teacher_addr_content"));
				} else {
					teacherAddr = new TeacherAddr();
					teacherAddr.setTeacherAddrContent("주소를 입력해주세요!");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} finally {
				if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try { conn.close(); } catch(SQLException e) {}
			}
			return teacherAddr;
		}
		
	//teacher_addr 테이블 한 행 삭제
	public void deleteTeacherAddr(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher_addr 테이블의 행 삭제
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("delete from teacher_addr where teacher_addr_no=?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//teacher_addr 테이블 teacher_addr_content 리스트
	public ArrayList<TeacherAddr> selectTeacherAddr(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		TeacherAddr teacherAddr = null;
		ArrayList<TeacherAddr> list = new ArrayList<TeacherAddr>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("select teacher_addr_content, teacher_addr_no from teacher_addr where teacher_no=? order by teacher_addr_no desc");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				teacherAddr = new TeacherAddr();
				teacherAddr.setTeacherAddrContent(resultSet.getString("teacher_addr_content"));
				teacherAddr.setTeacherAddrNo(resultSet.getInt("teacher_addr_no"));
				list.add(teacherAddr);
			}
			if(!resultSet.previous()) {
				teacherAddr = new TeacherAddr();
				teacherAddr.setTeacherAddrContent("주소를 입력해주세요!");
				list.add(teacherAddr);
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
	
	//teacher_addr 테이블 입력
	public void insertTeacherAddr(TeacherAddr teacherAddr, int no) {
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 작성하기 위하여 만들어준 객체참조변수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("insert into teacher_addr(teacher_no, teacher_addr_content) values(?, ?)"); //teacher_addr 테이블에 insert 쿼리문 작성
			pstmt.setInt(1, no); //teacher 테이블의 teacher_name에 들어갈 값
			pstmt.setString(2, teacherAddr.getTeacherAddrContent()); //teacher 테이블의 teacher_age에 들어갈 값

			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //pstmt의 값이 null이 아닐 경우 pstmt를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //conn의 값이 null이 아닐 경우 conn를 종료시켜줍니다.
		}
	}
}
