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
package service; //패키지명

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//java.sql.* (앞의 java.sql 부분을 생략하여 쓰기 위해서 import 시켜줍니다.)
public class TeacherDao {
	
	public ArrayList<Teacher> selectTeacherByPage(int currentPage, int pagePerRow) {
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		Connection connection = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement statement = null; //테이블의 페이지를 나누는 쿼리문을 작성하기 위하여 사용하였음
		PreparedStatement statement2 = null; //테이블의 전체 행을 구하는 쿼리문을 작성하기 위하여 사용하였음
		ResultSet resultSet = null; //테이블의 페이지를 나누어진 결과 값을 가지고 오기 위하여 사용하였음
		ResultSet resultSet2 = null; //테이블의 전체 행의 결과 값을 가지고 오기 위하여 사용하였음
		String sql = "select teacher_no, teacher_name, teacher_age from teacher order by teacher_no limit ?, ?"; //테이블 페이지 나누기
		String sql2 = "select count(teacher_no) from teacher"; //테이블의 전체 행의 수 구하기
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			statement2 = connection.prepareStatement(sql2);
			resultSet2 = statement2.executeQuery();
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(teacher_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) { //테이블의 전체 행의 수를  페이지 당 보여지는 갯수로 나누었을 때 나머지가 0이라면
				lastPage = row / pagePerRow; //마지막 페이지 = 테이블의 전체 행의 수 / 페이지 당 보여지는 갯수
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지 = (테이블의 전체 행의 수 / 페이지 당 보여지는 갯수) + 1
			}
			
			statement = connection.prepareStatement(sql);
			statement.setInt(1, startRow);
			statement.setInt(2, pagePerRow);
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
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료시켜줍니다.
			if (statement != null) try { statement.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 statement를 종료시켜줍니다.
			if (connection != null) try { connection.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료시켜줍니다.
		}
		return list; // list 최대 pagePerRow~1
	}
	
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