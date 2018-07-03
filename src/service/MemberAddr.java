/*2018-07-03 박원우*/
package service;

public class MemberAddr {
	private int memberAddrNo;
	private String memberAddrContent;
	public int getMemberAddrNo() {
		return memberAddrNo;
	}
	public void setMemberAddrNo(int memberAddrNo) {
		this.memberAddrNo = memberAddrNo;
	}
	public String getMemberAddrContent() {
		return memberAddrContent;
	}
	public void setMemberAddrContent(String memberAddrContent) {
		System.out.println(memberAddrContent+"<--memberAddrContent");
		this.memberAddrContent = memberAddrContent;
	}
}
