//2018.07.09 박원우
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberScoreDao {
	Connection conn =null;
	PreparedStatement pstmt =null;
	PreparedStatement pstmt2 =null;
	PreparedStatement pstmt3 =null;
	ResultSet rs = null;
	
	public ArrayList<MemberAndScore> selectMemberAndScored(){
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
		String sql = "select ms.member_score_no ,ms.score ,ms.member_no ,m.member_name ,m.member_age from member_score ms inner join member m on ms.member_no = m.member_no";
		
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
			Member member = new Member();
			member.setMemberNo(rs.getInt("ms.member_no"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberAge(rs.getInt("member_age"));
			
			MemberScore memberScore = new MemberScore();
			memberScore.setMemberScoreNo(rs.getInt("member_score_no"));
			memberScore.setMemberNo(rs.getInt("member_no"));
			memberScore.setScore(rs.getInt("score"));
			
			MemberAndScore memberAndScore = new MemberAndScore();
			memberAndScore.setMember(member);
			memberAndScore.setMemberScore(memberScore);
			list.add(memberAndScore);
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
	
	public void insertMemberScore(MemberScore memberScore, int no) {
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "mysqlcrudid";
		String dbPass = "mysqlcrudpw";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
		
		pstmt = conn.prepareStatement("select member_score_no from member_score where member_no=?");	//member_score_no 를 찾기 위해 select.
		pstmt.setInt(1, no);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {	//조회결과가 있을 경우 실행. 조회가 되면 값이 있는 것이기 때문에 update해줌
		pstmt2 = conn.prepareStatement("update member_score set score=? where member_no=?");	//쿼리 준비
		pstmt2.setInt(1, memberScore.getScore());
		pstmt2.setInt(2, no);
	
		pstmt2.executeUpdate();
		}else {	//조회가 되지 않으면 값이 없는 것이기 때문에 insert 해줌.
			pstmt3 = conn.prepareStatement("insert into member_score(member_no, score) values(?, ?)");
			pstmt3.setInt(1, no);
			pstmt3.setInt(2, memberScore.getScore());
			
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
	
	public ArrayList<MemberAndScore> selectMemberListAboveAvg(){
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?" + 
				"useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select m.member_name, ms.score from member_score ms inner join member m on ms.member_no = m.member_no where ms.score>=(select avg(score) from member_score) order by ms.score DESC";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);	//DB연결
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
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
	
	public int selectScoreAvg() {
		//select AVG(score) from member_score		
		return 0;
	}
}
