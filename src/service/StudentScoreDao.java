//김호순 2018.7.9(화)
package service;
import service.StudentAndScore;
import service.StudentScore;
import java.sql.*;
import java.util.ArrayList;

public class StudentScoreDao {
	//조인 검색
	public ArrayList<StudentAndScore> selectStudentAndScore(){
		
		ArrayList<StudentAndScore>  list = new ArrayList<StudentAndScore>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select s.student_no, student_name, student_age, score from student_score sc inner join student s on sc.student_no=s.student_no";
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid"; 
			String dbPass = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		while(rs.next()) {
			Student student = new Student();
			student.setStudentNo(rs.getInt("student_no"));
			student.setStudentName(rs.getString("student_name"));
			student.setStudentAge(rs.getInt("student_age"));
			
			StudentScore studentScore = new StudentScore();
			studentScore.setScore(rs.getInt("score"));
			
			StudentAndScore studentAndScore = new StudentAndScore();
			studentAndScore.setStudent(student);
			studentAndScore.setStudentScore(studentScore);
			list.add(studentAndScore);
		}
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 preparedstatement를 종료
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료
		}
		return list;
	}
	// 점수 입력
	public void insertStudentScore(StudentScore studentScore, int no) {
		Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
		PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
		PreparedStatement pstmt2 = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt2의 값을 초기화 하였다.
		ResultSet rs = null;
		
		try {	// 예외처리를 하기위한 try...catch...finally 문 시작
			Class.forName("com.mysql.jdbc.Driver");	// 드라이버 로딩하기
			
			// DB 연결 시작
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);	// DB 연결 끝
			
			//	Query 실행을 위한 prepareStatemet 객체 생성
			pstmt = conn.prepareStatement("select student_no from student_score where student_no=?");	// 1. 학생번호를 조회한다
			pstmt.setInt(1, no);	// 첫번째 ? 에  studemt_no 를 가져와 세팅
			rs = pstmt.executeQuery();	// 쿼리 실행
			
			if(rs.next()) {
				pstmt2 = conn.prepareStatement("update student_score set score=? where student_no=?");	//2. 조회가 되이않으면 덮어쓰기 (수정) 하는 쿼리문 작성
				pstmt2.setInt(1, studentScore.getScore());
				pstmt2.setInt(2, no);
			}else {
				pstmt2 = conn.prepareStatement("insert into student_score(student_no, score) values(?, ?)");
				pstmt2.setInt(1, studentScore.getStudent_no());
				pstmt2.setInt(2, studentScore.getScore());
			}
			pstmt2.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}finally{	// 오류처리 여부와 관계없이 실행
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}	//	pstmt2 연결 종료 
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
		}
	}
	//평균
	public int selectScoreAvg() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select avg(score) from student_score";
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
	//평균점수 이상인사람만 조회하기
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(){
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select s.student_no, s.student_name, ss.score from student_score ss inner join student s on ss.student_no = s.student_no where ss.score>=(select avg(score) from student_score) order by ss.score desc";
			
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid"; 
			String dbPass = "mysqlcrudpw";
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student student = new Student();
				student.setStudentNo(rs.getInt("student_no"));
				student.setStudentName(rs.getString("student_name"));
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(rs.getInt("score"));
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
			}
		
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 preparedstatement를 종료.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료
		}
		return list;
	}
}
