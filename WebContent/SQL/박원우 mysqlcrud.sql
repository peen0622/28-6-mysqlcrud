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
-- Dumping data for table mysqlcrud.employ: ~2 rows (대략적)
/*!40000 ALTER TABLE `employ` DISABLE KEYS */;
INSERT INTO `employ` (`employ_no`, `employ_name`, `employ_age`) VALUES
	(1, '가가가가', 444),
	(5, '사사', 66);
/*!40000 ALTER TABLE `employ` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.employ_addr: ~2 rows (대략적)
/*!40000 ALTER TABLE `employ_addr` DISABLE KEYS */;
INSERT INTO `employ_addr` (`employ_addr_no`, `employ_no`, `employ_addr_content`) VALUES
	(3, 1, '서신동'),
	(4, 1, '효자동'),
	(8, 5, '효자동');
/*!40000 ALTER TABLE `employ_addr` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.employ_score: ~2 rows (대략적)
/*!40000 ALTER TABLE `employ_score` DISABLE KEYS */;
INSERT INTO `employ_score` (`employ_score_no`, `employ_no`, `score`) VALUES
	(1, 1, 44),
	(2, 5, 55);
/*!40000 ALTER TABLE `employ_score` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.member: ~4 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(4, '김김', 123),
	(5, '가나다', 44);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.member_addr: ~2 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
INSERT INTO `member_addr` (`member_addr_no`, `member_no`, `member_addr_content`) VALUES
	(18, 5, '효자동'),
	(19, 4, '서신동');
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;

-- Dumping data for table mysqlcrud.member_score: ~4 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`member_score_no`, `member_no`, `score`) VALUES
	(3, 4, 99),
	(4, 5, 555);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
