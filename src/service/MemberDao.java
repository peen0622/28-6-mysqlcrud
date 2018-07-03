/*2018.06.26 박원우*/
/*CREATE TABLE `member` (
	`member_no` INT(10) NOT NULL AUTO_INCREMENT,
	`member_name` VARCHAR(50) NOT NULL,
	`member_age` INT(10) NOT NULL,
	PRIMARY KEY (`member_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB*/
package service;

import java.sql.Connection;	//import.
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {	
	
	public ArrayList<Member> selectMemberByPage(int currentPage, int pagePerRow) {
		ArrayList<Member> list = new ArrayList<Member>();
		Connection connection = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement statement = null; //테이블의 페이지를 나누는 쿼리문을 작성하기 위하여 사용하였음
		PreparedStatement statement2 = null; //테이블의 전체 행을 구하는 쿼리문을 작성하기 위하여 사용하였음
		ResultSet resultSet = null; //테이블의 페이지를 나누어진 결과 값을 가지고 오기 위하여 사용하였음
		ResultSet resultSet2 = null; //테이블의 전체 행의 결과 값을 가지고 오기 위하여 사용하였음
		String sql = "select member_no, member_name, member_age from member order by member_no limit ?, ?"; //테이블 페이지 나누기
		String sql2 = "select count(member_no) from member"; //테이블의 전체 행의 수 구하기
		
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
				row = resultSet2.getInt("count(member_no)"); //테이블의 전체 행의 수 구하기
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
				Member member = new Member();
				member.setMemberNo(resultSet.getInt("member_no"));
				member.setMemberName(resultSet.getString("member_name"));
				member.setMemberAge(resultSet.getInt("member_age"));
				member.setLastPage(lastPage);
				list.add(member);
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

	public int insertMember(Member member){	//insertMemberDao 메서드 선언
		Connection conn = null;	
		PreparedStatement pstmt = null;	//초기값 설정
		int r = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement(
					"INSERT INTO member(member_name, member_age) VALUES (?, ?)");	//쿼리 준비
			pstmt.setString(1, member.getMemberName());	//변수 member에 대입된 주소값을 찾아가서 getMember_name메서드를 호출. 
			pstmt.setInt(2, member.getMemberAge());		//리턴된 값이 ?에 대입.
			
			r = pstmt.executeUpdate();	//쿼리 실행, 실행 결과가 1이면 입력,0이면 입력실패
			} catch (ClassNotFoundException e) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
		return r;
	}
	public void deleteMember(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		PreparedStatement pstmt2 = null;	//초기값 설정
	
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt2 = conn.prepareStatement("DELETE FROM member_addr WHERE member_no=?");
			pstmt2.setInt(1, no);
			
			pstmt2.executeUpdate();
			
			pstmt = conn.prepareStatement("DELETE FROM member WHERE member_no=?");
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
			
			} catch (ClassNotFoundException e) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
	}
	public Member updateMemberForm(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet resultSet = null;
		
		Member m = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("select * from member where member_no=?");
			pstmt.setInt(1, no);

			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				m = new Member();
				m.setMemberName(resultSet.getString("Member_name"));
				m.setMemberAge(resultSet.getInt("member_age"));
			}
			
			} catch (ClassNotFoundException e) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
		return m;
	}
	
	public void updateMember(Member m) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
	
			pstmt = conn.prepareStatement("UPDATE member SET member_name=?, member_age=? where member_no=?");
			pstmt.setString(1, m.getMemberName());
			pstmt.setInt(2, m.getMemberAge());
			pstmt.setInt(3, m.getMemberNo());
	
			pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
	}
}
