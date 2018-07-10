/* 2018-07-09 이응빈 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherScoreDao {
	
	//teacher_score 테이블 평균 점수
	public int selectScoreAvg() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select avg(score) from teacher_score";
		int scoreAvg = 0;
		
		try {
			Class.forName(driver); //드라이버 로딩을 할 드라이버명
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				scoreAvg = rs.getInt("avg(score)");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return scoreAvg;
	}
	
	//teacher_score 테이블 평균 점수 이상인 사람만
	public ArrayList<TeacherAndScore> selectTeacherListAboveAvg() {
		ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select  t.teacher_no, t.teacher_name, ts.score from teacher_score ts inner join teacher t on ts.teacher_no=t.teacher_no where ts.score>=(select avg(score) from teacher_score) order by ts.score desc";
		
		try {
			Class.forName(driver); //드라이버 로딩을 할 드라이버명
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(rs.getInt("teacher_no"));
				teacher.setTeacherName(rs.getString("teacher_name"));
				
				TeacherScore teacherScore = new TeacherScore();
				teacherScore.setScore(rs.getInt("score"));
				
				TeacherAndScore teacherAndScore = new TeacherAndScore();
				teacherAndScore.setTeacher(teacher);
				teacherAndScore.setTeacherScore(teacherScore);
				list.add(teacherAndScore);
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		
		return list;
	}
	
	//점수 입력
	public void insertTeacherScore(TeacherScore teacherScore, int no) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			
			pstmt1 = conn.prepareStatement("select teacher_no from teacher_Score where teacher_no=?");
			pstmt1.setInt(1, no);
			resultSet = pstmt1.executeQuery();
			
			if(resultSet.next()) {
				pstmt2 = conn.prepareStatement("update teacher_score set  score=? where teacher_no=?");
				pstmt2.setInt(1, teacherScore.getScore());
				pstmt2.setInt(2, no);
			} else {
				pstmt2 = conn.prepareStatement("insert into teacher_score(teacher_no, score) values(?, ?)");
				pstmt2.setInt(1, no);
				pstmt2.setInt(2, teacherScore.getScore());
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
	
	// teacher 테이블과 teacher_score 테이블 join
	public ArrayList<TeacherAndScore> selectTeacherAndScored() {
		ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select t.teacher_no, teacher_name, teacher_age, score from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			statement = connection.prepareStatement(sql);
			
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
