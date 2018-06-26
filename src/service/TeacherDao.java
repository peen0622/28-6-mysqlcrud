//2018-06-26 이응빈
package service; //패키지명

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//java.sql.* (앞의 java.sql 부분을 생략하여 쓰기 위해서 import 시켜줍니다.)
public class TeacherDao {
	
	public int insertTeacher(Teacher teacher) { //return data type : int, 메서드명 : insertTeacher, 매개변수 data type : Teacher, 매개변수 : teacher
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 작성하기 위하여 만들어준 객체참조변수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("insert into teacher(teacher_name, teacher_age) values(?, ?)"); //teacher 테이블에 insert 쿼리문 작성
			pstmt.setString(1, teacher.getTeacherName()); //teacher_name에 들어갈 값
			pstmt.setInt(2, teacher.getTeacherAge()); //teacher_age에 들어갈 값
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //pstmt의 값이 null이 아닐 경우 pstmt를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //conn의 값이 null이 아닐 경우 conn를 종료시켜줍니다.
		}
		return 0; //메서드가 호출한 곳으로 0을 반환한다.
	}
}
