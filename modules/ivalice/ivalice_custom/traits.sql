-- Remove all content_tags
UPDATE traits SET content_tag = null;

-- MOD_CRIT_DMG_INCREASE
INSERT INTO traits VALUES ('150','critrate bonus','6','10','1','165','2',null,0); -- THF
INSERT INTO traits VALUES ('150','critrate bonus','6','25','2','165','4',null,0); -- THF
INSERT INTO traits VALUES ('150','critrate bonus','6','40','3','165','6',null,0); -- THF
INSERT INTO traits VALUES ('150','critrate bonus','6','60','4','165','8',null,0); -- THF
INSERT INTO traits VALUES ('150','critrate bonus','6','75','5','165','10',null,0); -- THF

-- PLD Adjust th enmit cap
INSERT INTO traits VALUES ('151','enmity cap','7','25','1','2000','1000',null,0); -- PLD
INSERT INTO traits VALUES ('151','enmity cap','7','50','2','2000','3000',null,0);
INSERT INTO traits VALUES ('151','enmity cap','7','75','3','2000','5000',null,0);
INSERT INTO traits VALUES ('151','enmity cap','7','99','4','2000','7000',null,0);

-- -DT% II
INSERT INTO traits VALUES ('153','damage taken II','7','10','1','2001','2',null,0);
INSERT INTO traits VALUES ('153','damage taken II','7','25','2','2001','4',null,0);
INSERT INTO traits VALUES ('153','damage taken II','7','40','3','2001','6',null,0);
INSERT INTO traits VALUES ('153','damage taken II','7','60','4','2001','8',null,0);
INSERT INTO traits VALUES ('153','damage taken II','7','75','5','2001','10',null,0);
-- GIVE PLD CRIT ATT DEF
UPDATE traits SET level = 50 WHERE traitid = 99 and job = 7 and rank = 1;
-- GIVE PLD FENCER
INSERT INTO traits VALUES (107, 'fencer', 7, 50, 1, 903, 200, NULL, 0);
INSERT INTO traits VALUES (107, 'fencer', 7, 50, 1, 904, 2, NULL, 0);

-- GIVE THF TA AT 30
INSERT INTO traits VALUES (16, 'triple attack', 6, 30, 1, 302, 3, NULL, 0);
UPDATE traits SET rank = 2 WHERE traitid = 16 and job = 6 and level = 55;
UPDATE traits SET level = 75, rank = 3 WHERE traitid = 16 and job = 6 and level = 95;
-- GIVE THF DUAL WIELD AT 60
UPDATE traits SET level = 60 WHERE traitid = 18 and job = 6 and rank = 1;
-- GIVE THF CRIT ATT BONUS
UPDATE traits SET level = 50 WHERE traitid = 98 and job = 6 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 98 and job = 6 and rank = 2;

-- GIVE SAM SKILLCHAIN BONUS EARLY
UPDATE traits SET level = 25 WHERE traitid = 106 AND job = 12 AND level = 78 AND rank = 1 AND modifier = 174;
UPDATE traits SET level = 50 WHERE traitid = 106 AND job = 12 AND level = 88 AND rank = 2 AND modifier = 174;
UPDATE traits SET level = 75 WHERE traitid = 106 AND job = 12 AND level = 98 AND rank = 3 AND modifier = 174;
-- GIVE SAM CONSERVE TP
UPDATE traits SET level = 50 WHERE traitid = 108 and job = 11 and rank = 1;

-- GIVE MONK COUNTER TIER 2
UPDATE traits SET level = 75 WHERE traitid = 17 and job = 2 and rank = 2;
UPDATE traits SET level = 75 WHERE traitid = 66 and job = 2 and rank = 3;
UPDATE traits SET level = 75 WHERE traitid = 101 and job = 2 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 127 and job = 2 and rank = 2;
-- Subtle Blow tier 5
UPDATE traits SET level = 75 WHERE traitid = 67 and job = 2 and rank = 5;

-- GIVE WHM CONSERVE MP TIER 2
UPDATE traits SET level = 75 WHERE traitid = 13 and job = 4 and rank = 2;

-- GIVE RDM FASTCAST TIER 4;
UPDATE traits SET level = 75 WHERE traitid = 12 and job = 5 and rank = 4;
-- GIVE RDM MAGIC BURST BONUS;
UPDATE traits SET level = 75 WHERE traitid = 110 and job = 5 and rank = 1;

-- GIVE DRK ATT BONUS
UPDATE traits SET level = 75 WHERE traitid = 3 and job = 8 and rank = 5;
-- GIVE DRK CRIT ATT BONUS
UPDATE traits SET level = 75 WHERE traitid = 98 and job = 8 and rank = 1;

-- GIVE BST KILLER TRAITS EARLY
UPDATE traits SET level = 10, value = 10 WHERE traitid IN (32,33,34,35,36,37,38) and job = 9 and rank = 1;
-- GIVE BST STOUT SERVANT EARLY
UPDATE traits SET level = 50 WHERE traitid = 103 and job = 9 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 103 and job = 9 and rank = 2;

-- NIN
INSERT INTO traits VALUES ('150','crit dmg bonus','13','10','1','421','2',null,0); -- NIN
INSERT INTO traits VALUES ('150','crit dmg bonus','13','25','2','421','4',null,0); -- NIN
INSERT INTO traits VALUES ('150','crit dmg bonus','13','40','3','421','6',null,0); -- NIN
INSERT INTO traits VALUES ('150','crit dmg bonus','13','60','4','421','8',null,0); -- NIN
INSERT INTO traits VALUES ('150','crit dmg bonus','13','75','5','421','10',null,0); -- NIN

INSERT INTO traits VALUES ('151','enmity cap','13','25','1','2000','1000',null,0); -- NIN
INSERT INTO traits VALUES ('151','enmity cap','13','50','2','2000','2000',null,0);
INSERT INTO traits VALUES ('151','enmity cap','13','75','3','2000','3000',null,0);
INSERT INTO traits VALUES ('151','enmity cap','13','99','4','2000','4000',null,0);

-- GIVE NIN TACTICAL PARRY
UPDATE traits SET level = 25 WHERE traitid = 100 and job = 13 and rank = 1;
-- Ranged Acc bonus to daken
INSERT INTO traits VALUES ('123','accuracy bonus','13','25','1','26','10',null,0);
INSERT INTO traits VALUES ('123','accuracy bonus','13','40','2','26','20',null,0);
INSERT INTO traits VALUES ('123','accuracy bonus','13','55','3','26','30',null,0);
INSERT INTO traits VALUES ('123','accuracy bonus','13','70','4','26','40',null,0);
INSERT INTO traits VALUES ('123','accuracy bonus','13','95','5','26','50',null,0);

-- GIVE DRG ACC BONUS
UPDATE traits SET level = 10 WHERE traitid = 1 and job = 14 and rank = 1;
UPDATE traits SET level = 30 WHERE traitid = 1 and job = 14 and rank = 2;
UPDATE traits SET level = 50 WHERE traitid = 1 and job = 14 and rank = 3;
insert INTO traits VALUES (1, 'accuracy bonus', 14, 75, 4, 25, 40, null, 0);
insert INTO traits VALUES (1, 'accuracy bonus', 14, 75, 4, 26, 40, null, 0);
-- GIVE DRG ATT BONUS
UPDATE traits SET level = 75 WHERE traitid = 3 and job = 14 and rank = 2;

-- GIVE SMN MAX MP BOOST
UPDATE traits SET level = 75 WHERE traitid = 8 and job = 15 and rank = 5;
-- GIVE SMN AUTOREFRESH
UPDATE traits SET level = 75 WHERE traitid = 10 and job = 15 and rank = 2;
-- GIVE SMN STOUT SERVANT
UPDATE traits SET level = 50 WHERE traitid = 103 and job = 15 and rank = 1;
-- GIVE SMN blood boon
UPDATE traits SET level = 75 WHERE traitid = 105 and job = 15 and rank = 3;

-- GIVE PUP STOUT SERVANT
UPDATE traits SET level = 50 WHERE traitid = 103 and job = 18 and rank = 1;

-- GIVE DNC TACTICAL PARRY
UPDATE traits SET level = 50 WHERE traitid = 100 and job = 19 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 100 and job = 19 and rank = 2;
-- GIVE DNC CONSERVE TP
UPDATE traits SET level = 75 WHERE traitid = 108 and job = 19 and rank = 1;

-- GIVE SCH Magic Burst Bonus
UPDATE traits SET level = 75 WHERE traitid = 110 and job = 20 and rank = 1;
