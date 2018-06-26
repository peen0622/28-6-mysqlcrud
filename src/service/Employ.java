/*2018.06.26 박원우*/
package service;

public class Employ {	//private는 자신의 클래스내에서만 사용가능
	private int employNo;	//private로 int 데이터 타입인 employ_no를 선언.
	private String employNname;	//private로 String 데이터 타입인 employ_name를 선언
	private int employAge;	//private로 int 데이터 타입인 employ_age를 선언.
	
	//public setter getter 메서드 선언
	public int getEmployNo() {	//다른 클래스에서도 사용할수 있게 public으로 메서드 선언
		return employNo;	//전역변수에 담긴 값이 리턴.
	}
	public void setEmployNo(int employNo) {
		this.employNo = employNo;	//셋팅된 값이 전역변수에 대입. 이름이 같아서 this로 구분.
	}
	public String getEmployName() {
		return employNname;
	}
	public void setEmployName(String employNname) {
		System.out.println(employNname+" : 셋팅한 이름");
		this.employNname = employNname;
	}
	public int getEmployAge() {
		return employAge;
	}
	public void setEmployAge(int employAge) {
		System.out.println(employAge+" : 셋팅한 나이");
		this.employAge = employAge;
	}
}
