/*28기 김호순 2018.6.26(화요일)*/
package service;	
import java.sql.*;	// 드라이버 로딩에 핑요한 클래스들을 한번에 임포드 하였다. 
import java.util.ArrayList;
import service.Student;	// service 패키지내 Student 클래스를 임포트 하였다

public class StudentDao {
	
	//입력
	public int insertStudent(Student student) {	// 메서드명(insertStudent) , Student class data type 의 매개변수 student
		Connection conn = null;	// 드라이버로딩에 필요한 클래스 의 변수 conn의 값을 초기화 하였다.
		PreparedStatement pstmt = null;	// 드라이버로딩에 필요한 클래스 의 변수 pstmt의 값을 초기화 하였다.
		
		try {	// 예외처리를 하기위한 try...catch...finally 문 시작
			Class.forName("com.mysql.jdbc.Driver");	// 드라이버 로딩하기
			
			// DB 연결 시작
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);	// DB 연결 끝
			
			//	Query 실행을 위한 prepareStatemet 객체 생성
			pstmt = conn.prepareStatement("INSERT INTO student(student_name, student_age) VALUES(?, ?)");	// student 테이블 안에 이름과 나이를 입력하는 쿼리문.
			
			pstmt.setString(1, student.getStudentName());	// 첫번째 ? 에  student의 주소값을 찾아가서 student class의 studentName을 가져와 student_name에 셋팅한다
			pstmt.setInt(2, student.getStudentAge());	// 두번째 ? 에  student의 주소값을 찾아가서 student class의 studentAge을 가져와 student_age에 셋팅한다.
			pstmt.executeUpdate();	// 쿼리 실행
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();			
		}finally{	// 오류처리 여부와 관계없이 실행
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt 연결 종료 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn 연결 종료
		}
		return 0;
	}
	//조회
	public ArrayList<Student> selectStudentByPage(int currentPage, int pagePerRow) {
		ArrayList<Student> list = new ArrayList<Student>();
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; 
		PreparedStatement pstmt2 = null; 
		ResultSet rs = null; 
		ResultSet rs2 = null; 
		String sql = "select student_no, student_name, student_age from student order by student_no limit ?, ?";
		String sql2 = "select count(student_no) from student"; //테이블의 전체 행의 수 구하기
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid"; 
			String dbPass = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			
			pstmt2 = conn.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(rs2.next()) {
				row = rs2.getInt("count(student_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) { //테이블의 전체 행의 수를  페이지 당 보여지는 갯수로 나누었을 때 나머지가 0이라면
				lastPage = row / pagePerRow; //마지막 페이지 = 테이블의 전체 행의 수 / 페이지 당 보여지는 갯수
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지 = (테이블의 전체 행의 수 / 페이지 당 보여지는 갯수) + 1
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pagePerRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student student = new Student();
				student.setStudentNo(rs.getInt("student_no"));
				student.setStudentName(rs.getString("student_name"));
				student.setStudentAge(rs.getInt("student_age"));
				student.setLastPage(lastPage);
				list.add(student);
			}
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료시켜줍니다.
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 statement를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료시켜줍니다.
		}
		return list; // list 최대 pagePerRow~1
	}}
