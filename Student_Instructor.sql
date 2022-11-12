Create database roster;
use roster;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS Course;
CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;

CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (user_id, course_id)
) ENGINE=InnoDB CHARACTER SET=utf8;
Call Teacher("Eoghan", "si106", 1);
Call Teacher("Esmeralda", "si106", 0);
Call Teacher("Kaiwen", "si106", 0);
Call Teacher("Nikela", "si106", 0);
Call Teacher("Remi", "si106", 0);
Call Teacher("Larissa", "si110", 1);
Call Teacher("Alliah", "si110", 0);
Call Teacher("Bracken", "si110", 0);
Call Teacher("Kinza", "si110", 0);
Call Teacher("Will", "si110", 0);
Call Teacher("Connal", "si206", 1);
Call Teacher("Aarifah", "si206", 0);
Call Teacher("Bonni", "si206", 0);
Call Teacher("Hamid", "si206", 0);
Call Teacher("Justine", "si206", 0);
SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name;