-- newDrops is for situations where dropid is repeated across NMs that we have special augment drops for
-- so give them their own dropids
-- then add the augment drops
DROP TABLE IF EXISTS `newDrops`;
CREATE TABLE newDrops (
	groupid int,
	zoneid int,
	oldDropId int,
	newDropId int AUTO_INCREMENT,
	PRIMARY KEY (newDropId)
);
SET @varMax = (SELECT MAX(dropid)+1 FROM mob_droplist);
SET @s = CONCAT('ALTER TABLE newDrops AUTO_INCREMENT =', @varMax);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- DETERMINE NMS THAT SHARE DROP GROUPS WITH SOMETHING ELSE
INSERT INTO newDrops (groupid, zoneid, oldDropId)
SELECT DISTINCT mg.groupid, mg.zoneid, mg.dropid
FROM mob_groups mg
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
INNER JOIN (
	SELECT dropid
    FROM mob_groups
    GROUP BY dropid
    HAVING count(1) > 1
    ) bd
    ON mg.dropid = bd.dropid
WHERE mp.mobType & 0x02
AND NOT mp.mobType & (0x10 | 0x20)
AND zs.zonetype NOT IN (4,5,6)
AND mg.dropid > 0
AND mg.minlevel DIV 10 < 10;

-- INSERT NEW DROP IDS
INSERT INTO mob_droplist
select newDropId, dropType, md.groupId, groupRate, itemId, itemRate
from mob_droplist md
INNER JOIN newDrops nd
	ON md.dropid = nd.oldDropId;

-- MOVE NMS TO NEW DROP IDS
UPDATE mob_groups mg
INNER JOIN newDrops nd
	ON mg.groupid = nd.groupid
    AND mg.zoneid = nd.zoneid
    AND mg.dropid = nd.oldDropId
SET mg.dropid = nd.newDropId;

-- INSERT CHAPTERS -- USER FOR AUGMENTING SYSTEM
INSERT INTO mob_droplist
SELECT dropid, dropType, groupid, groupRate, itemId, itemRate
FROM (
	SELECT DISTINCT mg.dropid, 0 AS dropType, 0 AS groupId, 1000 as groupRate, mg.minlevel DIV 10 AS lvlBucket,
		CASE mg.minlevel DIV 10
			WHEN 0 THEN 4064
			WHEN 1 THEN 4065
			WHEN 2 THEN 4066
			WHEN 3 THEN 4067
			WHEN 4 THEN 4068
			WHEN 5 THEN 4069
			WHEN 6 THEN 4070
			WHEN 7 THEN 4071
			WHEN 8 THEN 4072
			WHEN 9 THEN 4073
			ELSE 4064
		END AS itemId,	
		150 AS itemRate
	FROM mob_spawn_points msp
	INNER JOIN mob_groups mg
		ON msp.groupid = mg.groupid
		AND mg.zoneid = ((msp.mobid >> 12) & 0xFFF)
	INNER JOIN mob_pools mp
		ON mg.poolid = mp.poolid
	INNER JOIN zone_settings zs
		ON mg.zoneid = zs.zoneid
	WHERE mp.mobType & 0x02
	AND NOT mp.mobType & (0x10 | 0x20)
	AND zs.zonetype NOT IN (4,5,6)
	AND mg.dropid > 0
	AND mg.minlevel DIV 10 < 10
) a
ORDER BY lvlBucket;

-- INSERT CHAPTERS -- CAN BE STOLEN
INSERT INTO mob_droplist
SELECT DISTINCT mg.dropid, 2 AS dropType, 0 AS groupId, 1000 as groupRate,
	CASE mg.minlevel DIV 10
		WHEN 0 THEN 4064
        WHEN 1 THEN 4065
        WHEN 2 THEN 4066
        WHEN 3 THEN 4067
        WHEN 4 THEN 4068
        WHEN 5 THEN 4069
        WHEN 6 THEN 4070
        WHEN 7 THEN 4071
        WHEN 8 THEN 4072
        WHEN 9 THEN 4073
        WHEN 9 THEN 4073
        ELSE 4064
    END AS itemId,
    0 AS itemRate
FROM mob_spawn_points msp
INNER JOIN mob_groups mg
	ON msp.groupid = mg.groupid
	AND mg.zoneid = ((msp.mobid >> 12) & 0xFFF)
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
WHERE mp.mobType & 0x02
AND NOT mp.mobType & (0x10 | 0x20)
AND zs.zonetype NOT IN (4,5,6)
AND mg.dropid > 0
AND mg.minlevel DIV 10 < 10
ORDER BY mg.minlevel DIV 10;

UPDATE mob_droplist SET itemRate = 50 WHERE itemId = 1025 AND itemRate < 50; -- palborough_chest_key
UPDATE mob_droplist SET itemRate = 50 WHERE itemId = 13514 AND itemRate < 50; -- archers_ring

-- Coffer Keys 10% minimum
UPDATE mob_droplist md
INNER JOIN item_basic ib 
	ON md.itemId = ib.itemid 
SET md.itemRate = 100
WHERE ib.name LIKE '%coffer_key%'
AND md.itemRate < 100;

SET @UNCOMMON = 100; -- Uncommon, 10%
SET @VCOMMON = 240; -- Uncommon, 10%
INSERT INTO `mob_droplist` VALUES (1336,0,0,1000,9082,@UNCOMMON); -- Clump Of Bee Pollen (Uncommon, 10%)
INSERT INTO `mob_droplist` VALUES (2046,0,0,1000,9083,@UNCOMMON); -- Mandragora Dewdrop (Uncommon, 10%)

UPDATE mob_droplist SET itemRate = 50 WHERE itemId = 17662; -- Company Sword
UPDATE mob_droplist SET itemRate = 50 WHERE itemId = 18002; -- Perseus's Harpe
UPDATE mob_droplist SET itemRate = @UNCOMMON WHERE dropId = 644 AND itemId = 1312; -- angel-skin

INSERT INTO `mob_droplist` VALUES (2326,0,0,1000,1418,@VCOMMON);  -- Gem Of The East (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (2820,0,0,1000,1419,@VCOMMON);  -- Springstone (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (357,0,0,1000,1420,@VCOMMON);  -- Gem Of The South (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (2821,0,0,1000,1421,@VCOMMON);  -- Summerstone (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (638,0,0,1000,1422,@VCOMMON);  -- Gem Of The West (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (2822,0,0,1000,1423,@VCOMMON);  -- Autumnstone (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (2800,0,0,1000,1424,@VCOMMON);  -- Gem Of The North (VCOMMON, 24%) Dec 7th 2010
INSERT INTO `mob_droplist` VALUES (2823,0,0,1000,1425,@VCOMMON);  -- Winterstone (VCOMMON, 24%) Dec 7th 2010

INSERT INTO `mob_droplist` VALUES (946,0,0,1000,1404,@VCOMMON);       -- Seal Of Genbu (24.0%)
INSERT INTO `mob_droplist` VALUES (2196,0,0,1000,1405,@VCOMMON);      -- Seal Of Seiryu (24.0%)
INSERT INTO `mob_droplist` VALUES (2362,0,0,1000,1407,@VCOMMON);       -- Seal Of Suzaku (24.0%)
INSERT INTO `mob_droplist` VALUES (394,0,0,1000,1406,@VCOMMON);      -- Seal Of Byakko (24.0%)