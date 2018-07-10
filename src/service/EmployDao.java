//2018.06.26 박원우
/*CREATE TABLE `employ` (
	`employ_no` INT(10) NOT NULL AUTO_INCREMENT,
	`employ_name` VARCHAR(50) NOT NULL,
	`employ_age` INT(10) NOT NULL,
	PRIMARY KEY (`employ_no`)
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

public class EmployDao {
	
	//페이징 메서드, 이름 검색 메서드
	public ArrayList<Employ> selectEmployByPage(int currentPage, int pagePerRow, String word) {
		
		ArrayList<Employ> list = new ArrayList<Employ>();
		Connection connection = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement statement = null; //테이블의 페이지를 나누는 쿼리문을 작성하기 위하여 사용하였음
		PreparedStatement statement2 = null; //테이블의 전체 행을 구하는 쿼리문을 작성하기 위하여 사용하였음
		ResultSet resultSet = null; //테이블의 페이지를 나누어진 결과 값을 가지고 오기 위하여 사용하였음
		ResultSet resultSet2 = null; //테이블의 전체 행의 결과 값을 가지고 오기 위하여 사용하였음
		String sql = "select employ_no, employ_name, employ_age from employ order by employ_no limit ?, ?"; //테이블 페이지 나누기
		String sql2 = "select count(employ_no) from employ"; //테이블의 전체 행의 수 구하기
		String sql3 = "select employ_no, employ_name, employ_age from employ where employ_name like ? order by employ_no limit ?, ?";
		
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
				row = resultSet2.getInt("count(employ_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) { //테이블의 전체 행의 수를  페이지 당 보여지는 갯수로 나누었을 때 나머지가 0이라면
				lastPage = row / pagePerRow; //마지막 페이지 = 테이블의 전체 행의 수 / 페이지 당 보여지는 갯수
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지 = (테이블의 전체 행의 수 / 페이지 당 보여지는 갯수) + 1
			}
			
			if(word.equals("")) {
				statement = connection.prepareStatement(sql);
				statement.setInt(1, startRow);
				statement.setInt(2, pagePerRow);
			}else {
				statement = connection.prepareStatement(sql3);
				statement.setString(1, "%"+word+"%");
				statement.setInt(2, startRow);
				statement.setInt(3, pagePerRow);
			}
			
			resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				Employ employ = new Employ();
				employ.setEmployNo(resultSet.getInt("employ_no"));
				employ.setEmployName(resultSet.getString("employ_name"));
				employ.setEmployAge(resultSet.getInt("employ_age"));
				employ.setLastPage(lastPage);
				list.add(employ);
			}
			
		} catch (ClassNotFoundException | SQLException ea) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			ea.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException ea) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료시켜줍니다.
			if (statement != null) try { statement.close(); } catch(SQLException ea) {} //statement의 값이 null이 아닐 경우 statement를 종료시켜줍니다.
			if (connection != null) try { connection.close(); } catch(SQLException ea) {} //connection의 값이 null이 아닐 경우 connection를 종료시켜줍니다.
		}
		return list; // list 최대 pagePerRow~1
	}
	
	//고용한 사람의 이름과 나이를 DB에 입력하는 메서드
	public int insertEmploy(Employ employ) {	//매개변수에 담긴 값은 객체주소값, 데이터 타입은 클래스
		Connection conn = null;
		PreparedStatement pstmt = null;	//초기값 설정
		int r = 0;	//리턴값을 설정하기 위한 변수 선언
		
		try {	//예외가 발생하면 catch로 이동
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement(
					"INSERT INTO employ(employ_name, employ_age) VALUES (?, ?)");	//쿼리 준비
			pstmt.setString(1, employ.getEmployName());	//변수 member에 대입된 주소값을 찾아가서 getMember_name메서드를 호출. 
			pstmt.setInt(2, employ.getEmployAge());		//리턴된 값이 ?에 대입.
			
			r = pstmt.executeUpdate();	//쿼리 실행, 실행 결과가 1이면 입력,0이면 입력실패
			System.out.println(r+" : 쿼리실행값");
			} catch (ClassNotFoundException ea) { //드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				ea.printStackTrace();
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ea) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException ea) {}	//conn종료
			}
		return r;
	}
	//삭제 메서드
	public void deleteEmploy(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	//초기값 설정
	
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("DELETE FROM employ WHERE employ_no=?");
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
			
			} catch (ClassNotFoundException ea) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				ea.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ea) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException ea) {}	//conn종료
			}
	}
	//업데이트 폼 메서드
	public Employ updateEmployForm(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet resultSet = null;
		
		Employ e = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("select * from employ where employ_no=?");
			pstmt.setInt(1, no);

			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				e = new Employ();
				e.setEmployName(resultSet.getString("employ_name"));
				e.setEmployAge(resultSet.getInt("employ_age"));
			}
			
			} catch (ClassNotFoundException ea) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				ea.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ea) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException ea) {}	//conn종료
			}
		return e;
	}
	//업데이트 메서드
	public void updateEmploy(Employ e) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
	
			pstmt = conn.prepareStatement("UPDATE employ SET employ_name=?, employ_age=? where employ_no=?");
			pstmt.setString(1, e.getEmployName());
			pstmt.setInt(2, e.getEmployAge());
			pstmt.setInt(3, e.getEmployNo());
	
			pstmt.executeUpdate();
			} catch (ClassNotFoundException ea) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				ea.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ea) {}	//pstmt종료
				if (conn != null) try { conn.close(); } catch(SQLException ea) {}	//conn종료
			}
	}
}
