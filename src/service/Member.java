/*2018.06.26 �ڿ���*/
package service;

public class Member {		//private�� �ڽ��� Ŭ������������ ��밡��
	private int memberNo;	//private�� int ������ Ÿ���� member_no�� ����.
	private String memberName;	//private�� String ������ Ÿ���� member_name�� ����.
	private int memberAge;	//private�� int ������ Ÿ���� member_age�� ����.
	
	//public setter getter �޼��� ����
	public int getMemberNo() {	//�ٸ� Ŭ���������� ����Ҽ� �ְ� public���� �޼��� ����
		return memberNo;	//���������� ��� ���� ����.
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;	//���õ� ���� ���������� ����. �̸��� ���Ƽ� this�� ����.
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		System.out.println(memberName+" : �̸�");
		this.memberName = memberName;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		System.out.println(memberAge+" : ����");
		this.memberAge = memberAge;
	}
}
