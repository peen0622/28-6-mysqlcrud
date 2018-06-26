/*2018.06.26 박원우*/
package service;

public class Member {		//private는 자신의 클래스내에서만 사용가능
	private int memberNo;	//private로 int 데이터 타입인 member_no를 선언.
	private String memberName;	//private로 String 데이터 타입인 member_name를 선언.
	private int memberAge;	//private로 int 데이터 타입인 member_age를 선언.
	
	//public setter getter 메서드 선언
	public int getMemberNo() {	//다른 클래스에서도 사용할수 있게 public으로 메서드 선언
		return memberNo;	//전역변수에 담긴 값이 리턴.
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;	//셋팅된 값이 전역변수에 대입. 이름이 같아서 this로 구분.
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		System.out.println(memberName+" : 이름");
		this.memberName = memberName;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		System.out.println(memberAge+" : 나이");
		this.memberAge = memberAge;
	}
}
