DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Teacher`(IN l_name VARCHAR(128), IN class_id VARCHAR(128), IN role INT)
BEGIN
	INSERT IGNORE INTO Course (title) VALUES (class_id);
    INSERT IGNORE INTO `User` (`name`) VALUES (l_name);
    INSERT IGNORE INTO Member VALUES (
    (Select user_id From `User` Where `name` = l_name),
    (Select course_id FROM Course Where title = class_id),
    role);
END$$
DELIMITER ;
