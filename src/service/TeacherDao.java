/*�����ͺ��̽� ���̺�
	CREATE TABLE `teacher` (
	`teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
	`teacher_name` VARCHAR(50) NOT NULL,
	`teacher_age` INT(10) NOT NULL,
	PRIMARY KEY (`teacher_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB*/
//2018-06-26 ������
package service; //��Ű����

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//java.sql.* (���� java.sql �κ��� �����Ͽ� ���� ���ؼ� import �����ݴϴ�.)
public class TeacherDao {
	
	public int insertTeacher(Teacher teacher) { //�����ͺ��̽��� �ִ� teacher ���̺� �� ���� �����͸� �Է��ϱ� ���� �޼���
		Connection conn = null; //����̹� �ε��� �ϱ� ���Ͽ� ������� ��ü��������
		PreparedStatement pstmt = null; //PreparedStatement �������� �ۼ��ϱ� ���Ͽ� ������� ��ü��������
		int r = 0; //int data type���� ������ �ϱ� ���Ͽ� ������� ����
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε��� �� ����̹���
			
			String URL = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr"; //URL �ּ�
			String dbUser = "mysqlcrudid"; //DB ���̵�
			String dbPass = "mysqlcrudpw"; //DB ��й�ȣ
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("insert into teacher(teacher_name, teacher_age) values(?, ?)"); //teacher ���̺� insert ������ �ۼ�
			pstmt.setString(1, teacher.getTeacherName()); //teacher ���̺��� teacher_name�� �� ��
			pstmt.setInt(2, teacher.getTeacherAge()); //teacher ���̺��� teacher_age�� �� ��

			r = pstmt.executeUpdate(); //���� ���ప�� int r ������ �����մϴ�. (����Ǹ� 1�� ���� �ƴϸ� 0�� ���ϴ�.)
			System.out.println(r+"<--r");
			
		} catch (ClassNotFoundException | SQLException e) { //Class ������ ã�� ���ϰų� SQL���� ���ܰ� �߻��Ͽ��� ��
			e.printStackTrace(); //���� �޼����� �߻� �ٿ����� ã�Ƽ� �ܰ躰�� ������ ���
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //pstmt�� ���� null�� �ƴ� ��� pstmt�� ��������ݴϴ�.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //conn�� ���� null�� �ƴ� ��� conn�� ��������ݴϴ�.
		}
		return r; //�޼��� ȣ���� ������ r ������ ��ȯ�˴ϴ�.
	}
}
