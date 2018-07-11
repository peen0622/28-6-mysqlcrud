//2018-07-02 이응빈
/*데이터베이스 테이블
	CREATE TABLE `teacher` (
	`teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
	`teacher_name` VARCHAR(50) NOT NULL,
	`teacher_age` INT(10) NOT NULL,
	PRIMARY KEY (`teacher_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherDao {
	
	public ArrayList<Teacher> selectTeacherByPage(int currentPage, int pagePerRow, String word) {
		
		// teacherList 이름으로 조회 및 페이징
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		Connection connection = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement statement = null; //테이블의 페이지를 나누는 쿼리문을 작성하기 위하여 사용하였음
		PreparedStatement statement2 = null; //테이블의 전체 행을 구하는 쿼리문을 작성하기 위하여 사용하였음
		ResultSet resultSet = null; //테이블의 페이지를 나누어진 결과 값을 가지고 오기 위하여 사용하였음
		ResultSet resultSet2 = null; //테이블의 전체 행의 결과 값을 가지고 오기 위하여 사용하였음
		String sql1 = "select teacher_no, teacher_name, teacher_age from teacher order by teacher_no limit ?, ?"; //테이블 페이지 나누기
		String sql2 = "select teacher_no, teacher_name, teacher_age from teacher where teacher_name like ? order by teacher_no limit ?, ?";
		String sql3 = "select count(teacher_no) from teacher"; //테이블의 전체 행의 수 구하기
		String sql4 = "select count(teacher_no) from teacher where teacher_name like ?"; //테이블의 검색 조건에 맞는 행의 수 구하기
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				statement2 = connection.prepareStatement(sql3);
				statement = connection.prepareStatement(sql1);
				statement.setInt(1, startRow);
				statement.setInt(2, pagePerRow);
			} else {
				statement2 = connection.prepareStatement(sql4);
				statement2.setString(1, "%"+word+"%");
				statement = connection.prepareStatement(sql2);
				statement.setString(1, "%"+word+"%");
				statement.setInt(2, startRow);
				statement.setInt(3, pagePerRow);
			}
			
			resultSet2 = statement2.executeQuery();
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(teacher_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}
			
			resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(resultSet.getInt("teacher_no"));
				teacher.setTeacherName(resultSet.getString("teacher_name"));
				teacher.setTeacherAge(resultSet.getInt("teacher_age"));
				teacher.setLastPage(lastPage);
				list.add(teacher);
			}
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (resultSet2 != null) try { resultSet2.close(); } catch(SQLException e) {}
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (statement2 != null) try { statement2.close(); } catch(SQLException e) {}
			if (statement != null) try { statement.close(); } catch(SQLException e) {}
			if (connection != null) try { connection.close(); } catch(SQLException e) {}
		}
		return list; // list 최대 pagePerRow~1
	}
	
	//teacher 테이블 수정
	public void updateTeacher(Teacher t) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher 테이블의 행 수정
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("update teacher set teacher_name=?, teacher_age=? where teacher_no=?");
			pstmt.setString(1, t.getTeacherName());
			pstmt.setInt(2, t.getTeacherAge());
			pstmt.setInt(3, t.getTeacherNo());
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//teacher 테이블 수정 폼
	public Teacher updateTeacherForm(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher 테이블의 행 수정 화면
		ResultSet resultSet = null;
		Teacher t = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("select teacher_name, teacher_age from teacher where teacher_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				t = new Teacher();
				t.setTeacherName(resultSet.getString("teacher_name"));
				t.setTeacherAge(resultSet.getInt("teacher_age"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return t;
	}
	
	//teacher 테이블 삭제
	public void deleteTeacher(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher_addr 테이블의 행 삭제
		PreparedStatement pstmt2 = null; //teacher 테이블의 행 삭제
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			
			pstmt2 = conn.prepareStatement("delete from teacher where teacher_no=?");
			pstmt2.setInt(1, no);
			pstmt2.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//teacher 테이블 입력
	public int insertTeacher(Teacher teacher) { //데이터베이스에 있는 teacher 테이블에 한 행의 데이터를 입력하기 위한 메서드
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
			
			pstmt = conn.prepareStatement("insert into teacher(teacher_name, teacher_age) values(?, ?)"); //teacher 테이블에 insert 쿼리문 작성
			pstmt.setString(1, teacher.getTeacherName()); //teacher 테이블의 teacher_name에 들어갈 값
			pstmt.setInt(2, teacher.getTeacherAge()); //teacher 테이블의 teacher_age에 들어갈 값

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