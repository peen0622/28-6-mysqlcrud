/*2018.06.26 �ڿ���*/
package service;

import java.sql.Connection;	//import.
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {	
	public int insertMember(Member member){	//insertMemberDao �޼��� ����
		Connection conn = null;	
		PreparedStatement pstmt = null;	//�ʱⰪ ����
		int a = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");	//����̹� �ε�
	
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "mysqlcrudid";
			String dbPass = "mysqlcrudpw";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);	//DB����
			
			pstmt = conn.prepareStatement(
					"INSERT INTO member(member_name, member_age) VALUES (?, ?)");	//���� �غ�
			pstmt.setString(1, member.getMemberName());	//���� member�� ���Ե� �ּҰ��� ã�ư��� getMember_name�޼��带 ȣ��. 
			pstmt.setInt(2, member.getMemberAge());		//���ϵ� ���� ?�� ����.
			
			a = pstmt.executeUpdate();	//���� ����, ���� ����� 1�̸� �Է�,0�̸� �Է½���
			} catch (ClassNotFoundException e) {	//����̹� �ε� ã�� ���� ���ܰ� �߻��ϸ� ����.
				System.out.println("���� �߻�1");
				e.printStackTrace();	
			} catch (SQLException ex) {	//SQL���� ���ܰ� �߻��ϸ� ����
				System.out.println("���� �߻�2");
				ex.printStackTrace();
			}finally{	//���ܰ� �߻��ϵ� ���ϵ� �ʼ��� ����.
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}	//pstmt����
				if (conn != null) try { conn.close(); } catch(SQLException e) {}	//conn����
			}
		return a;
	}
}
