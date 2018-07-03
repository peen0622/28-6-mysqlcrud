/*2018-07-03 박원우*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberAddrDao {
	
	public int insertMemberAddr(MemberAddr memberAddr, int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;		//초기값 설정
		int r = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
	
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "mysqlcrudid";
		String dbPass = "mysqlcrudpw";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
		
		pstmt = conn.prepareStatement("INSERT INTO member_addr(member_no, member_addr_content) VALUES (?,?)");	//쿼리 준비
		pstmt.setInt(1, no);
		pstmt.setString(2, memberAddr.getMemberAddrContent());	
		
		r = pstmt.executeUpdate();
		
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
	// 주소 리스트
	public MemberAddr selectMemberAddr(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		MemberAddr ma = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
	
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "mysqlcrudid";
		String dbPass = "mysqlcrudpw";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
		
		pstmt = conn.prepareStatement("select member_addr_content from member_addr where member_no=?");	//쿼리 준비
		pstmt.setInt(1, no);
		
		resultSet = pstmt.executeQuery();
		
		if(resultSet.next()) {
			ma = new MemberAddr();
			ma.setMemberAddrContent(resultSet.getString("member_addr_content"));
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
		return ma;
	}
}