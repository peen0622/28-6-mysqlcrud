//2018-06-26 ������
package service; //��Ű����

public class Teacher {
	private int teacherNo; //teacher�� ��ȣ
	private String teacherName; //teacher�� �̸�
	private int teacherAge; //teacher�� ����
	//�ش� Ŭ���� �������� ����ϱ� ���ؼ� ������ private�� ����Ͽ� ����� �ݴϴ�.
	
	
	//���� ������Ʈ ������ ȣ���ϱ� ���Ͽ� setter, getter �޼���� public�� ����Ͽ� ����� �ݴϴ�.
	public int getTeacherNo() {
		return teacherNo; //�޼��尡 ȣ���� ������ ��ȯ�˴ϴ�.
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo; //�Ű����� teacherNo�� ����ִ� ���� �������� teacherNo�� �����մϴ�.
	}
	public String getTeacherName() {
		return teacherName; //�޼��尡 ȣ���� ������ ��ȯ�˴ϴ�.
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName; //�Ű����� teacherName�� ����ִ� ���� �������� teacherName�� �����մϴ�.
	}
	public int getTeacherAge() {
		return teacherAge; //�޼��尡 ȣ���� ������ ��ȯ�˴ϴ�.
	}
	public void setTeacherAge(int teacherAge) {
		this.teacherAge = teacherAge; //�Ű����� teacherAge�� ����ִ� ���� �������� teacherAge�� �����մϴ�.
	}
}
