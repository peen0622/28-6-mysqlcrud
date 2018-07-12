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
	ResultSet rs2 = null;

	//회원 점수 입력
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
	//회원 점수 리스트
	public ArrayList<MemberAndScore> selectMemberAndScored(int currentPage, int pagePerRow, String word){
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
		
		String sql1 = "select m.member_no, member_name, member_age, score from member_score ms inner join member m on ms.member_no = m.member_no order by member_no desc limit ?, ?";
		String sql2 = "select m.member_no, member_name, member_age, score from member_score ms inner join member m on ms.member_no = m.member_no where m.member_name like ? order by member_no desc limit ?, ?";
		String sql3 = "select count(m.member_no) from member_score ms inner join member m on ms.member_no = m.member_no";
		String sql4 = "select count(m.member_no) from member_score ms inner join member m on ms.member_no = m.member_no where m.member_name like ?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//드라이버 로딩
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB연결
		
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				pstmt2 = conn.prepareStatement(sql3);
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			}else {
				pstmt2 = conn.prepareStatement(sql4);
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			rs2 = pstmt2.executeQuery();
	
			if(rs2.next()) {
				row = rs2.getInt("count(m.member_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) { //테이블의 전체 행의 수를  페이지 당 보여지는 갯수로 나누었을 때 나머지가 0이라면
				lastPage = row / pagePerRow; //마지막 페이지 = 테이블의 전체 행의 수 / 페이지 당 보여지는 갯수
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지 = (테이블의 전체 행의 수 / 페이지 당 보여지는 갯수) + 1
			}
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				Member member = new Member();
				member.setMemberNo(rs.getInt("member_no"));
				member.setMemberName(rs.getString("member_name"));
				member.setMemberAge(rs.getInt("member_age"));
				member.setLastPage(lastPage);
				
				MemberScore memberScore = new MemberScore();
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
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}	//pstmt종료
			if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn종료
		}
		return list;
	}
	//점수 평균 이상
	public ArrayList<MemberAndScore> selectMemberListAboveAvg(){
		
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>();
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?" + 
				"useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select m.member_no, m.member_name, ms.score from member_score ms inner join member m on ms.member_no = m.member_no where ms.score>=(select avg(score) from member_score) order by ms.score DESC";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);	//DB연결
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				Member m = new Member();
				m.setMemberNo(rs.getInt("m.member_no"));
				m.setMemberName(rs.getString("m.member_name"));
				
				MemberScore ms = new MemberScore();
				ms.setScore(rs.getInt("ms.score"));
				
				MemberAndScore mas = new MemberAndScore();
				mas.setMember(m);
				mas.setMemberScore(ms);
		
				list.add(mas);
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
	//점수 평균
	public int selectScoreAvg() {
	
		int r = 0;
	
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mysqlcrud?" + 
				"useUnicode=true&characterEncoding=euckr";
		String user = "mysqlcrudid";
		String password = "mysqlcrudpw";
		String sql = "select avg(score) from member_score";
		
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
