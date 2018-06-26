/*28�� ��ȣ�� 2018.6.26(ȭ)*/
package service;	
import java.sql.*;	// ����̹� �ε��� �ο��� Ŭ�������� �ѹ��� ������ �Ͽ���. 
import service.Student;	// service ��Ű���� Student Ŭ������ ����Ʈ �Ͽ���.

public class StudentDao {
	
	public int insertStudent(Student student) {	// �޼����(insertStudent) , Student class data type �� �Ű����� student 
		Connection conn = null;	// ����̹��ε��� �ʿ��� Ŭ���� �� ���� conn�� ���� �ʱ�ȭ �Ͽ���.
		PreparedStatement pstmt = null;	// ����̹��ε��� �ʿ��� Ŭ���� �� ���� pstmt�� ���� �ʱ�ȭ �Ͽ���.
		
		try {	// ����ó���� �ϱ����� try...catch...finally �� ����
			Class.forName("com.mysql.jdbc.Driver");	// ����̹� �ε��ϱ�
			
			// DB ���� ����
			String dbUrl = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbId = "mysqlcrudid";
			String dbPw = "mysqlcrudpw";
		
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);	// DB ���� ��
			
			//	Query ������ ���� prepareStatemet ��ü ����
			pstmt = conn.prepareStatement("INSERT INTO student(student_name, student_age) VALUES(?, ?)");	// student ���̺� �ȿ� �̸��� ���̸� �Է��ϴ� ������.
			
			pstmt.setString(1, student.getStudentName());	// ù��° ? ��  student�� �ּҰ��� ã�ư��� student class�� studentName�� ������ student_name�� �����Ѵ�
			pstmt.setInt(2, student.getStudentAge());	// �ι�° ? ��  student�� �ּҰ��� ã�ư��� student class�� studentAge�� ������ student_age�� �����Ѵ�.
			pstmt.executeUpdate();	// ���� ����
			
		} catch (ClassNotFoundException | SQLException e) {	// class �� ��ã�ų� sql�� ���ܰ� �ִٸ� ����ó��
			e.printStackTrace();			
		}finally{	// ����ó�� ���ο� ������� ����
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}	//	pstmt ���� ���� 
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}	//	conn ���� ����
		}
		return 0;	
	}
}
