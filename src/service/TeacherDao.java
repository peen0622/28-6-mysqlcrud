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
	
	// teacherList 이름으로 조회 및 페이징
	public ArrayList<Teacher> selectTeacherByPage(int currentPage, int pagePerRow, String word) {
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //테이블의 페이지를 나누는 쿼리문을 작성하기 위하여 사용하였음
		PreparedStatement pstmt2 = null; //테이블의 전체 행을 구하는 쿼리문을 작성하기 위하여 사용하였음
		ResultSet resultSet = null; //테이블의 페이지를 나누어진 결과 값을 가지고 오기 위하여 사용하였음
		ResultSet resultSet2 = null; //테이블의 전체 행의 결과 값을 가지고 오기 위하여 사용하였음
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				pstmt2 = conn.prepareStatement("select count(teacher_no) from teacher"); //테이블의 전체 행의 수 구하기
				pstmt = conn.prepareStatement("select teacher_no, teacher_name, teacher_age from teacher order by teacher_no desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			} else {
				pstmt2 = conn.prepareStatement("select count(teacher_no) from teacher where teacher_name like ?"); //테이블의 검색 조건에 맞는 행의 수 구하기
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement("select teacher_no, teacher_name, teacher_age from teacher where teacher_name like ? order by teacher_no desc limit ?, ?");
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			
			resultSet2 = pstmt2.executeQuery();
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(teacher_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}
			
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(resultSet.getInt("teacher_no"));
				teacher.setTeacherName(resultSet.getString("teacher_name"));
				teacher.setTeacherAge(resultSet.getInt("teacher_age"));
				teacher.setLastPage(lastPage);
				list.add(teacher);
			}
			if(!resultSet.previous()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherName("검색하신 이름이 없습니다.");
				teacher.setLastPage(lastPage);
				list.add(teacher);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet2 != null) try { resultSet2.close(); } catch(SQLException e) {}
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return list;
	}
	
	//teacher 테이블 수정
	public void updateTeacher(Teacher teacher) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher 테이블의 행 수정
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("update teacher set teacher_name=?, teacher_age=? where teacher_no=?");
			pstmt.setString(1, teacher.getTeacherName());
			pstmt.setInt(2, teacher.getTeacherAge());
			pstmt.setInt(3, teacher.getTeacherNo());
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
		Teacher teacher = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("select teacher_name, teacher_age from teacher where teacher_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				teacher = new Teacher();
				teacher.setTeacherName(resultSet.getString("teacher_name"));
				teacher.setTeacherAge(resultSet.getInt("teacher_age"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return teacher;
	}
	
	//teacher 테이블 삭제
	public void deleteTeacher(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null; //teacher_addr 테이블의 행 삭제
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("delete from teacher where teacher_no=?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//teacher 테이블 입력
	public void insertTeacher(Teacher teacher) { //데이터베이스에 있는 teacher 테이블에 한 행의 데이터를 입력하기 위한 메서드
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 작성하기 위하여 만들어준 객체참조변수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbId = "mysqlcrudid"; //DB 아이디
			String dbPw = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			pstmt = conn.prepareStatement("insert into teacher(teacher_name, teacher_age) values(?, ?)"); //teacher 테이블에 insert 쿼리문 작성
			pstmt.setString(1, teacher.getTeacherName()); //teacher 테이블의 teacher_name에 들어갈 값
			pstmt.setInt(2, teacher.getTeacherAge()); //teacher 테이블의 teacher_age에 들어갈 값

			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
}