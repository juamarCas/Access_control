
CREATE TABLE `mqtt_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mqtt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `mqtt_acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allow` int(1) DEFAULT 1 COMMENT '0: deny, 1: allow',
  `ipaddr` varchar(60) DEFAULT NULL COMMENT 'IpAddress',
  `username` varchar(100) DEFAULT NULL COMMENT 'Username',
  `clientid` varchar(100) DEFAULT NULL COMMENT 'ClientId',
  `access` int(2) NOT NULL COMMENT '1: subscribe, 2: publish, 3: pubsub',
  `topic` varchar(100) NOT NULL DEFAULT '' COMMENT 'Topic Filter',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `mqtt_user` ( `username`, `password`, `salt`, `is_superuser`)
VALUES
	('device', '123123', NULL, 0);

    INSERT INTO `mqtt_user` ( `username`, `password`, `salt`, `is_superuser`)
VALUES
	('server', '123server', NULL, 0);


CREATE TABLE `Cards` (
  `card_id` varchar(60) NOT NULL,
  `model` varchar(60), 
  `card_registered_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `card_assigned` boolean DEFAULT false,
  PRIMARY KEY(`card_id`)
)ENGINE=InnoDB;

CREATE TABLE `Admin`(
	`admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `admin_user` varchar(60) NOT NULL, 
  `admin_pass` varchar(60) NOT NULL, 
  PRIMARY KEY(`admin_id`)
)ENGINE=InnoDB; 

CREATE TABLE `Persons` (
  `person_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_name` varchar(60) NOT NULL, 
  `person_lastname` varchar(60) NOT NULL, 
  `card_id` varchar(60),
  `admin_id` int(11) unsigned,
  `person_registered_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`person_id`), 
  FOREIGN KEY(`card_id`) REFERENCES `Cards`(`card_id`), 
  FOREIGN KEY(`admin_id`) REFERENCES `Admin`(`admin_id`)
)ENGINE=InnoDB; 

CREATE TABLE `Rooms` (
  `room_id` varchar(60) NOT NULL , 
  `room_name` varchar(60) NOT NULL,
  `room_location`varchar(60) NOT NULL, 
  `room_registered_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY(`room_id`)
)ENGINE=InnoDB;

CREATE TABLE `Rooms_cards`(
  `room_id` varchar(60), 
  `card_id` varchar(60),
  FOREIGN KEY (`room_id`) REFERENCES `Rooms`(`room_id`), 
  FOREIGN KEY (`card_id`) REFERENCES `Cards`(`card_id`)
)ENGINE=InnoDB;

CREATE TABLE `Logs`(
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_person_name` varchar(60), 
  `log_person_id` int(11), 
  `log_card_id` varchar(60), 
  `log_room_id` varchar(60), 
  `log_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY(`register_id`)
);
