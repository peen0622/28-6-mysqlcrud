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
-- Dumping data for table mysqlcrud.student: ~3 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '이응빈', 24),
	(2, '김호순', 25);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.student_addr: ~3 rows (대략적)
/*!40000 ALTER TABLE `student_addr` DISABLE KEYS */;
INSERT INTO `student_addr` (`student_addr_no`, `student_no`, `student_addr_content`) VALUES
	(12, 2, '금암동'),
	(13, 2, '금암동'),
	(17, 1, '서신동2가 1-1');
/*!40000 ALTER TABLE `student_addr` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.student_score: ~3 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(1, 1, 100),
	(2, 2, 66);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
