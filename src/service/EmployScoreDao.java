/*2018.07.10 박원우*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployScoreDao {
	Connection conn =null;
	PreparedStatement pstmt =null;
	PreparedStatement pstmt2 =null;
	PreparedStatement pstmt3 =null;
	ResultSet rs = null;
	
	//점수 리스트 메서드
	public ArrayList<EmployAndScore> selectEmployAndScored(){
		ArrayList<EmployAndScore> list = new ArrayList<EmployAndScore>();
		String sql = "select es.employ_score_no ,es.score ,es.employ_no ,e.employ_name ,e.employ_age from employ_score es inner join employ e on es.employ_no = e.employ_no";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	 		
			while(rs.next()) {
			Employ employ = new Employ();
			employ.setEmployNo(rs.getInt("es.employ_no"));
			employ.setEmployName(rs.getString("employ_name"));
			employ.setEmployAge(rs.getInt("employ_age"));
			
			EmployScore employScore = new EmployScore();
			employScore.setEmployScoreNo(rs.getInt("employ_score_no"));
			employScore.setEmployNo(rs.getInt("employ_no"));
			employScore.setScore(rs.getInt("score"));
			
			EmployAndScore employAndScore = new EmployAndScore();
			employAndScore.setEmploy(employ);
			employAndScore.setEmployScore(employScore);
			list.add(employAndScore);
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
		return list;
	}
	//점수 입력 메서드
	public void insertEmployScore(EmployScore employScore, int no) {	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
			
			pstmt = conn.prepareStatement("select employ_score_no from employ_score where employ_no=?");	//member_score_no 를 찾기 위해 select.
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//조회결과가 있을 경우 실행. 조회가 되면 값이 있는 것이기 때문에 update해줌
			pstmt2 = conn.prepareStatement("update employ_score set score=? where employ_no=?");	//쿼리 준비
			pstmt2.setInt(1, employScore.getScore());
			pstmt2.setInt(2, no);
		
			pstmt2.executeUpdate();
			}else {	//조회가 되지 않으면 값이 없는 것이기 때문에 insert 해줌.
				pstmt3 = conn.prepareStatement("insert into employ_score(employ_no, score) values(?, ?)");
				pstmt3.setInt(1, no);
				pstmt3.setInt(2, employScore.getScore());
				
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
	//평균 점수 이상 조회하는 메서드
	public ArrayList<EmployAndScore> selectEmployListAboveAvg(){
		
		ArrayList<EmployAndScore> list = new ArrayList<EmployAndScore>();
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?" + 
				"useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select e.employ_no, e.employ_name, es.score from employ_score es inner join employ e on es.employ_no = e.employ_no where es.score>=(select avg(score) from employ_score) order by es.score DESC";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);	//DB연결
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				Employ e = new Employ();
				e.setEmployNo(rs.getInt("e.employ_no"));
				e.setEmployName(rs.getString("e.employ_name"));
				
				EmployScore es = new EmployScore();
				es.setScore(rs.getInt("es.score"));
				
				EmployAndScore eas = new EmployAndScore();
				eas.setEmploy(e);
				eas.setEmployScore(es);
		
				list.add(eas);
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
		return list;
	}
	//점수 평균 구하는 메서드
	public int selectScoreAvg() {
		int r = 0;
	
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?" + 
				"useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select avg(score) from employ_score";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);	//DB연결
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				r = rs.getInt("avg(score)");
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
		return r;
	}
}
