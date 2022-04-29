-- Vorp Core Lua Update
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'user',
  `money` double(11, 2) NULL DEFAULT 0,
  `gold` double(11, 2) NULL DEFAULT 0,
  `rol` double(11, 2) NOT NULL DEFAULT 0,
  `xp` int(11) NULL DEFAULT 0,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'unemployed',
  `status` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `skinPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `compPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `jobgrade` int(11) NULL DEFAULT 0,
  `coords` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `isdead` tinyint(1) NULL DEFAULT 0,
  UNIQUE INDEX `identifier_charidentifier`(`identifier`, `charidentifier`) USING BTREE,
  INDEX `charidentifier`(`charidentifier`) USING BTREE,
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- walkanim support
ALTER TABLE `characters` ADD COLUMN `walk` varchar(50) DEFAULT 'noanim';
-- Vorp weaponsv2 Updates
DROP TABLE IF EXISTS `loadout`;
CREATE TABLE `loadout` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL,
	`charidentifier` INT(11) NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`ammo` VARCHAR(255) NOT NULL DEFAULT '{}',
	`components` VARCHAR(255) NOT NULL DEFAULT '[]',
	`dirtlevel` DOUBLE NULL DEFAULT 0,
	`mudlevel` DOUBLE NULL DEFAULT 0,
	`conditionlevel` DOUBLE NULL DEFAULT 0,
	`rustlevel` DOUBLE NULL DEFAULT 0,
	`used` TINYINT(4) NULL DEFAULT 0,
  `dropped` INT(11) NOT NULL DEFAULT 0,
  `comps` LONGTEXT NOT NULL, 
  `used2` tinyint(4) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	INDEX `id` (`id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
	`item` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`limit` INT(11) NOT NULL DEFAULT 1,
	`can_remove` TINYINT(1) NOT NULL DEFAULT 1,
	`type` VARCHAR(50) NULL DEFAULT NULL,
	`usable` TINYINT(1) NULL DEFAULT NULL,
	PRIMARY KEY (`item`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for outfits
-- ----------------------------
DROP TABLE IF EXISTS `outfits`;
CREATE TABLE `outfits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stables
-- ----------------------------
DROP TABLE IF EXISTS `stables`;
CREATE TABLE `stables`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modelname` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `xp` int(11) NULL DEFAULT 0,
  `injured` int(11) NULL DEFAULT 0,
  `gear` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `horse_complements`;
CREATE TABLE `horse_complements`  (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `complements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;


SET FOREIGN_KEY_CHECKS = 1;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `banneds` (
  `b_id` int(11) NOT NULL,
  `b_steam` varchar(100) NOT NULL,
  `b_license` varchar(255) DEFAULT NULL,
  `b_discord` varchar(100) DEFAULT NULL,
  `b_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `b_banned` varchar(100) NOT NULL,
  `b_unban` varchar(100) NOT NULL,
  `b_permanent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


ALTER TABLE `banneds`
  ADD PRIMARY KEY (`b_id`) USING BTREE;


ALTER TABLE `banneds`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for housing
-- ----------------------------
DROP TABLE IF EXISTS `housing`;
CREATE TABLE `housing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `charidentifier` int(11) NOT NULL,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `furniture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `open` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interiorId` int(11) NOT NULL,
  `inventory` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `identifier` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- Job Manager Table
CREATE TABLE `jobmanager` (
  `identifier` varchar(50) NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `jobname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `jobmanager`
  ADD PRIMARY KEY (`identifier`,`charidentifier`);
COMMIT;

-- Insert data for items
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES
	('acid', 'Acid', 10, 1, 'item_standard', 1),
	('Agarita', 'Agarita', 10, 1, 'item_standard', 1),
	('Agarita_Seed', 'Agarita Seed', 10, 1, 'item_standard', 1),
	('Alaskan_Ginseng', 'Alaskan Ginseng', 10, 1, 'item_standard', 1),
	('Alaskan_Ginseng_Seed', 'Alaskan Ginseng Seed', 10, 1, 'item_standard', 1),
	('alcohol', 'Alcohol', 10, 1, 'item_standard', 1),
	('American_Ginseng', 'American Ginseng', 10, 1, 'item_standard', 1),
	('American_Ginseng_Seed', 'American Ginseng Seed', 10, 1, 'item_standard', 1),
	('ammoarrmownormal', 'Arrow Normal', 10, 1, 'item_standard', 1),
	('ammoarrowdynamite', 'Arrow Dynamite', 10, 1, 'item_standard', 1),
	('ammoarrowfire', 'Arrow Fire', 10, 1, 'item_standard', 1),
	('ammoarrowimproved', 'Arrow Improved', 10, 1, 'item_standard', 1),
	('ammoarrowpoison', 'Arrow Poison', 10, 1, 'item_standard', 1),
	('ammoarrowsmallgame', 'Arrow Small Game', 10, 1, 'item_standard', 1),
	('ammobolahawk', 'Bola Ammo Hawk', 10, 1, 'item_standard', 1),
	('ammobolainterwired', 'Bola Ammo Interwired', 10, 1, 'item_standard', 1),
	('ammobolaironspiked', 'Bola Ammo Ironspiked', 10, 1, 'item_standard', 1),
	('ammobolla', 'Bolla Ammo', 10, 1, 'item_standard', 1),
	('ammodynamite', 'Dynamite Ammo', 10, 1, 'item_standard', 1),
	('ammoelephant', 'Elephant Rifle Ammo', 10, 1, 'item_standard', 1),
	('ammoknives', 'Knives Ammo', 10, 1, 'item_standard', 1),
	('ammomolotov', 'Molotov Ammo', 10, 1, 'item_standard', 1),
	('ammopistolexplosive', 'Pistol Ammo Explosive', 10, 1, 'item_standard', 1),
	('ammopistolexpress', 'Pistol Ammo Express', 10, 1, 'item_standard', 1),
	('ammopistolnormal', 'Pistol Ammo Normal', 10, 1, 'item_standard', 1),
	('ammopistolsplitpoint', 'Pistol Ammo Splitpoint', 10, 1, 'item_standard', 1),
	('ammopistolvelocity', 'Pistol Ammo Velocity', 10, 1, 'item_standard', 1),
	('ammopoisonbottle', 'Poison Bottle Ammo', 10, 1, 'item_standard', 1),
	('ammorepeaterexplosive', 'Repeater Ammo Explosive', 10, 1, 'item_standard', 1),
	('ammorepeaterexpress', 'Repeater Ammo Express', 10, 1, 'item_standard', 1),
	('ammorepeaternormal', 'Repeater Ammo Normal', 10, 1, 'item_standard', 1),
	('ammorepeatersplitpoint', 'Repeater Ammo Splitpoint', 10, 1, 'item_standard', 1),
	('ammorepeatervelocity', 'Repeater Ammo Velocity', 10, 1, 'item_standard', 1),
	('ammorevolverexplosive', 'Revolver Ammo Explosive', 10, 1, 'item_standard', 1),
	('ammorevolverexpress', 'Revolver Ammo Express', 10, 1, 'item_standard', 1),
	('ammorevolvernormal', 'Revolver Ammo Normal', 10, 1, 'item_standard', 1),
	('ammorevolversplitpoint', 'Revolver Ammo Splitpoint', 10, 1, 'item_standard', 1),
	('ammorevolvervelocity', 'Revolver Ammo Velocity', 10, 1, 'item_standard', 1),
	('ammorifleexplosive', 'Rifle Ammo Explosive', 10, 1, 'item_standard', 1),
	('ammorifleexpress', 'Rifle Ammo Express', 10, 1, 'item_standard', 1),
	('ammoriflenormal', 'Rifle Ammo Normal', 10, 1, 'item_standard', 1),
	('ammoriflesplitpoint', 'Rifle Ammo Splitpoint', 10, 1, 'item_standard', 1),
	('ammoriflevelocity', 'Rifle Ammo Velocity', 10, 1, 'item_standard', 1),
	('ammoshotgunexplosive', 'Shotgun Ammo Explosive', 10, 1, 'item_standard', 1),
	('ammoshotgunincendiary', 'Shotgun Ammo Incendiary', 10, 1, 'item_standard', 1),
	('ammoshotgunnormal', 'Shotgun Ammo Normal', 10, 1, 'item_standard', 1),
	('ammoshotgunslug', 'Shotgun Ammo Slug', 10, 1, 'item_standard', 1),
	('ammotomahawk', 'Tonmahawk Ammo', 10, 1, 'item_standard', 1),
	('ammovarmint', 'Varmint Ammo', 10, 1, 'item_standard', 1),
	('ammovarminttranq', 'Varmint Tranquilizer Ammo', 10, 1, 'item_standard', 1),
	('ammovoldynamite', 'Volatile Dynamite Ammo', 10, 1, 'item_standard', 1),
	('ammovolmolotov', 'Volatile Molotov Ammo', 10, 1, 'item_standard', 1),
	('antipoison', 'Antipoison', 20, 1, 'item_standard', 1),
	('apple', 'Apple', 20, 1, 'item_standard', 1),
	('appleCrumbMash', 'Minty Berry Mash', 10, 1, 'item_standard', 1),
	('appleCrumbMoonshine', 'Minty Berry Moonshine', 10, 1, 'item_standard', 1),
	('a_c_fishbluegil_01_ms', 'Medium Bluegil', 10, 1, 'item_standard', 0),
	('a_c_fishbluegil_01_sm', 'Small Bluegil', 5, 1, 'item_standard', 0),
	('a_c_fishbullheadcat_01_ms', 'Medium Bullhead', 10, 1, 'item_standard', 0),
	('a_c_fishbullheadcat_01_sm', 'Small Bullhead', 5, 1, 'item_standard', 0),
	('a_c_fishchainpickerel_01_ms', 'Medium Pickerel', 10, 1, 'item_standard', 0),
	('a_c_fishchainpickerel_01_sm', 'Small Pickerel', 5, 1, 'item_standard', 0),
	('a_c_fishlargemouthbass_01_ms', 'Lardgemouth Bass', 10, 1, 'item_standard', 0),
	('a_c_fishperch_01_ms', 'Medium Perch', 10, 1, 'item_standard', 0),
	('a_c_fishperch_01_sm', 'Small Perch', 5, 1, 'item_standard', 0),
	('a_c_fishrainbowtrout_01_ms', 'Rainbow Trout', 10, 1, 'item_standard', 0),
	('a_c_fishredfinpickerel_01_ms', 'Medium Redfin Pickerel', 10, 1, 'item_standard', 0),
	('a_c_fishredfinpickerel_01_sm', 'Small Redfin Pickerel', 5, 1, 'item_standard', 0),
	('a_c_fishrockbass_01_ms', 'Medium Rockbass', 10, 1, 'item_standard', 0),
	('a_c_fishrockbass_01_sm', 'Small Rockbass', 5, 1, 'item_standard', 0),
	('a_c_fishsalmonsockeye_01_ms', 'Sockeye Salmon', 10, 1, 'item_standard', 0),
	('a_c_fishsmallmouthbass_01_ms', 'Smallmouth Bass', 10, 1, 'item_standard', 0),
	('bait', 'Bait', 20, 1, 'item_standard', 1),
	('banana', 'Banana', 20, 1, 'item_standard', 1),
	('bandage', 'Bandage', 20, 1, 'item_standard', 1),
	('Bay_Bolete', 'Bay Bolete', 10, 1, 'item_standard', 1),
	('Bay_Bolete_Seed', 'Bay Bolete Seed', 10, 1, 'item_standard', 1),
	('beefjerky', 'Beef Jerky', 20, 1, 'item_standard', 1),
	('beer', 'Beer', 10, 1, 'item_standard', 1),
	('Big_Leather', 'Big Leather', 10, 1, 'item_standard', 1),
	('Bitter_Weed', 'Bitter Weed', 10, 1, 'item_standard', 1),
	('Bitter_Weed_Seed', 'Bitter Weed Seed', 10, 1, 'item_standard', 1),
	('blackberryale', 'Black Berry Ale', 10, 1, 'item_standard', 1),
	('Black_Berry', 'Black Berry', 10, 1, 'item_standard', 1),
	('Black_Berry_Seed', 'Black Berry Seed', 10, 1, 'item_standard', 1),
	('Black_Currant', 'Black Currant', 10, 1, 'item_standard', 1),
	('Black_Currant_Seed', 'Black Currant Seed', 10, 1, 'item_standard', 1),
	('Blood_Flower', 'Blood Flower', 10, 1, 'item_standard', 1),
	('Blood_Flower_Seed', 'Blood Flower Seed', 10, 1, 'item_standard', 1),
	('blueberry', 'Blueberry', 10, 1, 'item_standard', 1),
	('boiledegg', 'Boiled Egg', 10, 1, 'item_standard', 1),
	('book', 'Book', 5, 1, 'item_standard', 1),
	('bountylicns', 'Bounty Hunter License', 10, 1, 'item_standard', 1),
	('Bulrush', 'Bulrush', 10, 1, 'item_standard', 1),
	('Bulrush_Seed', 'Bulrush Seed', 10, 1, 'item_standard', 1),
	('Burdock_Root', 'Burdock Root', 10, 1, 'item_standard', 1),
	('Burdock_Root_Seed', 'Burdock Root Seed', 10, 1, 'item_standard', 1),
	('campfire', 'Campfire', 5, 1, 'item_standard', 1),
	('Cardinal_Flower', 'Cardinal Flower', 10, 1, 'item_standard', 1),
	('Cardinal_Flower_Seed', 'Cardinal Flower Seed', 10, 1, 'item_standard', 1),
	('carrots', 'Carrot', 10, 1, 'item_standard', 1),
	('Chanterelles', 'Chanterelles', 10, 1, 'item_standard', 1),
	('Chanterelles_Seed', 'Chanterelles Seed', 10, 1, 'item_standard', 1),
	('char', 'Char', 10, 1, 'item_standard', 0),
	('chewingtobacco', 'Chewing Tobacco', 20, 1, 'item_standard', 1),
	('Choc_Daisy', 'Choc Daisy', 10, 1, 'item_standard', 1),
	('Choc_Daisy_Seed', 'Choc Daisy Seed', 10, 1, 'item_standard', 1),
	('cigar', 'Cigar', 20, 1, 'item_standard', 1),
	('cigarette', 'Cigarette', 20, 1, 'item_standard', 1),
	('cigarettefilter', 'Cig Filter', 20, 1, 'item_standard', 1),
	('clay', 'Clay', 20, 1, 'item_standard', 1),
	('coal', 'Coal', 20, 1, 'item_standard', 1),
	('cocoa', 'Cocoa', 20, 1, 'item_standard', 1),
	('consumable_bluegil', 'Dried Bluegil', 10, 1, 'item_standard', 1),
	('consumable_breakfast', 'Breakfast', 5, 1, 'item_standard', 1),
	('consumable_caramel', 'Caramel', 5, 1, 'item_standard', 1),
	('consumable_chocolate', 'Chocolate Bar', 10, 1, 'item_standard', 1),
	('consumable_coffee', 'Coffee', 5, 1, 'item_standard', 1),
	('consumable_fruitsalad', 'Fruit Salad', 5, 1, 'item_standard', 1),
	('consumable_game', 'Jerkied GameMeat', 10, 1, 'item_standard', 1),
	('consumable_haycube', 'Haycube', 10, 1, 'item_standard', 1),
	('consumable_herb_chanterelles', 'Chanterelles', 10, 1, 'item_standard', 1),
	('consumable_herb_evergreen_huckleberry', 'Evergreen Huckleberry', 10, 1, 'item_standard', 1),
	('consumable_herb_oregano', 'Oregano', 10, 1, 'item_standard', 1),
	('consumable_herb_vanilla_flower', 'Vanilla Flower', 10, 1, 'item_standard', 1),
	('consumable_herb_wintergreen_berry', 'Wintergreen Berry', 10, 1, 'item_standard', 1),
	('consumable_kidneybeans_can', 'Kidney Beans', 5, 1, 'item_standard', 1),
	('consumable_lock_breaker', 'Lock Breaker', 10, 1, 'item_standard', 1),
	('consumable_meat_greavy', 'Meat Stew', 12, 1, 'item_standard', 1),
	('consumable_medicine', 'Medicine', 10, 1, 'item_standard', 1),
	('consumable_peach', 'Peach', 5, 1, 'item_standard', 1),
	('consumable_pear', 'Pear', 10, 1, 'item_standard', 1),
	('consumable_raspberrywater', 'Berry Water', 10, 1, 'item_standard', 1),
	('consumable_salmon', 'Dried Salmon', 10, 1, 'item_standard', 1),
	('consumable_salmon_can', 'Salmon Can', 10, 1, 'item_standard', 1),
	('consumable_trout', 'Cooked Trout', 10, 1, 'item_standard', 1),
	('consumable_veggies', 'Edible Veggies', 5, 1, 'item_standard', 1),
	('cookedbluegil', 'Cooked Bluegil with Veggies', 5, 1, 'item_standard', 1),
	('copper', 'Copper', 30, 1, 'item_standard', 1),
	('corn', 'Corn', 10, 1, 'item_standard', 1),
	('cornseed', 'Corn seed', 10, 1, 'item_standard', 1),
	('Creeking_Thyme', 'Creeping Thyme', 10, 1, 'item_standard', 1),
	('Creeking_Thyme_Seed', 'Creeping Thyme Seed', 10, 1, 'item_standard', 1),
	('Creekplum', 'Creekplum', 10, 1, 'item_standard', 1),
	('Creekplum_Seed', 'Creekplum Seed', 10, 1, 'item_standard', 1),
	('Crows_Garlic', 'Crows Garlic', 10, 1, 'item_standard', 1),
	('Crows_Garlic_Seed', 'Crows Garlic Seed', 10, 1, 'item_standard', 1),
	('Desert_Sage', 'Desert Sage', 10, 1, 'item_standard', 1),
	('Desert_Sage_Seed', 'Desert Sage Seed', 10, 1, 'item_standard', 1),
	('diamond', 'Diamond', 20, 1, 'item_standard', 1),
	('Drink_For_Dog', 'Pet Water', 10, 1, 'item_standard', 1),
	('Duck_Egg', 'Duck Egg', 10, 1, 'item_standard', 1),
	('dynamite', 'Pipe charge dynamite', 30, 1, 'item_standard', 1),
	('eggs', 'Egg', 50, 1, 'item_standard', 1),
	('emerald', 'Emerald', 20, 1, 'item_standard', 1),
	('English_Mace', 'English Mace', 10, 1, 'item_standard', 1),
	('English_Mace_Seed', 'English Mace Seed', 10, 1, 'item_standard', 1),
	('Evergreen_Huckleberry', 'Evergreen Huckleberry', 10, 1, 'item_standard', 1),
	('Evergreen_Huckleberry_Seed', 'Evergreen Huckleberry Seed', 10, 1, 'item_standard', 1),
	('fan', 'Fan', 5, 1, 'item_standard', 1),
	('Fat', 'Animal Fat', 10, 1, 'item_standard', 1),
	('Feather', 'Feather', 20, 1, 'item_standard', 1),
	('Feed_For_Dog', 'Dog Food', 10, 1, 'item_standard', 1),
	('fibers', 'Fibers', 20, 1, 'item_standard', 0),
	('fish', 'Fish', 50, 1, 'item_standard', 1),
	('fishbait', 'Fishbait', 10, 1, 'item_standard', 1),
	('fishchips', 'Fish and Chips', 10, 1, 'item_standard', 1),
	('flag', 'Camp Flag', 10, 1, 'item_standard', 1),
	('friedtater', 'Fried Taters', 10, 1, 'item_standard', 1),
	('Gamey_Meat', 'Gamey Meat', 10, 1, 'item_standard', 1),
	('Gator_Egg_3', 'Aligator Egg 3', 10, 1, 'item_standard', 1),
	('Gator_Egg_4', 'Aligator Egg 4', 10, 1, 'item_standard', 1),
	('Gator_Egg_5', 'Aligator Egg 5', 10, 1, 'item_standard', 1),
	('ginsengtea', 'Ginseng Tea', 10, 1, 'item_standard', 1),
	('glassbottle', 'Glass Bottle', 15, 1, 'item_standard', 1),
	('goldbar', 'GoldBar', 5, 1, 'item_standard', 1),
	('Golden_Currant', 'Golden Currant', 10, 1, 'item_standard', 1),
	('Golden_Currant_Seed', 'Golden Currant Seed', 10, 1, 'item_standard', 1),
	('goldfish', 'Gold Fish', 10, 1, 'item_standard', 0),
	('goldnugget', 'Gold nugget', 30, 1, 'item_standard', 0),
	('goldpan', 'Gold pan', 10, 1, 'item_standard', 1),
	('goldring', 'Gold Ring', 10, 1, 'item_standard', 1),
	('Goose_Egg_4', 'Goose Egg', 10, 1, 'item_standard', 1),
	('hairpomade', 'Hair Pomade', 10, 1, 'item_standard', 1),
	('handcuffs', 'Handcuffs', 10, 1, 'item_standard', 1),
	('hatchet', 'Hatchet', 1, 1, 'item_standard', 1),
	('Health_For_Dog', 'Pet Bandages', 10, 1, 'item_standard', 1),
	('hemp', 'Hemp', 10, 1, 'item_standard', 1),
	('hemp_cig', 'Hemp Cigarette', 1, 1, 'item_standard', 1),
	('herbmed', 'Herbal Remedy', 10, 1, 'item_standard', 1),
	('heroin', 'Heroin', 5, 1, 'item_standard', 1),
	('honey', 'Honey', 10, 1, 'item_standard', 1),
	('horsebrush', 'Horse Brush', 5, 1, 'item_standard', 1),
	('Hummingbird_Sage', 'Hummingbird Sage', 10, 1, 'item_standard', 1),
	('Hummingbird_Sage_Seed', 'Hummingbird Sage Seed', 10, 1, 'item_standard', 1),
	('hwood', 'Hard Wood', 20, 1, 'item_standard', 0),
	('Indian_Tobbaco', 'Indian Tobbaco', 20, 1, 'item_standard', 1),
	('Indian_Tobbaco_Seed', 'Indian Tobbaco Seed', 10, 1, 'item_standard', 1),
	('iron', 'Iron Ore', 30, 1, 'item_standard', 1),
	('ironbar', 'Iron Bar', 30, 1, 'item_standard', 1),
	('ironextract', 'Iron Extract', 1, 1, 'item_standard', 0),
	('ironhammer', 'Iron Hammer', 5, 1, 'item_standard', 1),
	('kit_bandana', 'Bandana', 2, 1, 'item_standard', 1),
	('leather', 'Leather', 50, 1, 'item_standard', 1),
	('lockpick', 'Lockpick', 5, 1, 'item_standard', 1),
	('lockpickmold', 'Lockpick Mold', 5, 1, 'item_standard', 1),
	('mackerel', 'Mackerel', 10, 1, 'item_standard', 0),
	('meat', 'Meat', 20, 1, 'item_standard', 1),
	('milk', 'Milk', 50, 1, 'item_standard', 1),
	('Milk_Weed', 'Milk Weed', 10, 1, 'item_standard', 1),
	('Milk_Weed_Seed', 'Milk Weed Seed', 10, 1, 'item_standard', 1),
	('moonshine', 'Moonshine', 10, 1, 'item_standard', 1),
	('morpcert', 'Morphine Perscription', 10, 1, 'item_standard', 1),
	('morphine', 'Morphine', 10, 1, 'item_standard', 1),
	('mp001_p_mp_still02x', 'Brennerei', 1, 1, 'item_standard', 1),
	('Mutton', 'Mutton', 20, 1, 'item_standard', 1),
	('nails', 'Nails', 40, 1, 'item_standard', 1),
	('newspaper', 'NewsPaper', 20, 1, 'item_standard', 1),
	('nitrite', 'Nitrite', 20, 1, 'item_standard', 1),
	('nitroglyserolia', 'Nitroglycerol', 30, 1, 'item_standard', 1),
	('notebook', 'Notebook', 5, 1, 'item_standard', 1),
	('Oleander_Sage', 'Oleander Sage', 10, 1, 'item_standard', 1),
	('Oleander_Sage_Seed', 'Oleander Sage Seed', 10, 1, 'item_standard', 1),
	('orden_presidente', 'Order of the President', 10, 1, 'item_standard', 0),
	('Oregano', 'Oregano', 10, 1, 'item_standard', 1),
	('Oregano_Seed', 'Oregano Seed', 10, 1, 'item_standard', 1),
	('paper', 'Paper', 20, 1, 'item_standard', 1),
	('Parasol_Mushroom', 'Parasol Mushroom', 10, 1, 'item_standard', 1),
	('Parasol_Mushroom_Seed', 'Parasol Mushroom Seed', 10, 1, 'item_standard', 1),
	('pickaxe', 'Pickaxe', 1, 1, 'item_standard', 0),
	('pipe', 'Pipe', 5, 1, 'item_standard', 1),
	('pocket_watch', 'Pocket Watch', 5, 1, 'item_standard', 1),
	('potato', 'Potato', 20, 1, 'item_standard', 1),
	('Prairie_Poppy', 'Prairie Poppy', 10, 1, 'item_standard', 1),
	('Prairie_Poppy_Seed', 'Prairie Poppy Seed', 10, 1, 'item_standard', 1),
	('provision_jail_keys', 'Jail Keys', 10, 1, 'item_standard', 1),
	('pulp', 'Pulp', 20, 1, 'item_standard', 0),
	('p_barrelmoonshine', 'Barrel', 1, 1, 'item_standard', 1),
	('quartz', 'Quartz', 20, 1, 'item_standard', 1),
	('rajahdysoljy', 'Explosive Oil', 30, 1, 'item_standard', 1),
	('Rams_Head', 'Rams Head', 10, 1, 'item_standard', 1),
	('Rams_Head_Seed', 'Rams Head Seed', 10, 1, 'item_standard', 1),
	('raspberryale', 'Raspberry Ale', 10, 1, 'item_standard', 1),
	('Red_Raspberry', 'Red Raspberry', 10, 1, 'item_standard', 1),
	('Red_Raspberry_Seed', 'Red Raspberry Seed', 10, 1, 'item_standard', 1),
	('Red_Sage', 'Red Sage', 10, 1, 'item_standard', 1),
	('Red_Sage_Seed', 'Red Sage Seed', 10, 1, 'item_standard', 1),
	('repeaterbarrel', 'Repeater Barrel', 5, 1, 'item_standard', 1),
	('repeatermold', 'Repeater Mold', 5, 1, 'item_standard', 1),
	('repeaterreceiver', 'Repeater Receiver', 5, 1, 'item_standard', 1),
	('repeaterrecmold', 'Repeater Receiver Mold', 5, 1, 'item_standard', 1),
	('repeaterstock', 'Repeater Stock', 5, 1, 'item_standard', 1),
	('revolverbarrel', 'Revolver Barrel', 5, 1, 'item_standard', 1),
	('revolvercylinder', 'Revolver Cylinder', 5, 1, 'item_standard', 1),
	('revolverhandle', 'Revolver Handle', 5, 1, 'item_standard', 1),
	('revolvermold', 'Revolver Mold', 5, 1, 'item_standard', 1),
	('riflebarrel', 'Rifle Barrel', 5, 1, 'item_standard', 1),
	('riflemold', 'Rifle Mold', 5, 1, 'item_standard', 1),
	('riflereceiver', 'Rifle Receiver', 5, 1, 'item_standard', 1),
	('riflerecmold', 'Rifle Receiver Mold', 5, 1, 'item_standard', 1),
	('riflestock', 'Rifle Stock', 5, 1, 'item_standard', 1),
	('roach', 'Roach', 10, 1, 'item_standard', 0),
	('rock', 'Rock', 30, 1, 'item_standard', 0),
	('rollingpaper', 'Rolling paper', 30, 1, 'item_standard', 1),
	('rubber', 'Rubber', 20, 1, 'item_standard', 0),
	('salamelle', 'Fresh Pork ', 20, 1, 'item_standard', 1),
	('salmon', 'Salmon', 10, 1, 'item_standard', 0),
	('salt', 'Salt', 20, 1, 'item_standard', 1),
	('Saltbush', 'Saltbush', 10, 1, 'item_standard', 1),
	('Saltbush_Seed', 'Saltbush Seed', 10, 1, 'item_standard', 1),
	('sap', 'Sap', 20, 1, 'item_standard', 0),
	('sarsaparilla', 'Sarsaparilla', 10, 1, 'item_standard', 1),
	('scale', 'Scale', 5, 1, 'item_standard', 1),
	('secondchance', 'Second Chance', 10, 1, 'item_standard', 1),
	('shellcasing', 'Shell Casing', 40, 1, 'item_standard', 1),
	('shotgunbarrel', 'Shotgun Barrel', 5, 1, 'item_standard', 1),
	('shotgunmold', 'Shotgun Mold', 5, 1, 'item_standard', 1),
	('shotgunstock', 'Shotgun Stock', 5, 1, 'item_standard', 1),
	('shrimps', 'Shrimp Stew', 1, 1, 'item_standard', 1),
	('Small_Leather', 'Small Leather', 10, 1, 'item_standard', 1),
	('SnakeSkin', 'Snake Skin', 20, 1, 'item_standard', 1),
	('Snake_Poison', 'Snake Poison', 10, 1, 'item_standard', 1),
	('soborno', 'Soborno Alcohol', 15, 1, 'item_standard', 0),
	('steak', 'Steak', 10, 1, 'item_standard', 1),
	('steakveg', 'Steak with Veggies', 10, 1, 'item_standard', 1),
	('stim', 'Horse Stimulant', 2, 1, 'item_standard', 1),
	('stolenmerch', 'Stolen Items', 10, 1, 'item_standard', 0),
	('stonehammer', 'Stone Hammer', 5, 1, 'item_standard', 1),
	('sugar', 'Sugar', 20, 1, 'item_standard', 0),
	('sugarcaneseed', 'Surgarcane seed', 10, 1, 'item_standard', 1),
	('sulfur', 'Sulfur', 30, 1, 'item_standard', 0),
	('syn', 'Syn', 50, 1, 'item_standard', 1),
	('synpackage', 'Syn Package', 10, 1, 'item_standard', 1),
	('syringe', 'Syringe', 20, 1, 'item_standard', 1),
	('syringecert', 'Syringe Cert', 10, 1, 'item_standard', 0),
	('tent', 'Tent', 1, 1, 'item_standard', 1),
	('tequila', 'Tequila', 10, 1, 'item_standard', 1),
	('Texas_Bonnet', 'Texas Bonnet', 10, 1, 'item_standard', 1),
	('Texas_Bonnet_Seed', 'Texas Bonnet Seed', 10, 1, 'item_standard', 1),
	('token', 'Camp License', 5, 1, 'item_standard', 1),
	('trainkey', 'Train Key', 1, 1, 'item_standard', 1),
	('tropicalPunchMash', 'Ginseng Mash', 10, 1, 'item_standard', 0),
	('tropicalPunchMoonshine', 'Ginseng Moonshine', 10, 1, 'item_standard', 0),
	('trout', 'Trout', 10, 1, 'item_standard', 0),
	('TurtleShell', 'Turtle Shell', 20, 1, 'item_standard', 1),
	('tylenol', 'Tylenol', 10, 1, 'item_standard', 1),
	('vanillaFlower', 'Vanille Flower', 20, 1, 'item_standard', 0),
	('Violet_Snowdrop', 'Violet Snowdrop', 10, 1, 'item_standard', 1),
	('Violet_Snowdrop_Seed', 'Violet Snowdrop Seed', 10, 1, 'item_standard', 1),
	('vodka', 'Vodka', 10, 1, 'item_standard', 1),
	('Volture_Egg', 'Volture Egg', 10, 1, 'item_standard', 1),
	('water', 'Water', 15, 1, 'item_standard', 1),
	('wateringcan', 'Water Jug', 10, 1, 'item_standard', 1),
	('wateringcan_dirtywater', 'Dirty Watering Jug', 10, 1, 'item_standard', 1),
	('wateringcan_empty', 'Empty Watering Jug', 10, 1, 'item_standard', 1),
	('whisky', 'Whisky', 10, 1, 'item_standard', 1),
	('wildCiderMash', 'Black Berry Mash', 10, 1, 'item_standard', 0),
	('wildCiderMoonshine', 'Black Berry Moonshine', 10, 1, 'item_standard', 0),
	('Wild_Carrot', 'Wild Carrot', 10, 1, 'item_standard', 1),
	('Wild_Carrot_Seed', 'Wild Carrot Seed', 10, 1, 'item_standard', 1),
	('Wild_Feverfew', 'Wild Feverfew', 10, 1, 'item_standard', 1),
	('Wild_Feverfew_Seed', 'Wild Feverfew Seed', 10, 1, 'item_standard', 1),
	('Wild_Mint', 'Wild Mint', 10, 1, 'item_standard', 1),
	('Wild_Mint_Seed', 'Wild Mint Seed', 10, 1, 'item_standard', 1),
	('Wild_Rhubarb', 'Wild Rhubarb', 10, 1, 'item_standard', 1),
	('Wild_Rhubarb_Seed', 'Wild Rhubarb Seed', 10, 1, 'item_standard', 1),
	('wine', 'Wine', 10, 1, 'item_standard', 1),
	('Wintergreen_Berry', 'Wintergreen Berry', 10, 1, 'item_standard', 1),
	('Wintergreen_Berry_Seed', 'Wintergreen Berry Seed', 10, 1, 'item_standard', 1),
	('Wisteria', 'Wisteria', 10, 1, 'item_standard', 1),
	('Wisteria_Seed', 'Wisteria Seed', 10, 1, 'item_standard', 1),
	('wojape', 'Wojape', 5, 1, 'item_standard', 1),
	('wood', 'Soft Wood', 20, 1, 'item_standard', 0),
	('wooden_boards', 'Wooden Boards', 25, 1, 'item_standard', 0),
	('wool', 'Wool', 50, 1, 'item_standard', 1),
	('Yarrow', 'Yarrow', 10, 1, 'item_standard', 1),
	('Yarrow_Seed', 'Yarrow Seed', 10, 1, 'item_standard', 1),
  ('p_crd_chipblue01x', 'chips', 1000, 1, 'item_standard', 0),
  ('p_crd_chipred01x', 'chips 2', 1000, 1, 'item_standard', 0),
  ('medicalcert', 'medicalcert', 10, 1, 'item_standard', 0);

-- Vorp Fishing - items
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_baitBread01x', 'Bread Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_baitCorn01x', 'Corn Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_baitCheese01x', 'Cheese Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_baitWorm01x', 'Worm Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_baitCricket01x', 'Cricket Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_crawdad01x', 'Crawfish Bait', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_finishedragonfly01x', 'Dragonfly Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_FinisdFishlure01x', 'Fish Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_finishdcrawd01x', 'Crawfish Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_finishedragonflylegendary01x', 'Legendary Dragonfly Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_finisdfishlurelegendary01x', 'Legendary Fish Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_finishdcrawdlegendary01x', 'Legendary Crawfish Lure', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_lgoc_spinner_v4', 'Spinner V4', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('p_lgoc_spinner_v6', 'Spinner V6', 10, 1, 'item_standard', 1);
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('feathers', 'feathers', 10, 1, 'item_standard', 1); 
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pelt', 'pelt', 10, 1, 'item_standard', 0); 
