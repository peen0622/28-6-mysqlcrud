-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- mysqlcrud 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `mysqlcrud` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysqlcrud`;


-- 테이블 mysqlcrud의 구조를 덤프합니다. employ
CREATE TABLE IF NOT EXISTS `employ` (
  `employ_no` int(10) NOT NULL AUTO_INCREMENT,
  `employ_name` varchar(50) NOT NULL,
  `employ_age` int(10) NOT NULL,
  PRIMARY KEY (`employ_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.employ: ~7 rows (대략적)
/*!40000 ALTER TABLE `employ` DISABLE KEYS */;
INSERT INTO `employ` (`employ_no`, `employ_name`, `employ_age`) VALUES
	(1, '가가가가', 444),
	(5, '사사', 66);
/*!40000 ALTER TABLE `employ` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. employ_addr
CREATE TABLE IF NOT EXISTS `employ_addr` (
  `employ_addr_no` int(10) NOT NULL,
  `employ_no` int(11) NOT NULL,
  `employ_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`employ_addr_no`),
  KEY `FK_employ_addr_employ` (`employ_no`),
  CONSTRAINT `FK_employ_addr_employ` FOREIGN KEY (`employ_no`) REFERENCES `employ` (`employ_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.employ_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `employ_addr` DISABLE KEYS */;
INSERT INTO `employ_addr` (`employ_addr_no`, `employ_no`, `employ_addr_content`) VALUES
	(3, 1, '서신동'),
	(4, 1, '효자동'),
	(8, 5, '효자동');
/*!40000 ALTER TABLE `employ_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. employ_score
CREATE TABLE IF NOT EXISTS `employ_score` (
  `employ_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `employ_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`employ_score_no`),
  KEY `FK__employ` (`employ_no`),
  CONSTRAINT `FK__employ` FOREIGN KEY (`employ_no`) REFERENCES `employ` (`employ_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.employ_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `employ_score` DISABLE KEYS */;
INSERT INTO `employ_score` (`employ_score_no`, `employ_no`, `score`) VALUES
	(1, 1, 44),
	(2, 5, 55);
/*!40000 ALTER TABLE `employ_score` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_age` int(10) NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.member: ~7 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(4, '김김', 123),
	(5, '가나다', 44);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `member_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK_member_addr_member` (`member_no`),
  CONSTRAINT `FK_member_addr_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.member_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
INSERT INTO `member_addr` (`member_addr_no`, `member_no`, `member_addr_content`) VALUES
	(18, 5, '효자동'),
	(19, 4, '서신동');
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. member_score
CREATE TABLE IF NOT EXISTS `member_score` (
  `member_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_score_no`),
  KEY `FK_member` (`member_no`),
  CONSTRAINT `FK_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.member_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`member_score_no`, `member_no`, `score`) VALUES
	(3, 4, 99),
	(4, 5, 555);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL,
  `student_age` int(10) NOT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.student: ~9 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '이응빈', 24),
	(2, '김호순', 25);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. student_addr
CREATE TABLE IF NOT EXISTS `student_addr` (
  `student_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `student_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`student_addr_no`),
  KEY `FK_student_addr_student` (`student_no`),
  CONSTRAINT `FK_student_addr_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.student_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `student_addr` DISABLE KEYS */;
INSERT INTO `student_addr` (`student_addr_no`, `student_no`, `student_addr_content`) VALUES
	(12, 2, '금암동'),
	(13, 2, '금암동'),
	(17, 1, '서신동2가 1-1');
/*!40000 ALTER TABLE `student_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`student_score_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.student_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(1, 1, 100),
	(2, 2, 66);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_age` int(10) NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.teacher: ~12 rows (대략적)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_name`, `teacher_age`) VALUES
	(1, '이수', 26),
	(2, '김진수', 23),
	(3, '김덕환', 22),
	(4, '이순신', 24),
	(5, '이이', 22),
	(6, '이황', 31),
	(7, '이민호', 27),
	(8, '김수민', 11),
	(9, '이진수', 24),
	(10, '원우Park', 26),
	(11, 'ownerPark', 34),
	(12, '박원우', 26);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. teacher_addr
CREATE TABLE IF NOT EXISTS `teacher_addr` (
  `teacher_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `teacher_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_addr_no`),
  KEY `FK_teacher_addr_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_addr_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.teacher_addr: ~11 rows (대략적)
/*!40000 ALTER TABLE `teacher_addr` DISABLE KEYS */;
INSERT INTO `teacher_addr` (`teacher_addr_no`, `teacher_no`, `teacher_addr_content`) VALUES
	(1, 12, '서신동'),
	(2, 1, '조촌동'),
	(3, 3, '서울'),
	(4, 4, '서울'),
	(5, 6, '대전'),
	(6, 5, '서신동'),
	(7, 7, '서신동'),
	(11, 1, '평화동'),
	(12, 2, '서신동'),
	(13, 3, '서신동'),
	(14, 8, '중화산동');
/*!40000 ALTER TABLE `teacher_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `teacher_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`teacher_score_no`),
  KEY `FK__teacher` (`teacher_no`),
  CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud.teacher_score: ~12 rows (대략적)
/*!40000 ALTER TABLE `teacher_score` DISABLE KEYS */;
INSERT INTO `teacher_score` (`teacher_score_no`, `teacher_no`, `score`) VALUES
	(1, 1, 80),
	(2, 2, 90),
	(3, 3, 90),
	(4, 4, 90),
	(5, 5, 78),
	(6, 6, 42),
	(7, 7, 85),
	(8, 8, 75),
	(9, 9, 82),
	(10, 10, 25),
	(11, 11, 34),
	(12, 12, 17);
/*!40000 ALTER TABLE `teacher_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
