//김호순 2018.7.9(화)
package service;
import service.StudentAndScore;
import service.StudentScore;
import java.sql.*;
import java.util.ArrayList;

public class StudentScoreDao {
	
	//점수 입력 폼
	public StudentScore insertStudentScoreForm(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		StudentScore studentScore = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("select score from student_score where student_no=?");
			pstmt.setInt(1, no);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				studentScore = new StudentScore();
				studentScore.setScore(resultSet.getInt("score"));
			} else {
				studentScore = new StudentScore();
				studentScore.setScore(0);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return studentScore;
	}
	//평균
	public int selectScoreAvg() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet resultSet = null;
		int scoreAvg = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			stmt = conn.prepareStatement("select avg(score) from student_score");
			resultSet = stmt.executeQuery();
			
			if(resultSet.next()) {
				scoreAvg = resultSet.getInt("avg(score)");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return scoreAvg;
	}
	//평균점수 이상인사람만 조회하기
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(int currentPage, int pagePerRow, String word){
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn = null;	
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
			
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				pstmt2 = conn.prepareStatement("select count(ss.student_no)  from student_score ss inner join student s on ss.student_no=s.student_no where ss.score>=(select avg(score) from student_score)");
				pstmt = conn.prepareStatement("select  s.student_no, s.student_name, ss.score from student_score ss inner join student s on ss.student_no=s.student_no where ss.score>=(select avg(score) from student_score) order by ss.score desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			} else {
				pstmt2 = conn.prepareStatement("select count(ss.student_no)  from student_score ss inner join student s on ss.student_no=s.student_no where ss.score>=(select avg(score) from student_score) and s.student_name like ?");
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement("select  s.student_no, s.student_name, ss.score from student_score ss inner join student s on ss.student_no=s.student_no where ss.score>=(select avg(score) from student_score) and s.student_name like ? order by ss.score desc limit ?, ?");
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			
			resultSet2 = pstmt2.executeQuery();
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(ss.student_no)"); //테이블의 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}	

			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				Student student = new Student();
				student.setStudentNo(resultSet.getInt("student_no"));
				student.setStudentName(resultSet.getString("student_name"));
				student.setLastPage(lastPage);
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(resultSet.getInt("score"));
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
			}if(!resultSet.previous()) {
				Student student = new Student();
				student.setStudentName("검색하신 이름이 없습니다.");
				student.setLastPage(lastPage);
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(0);
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
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
	// 점수 입력
	public void insertStudentScore(StudentScore studentScore, int no) {
		Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
		PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
		PreparedStatement pstmt2 = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt2의 값을 초기화 하였다.
		ResultSet resultSet = null;
		
		try {	// 예외처리를 하기위한 try...catch...finally 문 시작
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			//	Query 실행을 위한 prepareStatemet 객체 생성
			pstmt = conn.prepareStatement("select student_no from student_score where student_no=?");	// 1. 학생번호를 조회한다
			pstmt.setInt(1, no);	// 첫번째 ? 에  studemt_no 를 가져와 세팅
			resultSet = pstmt.executeQuery();	// 쿼리 실행
			
			if(resultSet.next()) {
				pstmt2 = conn.prepareStatement("update student_score set score=? where student_no=?");	//2. 조회가 되이않으면 덮어쓰기 (수정) 하는 쿼리문 작성
				pstmt2.setInt(1, studentScore.getScore());
				pstmt2.setInt(2, no);
			}else {
				pstmt2 = conn.prepareStatement("insert into student_score(student_no, score) values(?, ?)");
				pstmt2.setInt(1, no);
				pstmt2.setInt(2, studentScore.getScore());
			}
			
			pstmt2.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}finally{	// 오류처리 여부와 관계없이 실행
			if (resultSet != null) try { resultSet.close(); } catch(SQLException ex) {}	//	resultSet 연결 종료
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}	//	pstmt2 연결 종료 
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
		}
	}
	//조인 학색 리스트 ,검색,페이징
	public ArrayList<StudentAndScore> selectStudentAndScore(int currentPage, int pagePerRow, String word){
		ArrayList<StudentAndScore>  list = new ArrayList<StudentAndScore>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid"; 
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				pstmt2 = conn.prepareStatement("select count(s.student_no) from student_score ss inner join student s on ss.student_no = s.student_no");
				pstmt = conn.prepareStatement("select s.student_no, student_name, student_age, score from student_score ss inner join student s on ss.student_no = s.student_no order by student_no desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			} else {
				pstmt2 = conn.prepareStatement("select count(s.student_no) from student_score ss inner join student s on ss.student_no = s.student_no where s.student_name like ?");
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement("select s.student_no, student_name, student_age, score from student_score ss inner join student s on ss.student_no = s.student_no where s.student_name like ? order by student_no desc limit ?, ?");
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			
			resultSet2 = pstmt2.executeQuery();
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(s.student_no)"); //테이블의 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}
			
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				Student student = new Student();
				student.setStudentNo(resultSet.getInt("student_no"));
				student.setStudentName(resultSet.getString("student_name"));
				student.setStudentAge(resultSet.getInt("student_age"));
				student.setLastPage(lastPage);
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(resultSet.getInt("score"));
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
			}if(!resultSet.previous()) {
				Student student = new Student();
				student.setStudentName("검색하신 이름이 없습니다.");
				student.setLastPage(lastPage);
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(0);
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
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
}
