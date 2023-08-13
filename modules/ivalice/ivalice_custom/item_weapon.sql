-- COR ONLY GUNS REDUCED DELAY
UPDATE item_weapon iw
INNER JOIN item_equipment ie 
	on ie.itemId  = iw.itemId
SET iw.delay = iw.delay * 0.6, iw.dmg = iw.dmg * 0.8
WHERE jobs = 65536
AND slot = 4
AND ie.level <= 75;

UPDATE item_weapon SET dmg = 19 WHERE itemid in (18716); -- marss_hexagun_+1 make sure it has dmg+1
UPDATE item_weapon SET dmg = 40 WHERE itemid in (18987,19007); -- death_penalty keep dmg the same

UPDATE item_weapon SET dmg = dmg * 2 WHERE itemid in (17343,19229,18713); -- bronze_bullet,tin_bullet,copper_bullet

UPDATE item_weapon SET dmg = 80 WHERE itemid = 18235; -- corsair_bullet