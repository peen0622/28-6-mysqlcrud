//2018.07.09 박원우
/*CREATE TABLE `member_score` (
	`member_score_no` INT(10) NOT NULL AUTO_INCREMENT,
	`member_no` INT(10) NULL DEFAULT NULL,
	`score` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`member_score_no`),
	INDEX `FK_member_score_member` (`member_no`),
	CONSTRAINT `FK_member_score_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4;*/
package service;

public class MemberScore {
	private int memberScoreNo;
	private int memberNo;
	private int score;
	public int getMemberScoreNo() {
		return memberScoreNo;
	}
	public void setMemberScoreNo(int memberScoreNo) {
		this.memberScoreNo = memberScoreNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

}
