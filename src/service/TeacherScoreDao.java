/*<!-- 2018-07-09 이응빈 -->*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherScoreDao {
	//점수 입력
	public void insertTeacherScore(TeacherScore teacherScore, int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("insert into teacher_Score(teacher_no, score) values(?, ?)");
			pstmt.setInt(1, no);
			pstmt.setInt(2, teacherScore.getScore());

			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	// teacher 테이블과 teacher_score 테이블 join
	public ArrayList<TeacherAndScore> selectTeacherAndScored(int no) {
		ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select t.teacher_no, teacher_name, teacher_age, score from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no where ts.teacher_no=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			statement = connection.prepareStatement(sql);
			statement.setInt(1, no);
			
			resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(resultSet.getInt("teacher_no"));
				teacher.setTeacherName(resultSet.getString("teacher_name"));
				teacher.setTeacherAge(resultSet.getInt("teacher_age"));
				
				TeacherScore teacherScore = new TeacherScore();
				teacherScore.setScore(resultSet.getInt("score"));
				
				TeacherAndScore teacherAndScore = new TeacherAndScore();
				teacherAndScore.setTeacher(teacher);
				teacherAndScore.setTeacherScore(teacherScore);
				list.add(teacherAndScore);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (statement != null) try { statement.close(); } catch(SQLException e) {}
			if (connection != null) try { connection.close(); } catch(SQLException e) {}
		}
		return list; 
	}
}
