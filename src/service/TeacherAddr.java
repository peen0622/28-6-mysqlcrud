//2018-06-26 이응빈
package service;

public class TeacherAddr {
	private int teacherAddrNo;
	private int teacherNo;
	private String teacherAddrContent;
	
	public int getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	public int getTeacherAddrNo() {
		return teacherAddrNo;
	}
	public void setTeacherAddrNo(int teacherAddrNo) {
		this.teacherAddrNo = teacherAddrNo;
	}
	public String getTeacherAddrContent() {
		return teacherAddrContent;
	}
	public void setTeacherAddrContent(String teacherAddrContent) {
		this.teacherAddrContent = teacherAddrContent;
	}
}