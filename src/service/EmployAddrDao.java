/*2018-07-03 박원우*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployAddrDao {
	//주소 입력
	public int insertEmployAddr(EmployAddr employAddr, int no) {
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
		
		pstmt = conn.prepareStatement("INSERT INTO employ_addr(employ_no, employ_addr_content) VALUES (?,?)");	//쿼리 준비
		pstmt.setInt(1, no);
		pstmt.setString(2, employAddr.getEmployAddrContent());	
		
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
	public EmployAddr selectEmployAddr(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		EmployAddr ea = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
	
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "mysqlcrudid";
		String dbPass = "mysqlcrudpw";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
		
		pstmt = conn.prepareStatement("select employ_addr_content from employ_addr where employ_no=?");	//쿼리 준비
		pstmt.setInt(1, no);
		
		resultSet = pstmt.executeQuery();
		
		if(resultSet.next()) {
			ea = new EmployAddr();
			ea.setEmployAddrContent(resultSet.getString("employ_addr_content"));
		}else {
			ea = new EmployAddr();
			ea.setEmployAddrContent("주소를 입력해 주세요!");
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
		return ea;
	}
	//주소 삭제
	public void deleteAddrEmploy(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;		//초기값 설정
	
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("DELETE FROM employ_addr WHERE employ_no=?");
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
	//주소 업데이트 폼
	public EmployAddr updateAddrEmployForm(int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet resultSet = null;
		
		EmployAddr ea = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("select * from employ_addr where employ_no=?");
			pstmt.setInt(1, no);

			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				ea = new EmployAddr();
				ea.setEmployAddrContent(resultSet.getString("employ_addr_content"));
			}else {
				ea = new EmployAddr();
				ea.setEmployAddrContent("주소를 입력해 주세요!");
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
		return ea;
	}
	//주소 업데이트
	public void updateAddrEmploy(EmployAddr ea,int no) {
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("select employ_addr_no from employ_addr where employ_no=?");
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt2 = conn.prepareStatement("UPDATE employ_addr SET employ_no=?, employ_addr_content=? where employ_no=?");
				pstmt2.setInt(1, no);
				pstmt2.setString(2, ea.getEmployAddrContent());
				pstmt2.setInt(3, no);
		
				pstmt2.executeUpdate();
			
			}else {
				pstmt3 = conn.prepareStatement("insert into employ_addr(employ_no, employ_addr_content) values(?, ?)");
				pstmt3.setInt(1, no);
				pstmt3.setString(2, ea.getEmployAddrContent());
				
				pstmt3.executeUpdate();
			}
			
			} catch (ClassNotFoundException e) {	//드라이버 로딩 찾지 못해 예외가 발생하면 실행.
				System.out.println("오류 발생1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL에서 예외가 발생하면 실행
				System.out.println("오류 발생2");
				ex.printStackTrace();
			}finally{	//예외가 발생하든 안하든 필수로 실행.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt종료
				if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}	//pstmt2종료
				if (pstmt3 != null) try { pstmt3.close(); } catch(SQLException e) {}	//pstmt3종료
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
			}
	}
}
