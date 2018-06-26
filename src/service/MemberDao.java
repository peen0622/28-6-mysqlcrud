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
import java.sql.SQLException;

public class MemberDao {	
	public int insertMember(Member member){	//insertMemberDao 메서드 선언
		Connection conn = null;	
		PreparedStatement pstmt = null;	//초기값 설정
		int a = 0;
		
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
			
			a = pstmt.executeUpdate();	//쿼리 실행, 실행 결과가 1이면 입력,0이면 입력실패
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
		return a;
	}
}
