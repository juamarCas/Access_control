
--mqtt_user and mqtt_acl are tables provided by emqx for the access control
--for more info https://docs.emqx.io/en/broker/latest/advanced/acl-mysql.html#mysql-connection-information
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

--Creating users for mqtt authentication

INSERT INTO `mqtt_user` ( `username`, `password`, `salt`, `is_superuser`)
VALUES
	('device', '123123', NULL, 0);

    INSERT INTO `mqtt_user` ( `username`, `password`, `salt`, `is_superuser`)
VALUES
	('server', '123server', NULL, 0);

--project tables

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

CREATE TABLE `Users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL, 
  `user_lastname` varchar(60) NOT NULL, 
  `card_id` varchar(60),
  `admin_id` int(11) unsigned,
  `user_registered_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`user_id`), 
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

--this tamble defines which card has acces to which room

CREATE TABLE `Rooms_cards`(
  `room_id` varchar(60), 
  `card_id` varchar(60),
  FOREIGN KEY (`room_id`) REFERENCES `Rooms`(`room_id`), 
  FOREIGN KEY (`card_id`) REFERENCES `Cards`(`card_id`)
)ENGINE=InnoDB;

CREATE TABLE `Register`(
  `register_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `register_user_name` varchar(60), 
  `register_user_id` int(11), 
  `register_card_id` varchar(60), 
  `register_room_id` varchar(60), 
  `register_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY(`register_id`)
);

INSER INTO `Register` (`register_user_name`, `register_user_name`, `register_user_id`,
`register_card_id`, `register_room_id`) VALUES ()

INSERT INTO `Admin` (`admin_user`, `admin_pass`) VALUES (`admin`, `admin`); 
INSERT INTO `Users` (`user_name`, `user_lastname`, `card_id`, `admin_id`) 
VALUES ('Felipe', 'Mogollon', '5649781231', 1); 
--IMPLEMENTATION TEST
/*
--Insert test cards 
INSERT INTO `Cards` (`card_id`, `model`) VALUES ('1234567890', 'Card'); 
INSERT INTO `Cards` (`card_id`, `model`) VALUES ('0987654321', 'Card'); 
INSERT INTO `Cards` (`card_id`, `model`) VALUES ('5649781231', 'Card'); 

---Insert test users
INSERT INTO `Users` (`user_name`, `user_lastname`, `card_id`) 
VALUES ('Carlos', 'Ramirez', '1234567890'); 

INSERT INTO `Users` (`user_name`, `user_lastname`, `card_id`) 
VALUES ('Pablo', 'Navarro', '0987654321'); 

INSERT INTO `Users` (`user_name`, `user_lastname`, `card_id`) 
VALUES ('Felipe', 'Mogollon', '5649781231'); 

--Insert test rooms
INSERT INTO `Rooms` (`room_id`, `room_name`, `room_location`) 
VALUES ('hab1_001', 'principal room', 'lobby'); 

INSERT INTO `Rooms` (`room_id`, `room_name`, `room_location`) 
VALUES ('hab1_002', 'principal room', 'lobby'); 

INSERT INTO `Rooms` (`room_id`, `room_name`, `room_location`) 
VALUES ('hab1_003', 'principal room', 'lobby'); 

--Insert test room-cards

INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('1234567890', 'hab1_001');
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('1234567890', 'hab1_002');
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('0987654321', 'hab1_001');
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('0987654321', 'hab1_003');
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('5649781231', 'hab1_001'); 
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('5649781231', 'hab1_002'); 
INSERT INTO `Rooms_cards` (`card_id`, `room_id`) VALUES ('5649781231', 'hab1_003'); 

--Test queries
  
  --Check if the person who passed the card is allowed to pass to that room

  SELECT * FROM `Users`, `Rooms` 
  INNER JOIN `Rooms_cards` 
  ON Users.card_id = '1014512825' 
  WHERE Rooms_cards.card_id = Users.card_id && Rooms_cards.room_id = 'room_001'; 

  --SELECT * FROM `Users`
  --INNER JOIN `Rooms_cards`
  --ON Users.card_id = <id tarjera recibido>
  --WHERE Rooms_cards.card_id = Users.card_id && Rooms_cards.room_id = <id_room recibido>

  */
