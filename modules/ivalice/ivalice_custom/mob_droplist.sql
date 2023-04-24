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
SELECT dropid, dropType, groupid, groupRate, itemId, itemRate + 10 * lvlBucket AS itemRate
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
		300 AS itemRate
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