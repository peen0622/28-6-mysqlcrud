/* 2018-07-09 이응빈
 * CREATE TABLE `teacher_score` (
	`teacher_score_no` INT(10) NOT NULL AUTO_INCREMENT,
	`teacher_no` INT(10) NOT NULL,
	`score` INT(10) NOT NULL,
	PRIMARY KEY (`teacher_score_no`),
	INDEX `FK__teacher` (`teacher_no`),
	CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7;

 * */
package service;

public class TeacherScore {
	private int teacherScoreNo;
	private int teacherNo;
	private int score;
	
	public int getTeacherScoreNo() {
		return teacherScoreNo;
	}
	public void setTeacherScoreNo(int teacherScoreNo) {
		this.teacherScoreNo = teacherScoreNo;
	}
	public int getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	

}
