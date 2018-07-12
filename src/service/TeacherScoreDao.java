/* 2018-07-09 이응빈 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherScoreDao {
	
	//점수 입력 폼
	public TeacherScore insertTeacherScoreForm(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		TeacherScore t = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("select score from teacher_score where teacher_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				t = new TeacherScore();
				t.setScore(resultSet.getInt("score"));
			} else {
				t = new TeacherScore();
				t.setScore(0);
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
	public ArrayList<TeacherAndScore> selectTeacherListAboveAvg(int currentPage, int pagePerRow, String word) {
		ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select  t.teacher_no, t.teacher_name, ts.score from teacher_score ts inner join teacher t on ts.teacher_no=t.teacher_no where ts.score>=(select avg(score) from teacher_score) order by ts.score desc limit ?, ?";
		String sql2 = "select  t.teacher_no, t.teacher_name, ts.score from teacher_score ts inner join teacher t on ts.teacher_no=t.teacher_no where ts.score>=(select avg(score) from teacher_score) and t.teacher_name like ? order by ts.score desc limit ?, ?";
		String sql3 = "select count(ts.teacher_no)  from teacher_score ts inner join teacher t on ts.teacher_no=t.teacher_no where ts.score>=(select avg(score) from teacher_score)";
		String sql4 = "select count(ts.teacher_no)  from teacher_score ts inner join teacher t on ts.teacher_no=t.teacher_no where ts.score>=(select avg(score) from teacher_score) and t.teacher_name like ?";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				stmt2 = conn.prepareStatement(sql3);
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, startRow);
				stmt.setInt(2, pagePerRow);
			} else {
				stmt2 = conn.prepareStatement(sql4);
				stmt2.setString(1, "%"+word+"%");
				stmt = conn.prepareStatement(sql2);
				stmt.setString(1, "%"+word+"%");
				stmt.setInt(2, startRow);
				stmt.setInt(3, pagePerRow);
			}
			
			rs2 = stmt2.executeQuery();
			
			if(rs2.next()) {
				row = rs2.getInt("count(ts.teacher_no)"); //테이블의 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}	

			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(rs.getInt("teacher_no"));
				teacher.setTeacherName(rs.getString("teacher_name"));
				teacher.setLastPage(lastPage);
				
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
			if (rs2 != null) try { rs2.close(); } catch(SQLException e) {}
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (stmt2 != null) try { stmt2.close(); } catch(SQLException e) {}
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
	public ArrayList<TeacherAndScore> selectTeacherAndScored(int currentPage, int pagePerRow, String word) {
		ArrayList<TeacherAndScore> list = new ArrayList<TeacherAndScore>();
		Connection connection = null;
		PreparedStatement statement = null;
		PreparedStatement statement2 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		String sql = "select t.teacher_no, teacher_name, teacher_age, score from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no order by teacher_no desc limit ?, ?";
		String sql2 = "select t.teacher_no, teacher_name, teacher_age, score from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no where t.teacher_name like ? order by teacher_no desc limit ?, ?";
		String sql3 = "select count(t.teacher_no) from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no"; //테이블의 전체 행의 수 구하기
		String sql4 = "select count(t.teacher_no) from teacher_score ts inner join teacher t on ts.teacher_no = t.teacher_no where t.teacher_name like ?"; //테이블의 검색 조건에 맞는 행의 수 구하기
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "mysqlcrudid"; //DB 아이디
			String dbPass = "mysqlcrudpw"; //DB 비밀번호
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				statement2 = connection.prepareStatement(sql3);
				statement = connection.prepareStatement(sql);
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
				row = resultSet2.getInt("count(t.teacher_no)"); //테이블의 행의 수 구하기
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
			if (resultSet2 != null) try { resultSet2.close(); } catch(SQLException e) {}
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (statement2 != null) try { statement2.close(); } catch(SQLException e) {}
			if (statement != null) try { statement.close(); } catch(SQLException e) {}
			if (connection != null) try { connection.close(); } catch(SQLException e) {}
		}
		return list; 
	}
}
