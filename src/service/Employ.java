/*2018.06.26 �ڿ���*/
package service;

public class Employ {	//private�� �ڽ��� Ŭ������������ ��밡��
	private int employNo;	//private�� int ������ Ÿ���� employ_no�� ����.
	private String employNname;	//private�� String ������ Ÿ���� employ_name�� ����
	private int employAge;	//private�� int ������ Ÿ���� employ_age�� ����.
	
	//public setter getter �޼��� ����
	public int getEmployNo() {	//�ٸ� Ŭ���������� ����Ҽ� �ְ� public���� �޼��� ����
		return employNo;	//���������� ��� ���� ����.
	}
	public void setEmployNo(int employNo) {
		this.employNo = employNo;	//���õ� ���� ���������� ����. �̸��� ���Ƽ� this�� ����.
	}
	public String getEmployName() {
		return employNname;
	}
	public void setEmployName(String employNname) {
		System.out.println(employNname+" : �̸�");
		this.employNname = employNname;
	}
	public int getEmployAge() {
		return employAge;
	}
	public void setEmployAge(int employAge) {
		System.out.println(employAge+" : ����");
		this.employAge = employAge;
	}
}
