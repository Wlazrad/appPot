

CREATE DATABASE `mojabaza` /*!40100 DEFAULT CHARACTER SET utf8 */;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `expert_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT FK_EXPERT_DETAIL FOREIGN KEY (expert_id) REFERENCES expert (expert_id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `expert_id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(45) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `project` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`expert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_expert`;
CREATE TABLE `user_expert` (
  `user_id` int(11) NOT NULL,
  `expert_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`expert_id`),
  FOREIGN KEY (`user_id`)REFERENCES `user` (`user_id`),
  FOREIGN KEY (`expert_id`)REFERENCES `expert` (expert_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `user_id` int(11)NOT NULL,
  `expert_id` int(11) NOT NULL,
  `create_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET utf8;


DROP TABLE IF EXISTS `comments_users`;
CREATE TABLE `comments_users`(
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
 PRIMARY KEY (`user_id`,`comment_id`),
 FOREIGN KEY (`user_id`)REFERENCES `user` (`user_id`),
 FOREIGN KEY (`comment_id`)REFERENCES `comment`(`comment_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;










