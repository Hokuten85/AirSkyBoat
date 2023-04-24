SET NAMES 'utf8';

DELIMITER $$

DROP TRIGGER IF EXISTS char_insert_custom $$
CREATE TRIGGER char_insert_custom
	BEFORE INSERT ON chars
	FOR EACH ROW
BEGIN
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 48, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 49, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 50, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 51, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 52, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 53, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 54, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 55, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 56, 1000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 57, 1000, 15);
END $$
