-- POTIONS AND ETHERS STACK TO 12
UPDATE item_basic ib
INNER JOIN item_usable iu
	ON ib.itemid = iu.itemid
SET ib.stackSize = 12
WHERE ib.stackSize = 1
AND NOT ib.flags & (0x8000 | 0x4000 | 0x0080)
AND ib.aH IN (33)
AND (ib.itemid BETWEEN 4113 AND 4143
OR ib.itemid BETWEEN 4199 AND 4211);

-- DRINKS STACK TO 99
UPDATE item_basic ib
INNER JOIN item_usable iu
	ON ib.itemid = iu.itemid
SET ib.stackSize = 99
WHERE ib.stackSize = 1
AND NOT ib.flags & (0x8000 | 0x4000 | 0x0080)
AND ib.aH IN (58);

-- Brown Belt, Fuma Kyahan, Okote, Healing staff RARE
UPDATE item_basic
SET flags = flags | 0x8000
WHERE itemid IN (13202,13054,13952,17108);

UPDATE item_basic SET stackSize = 99, aH = 51 WHERE itemid IN (4305,4316,4479,5134,5135,5534); -- 'apkallufa', 'armored_pisces', 'bhefhel_marlin', 'mola_mola', 'rhinochimera', 'ryugu_titan'
UPDATE item_basic SET aH = 49 WHERE itemid IN (2971,2972,2973,5867,5868,5869); -- Shikanofuda, Chonofuda, Inoshishinofuda
UPDATE item_basic SET stackSize = 99 WHERE itemid = 17304; -- fuma_shuriken

UPDATE item_basic SET name = 'toolbag_soshi' WHERE name = 'toolbag_(soshi)';
UPDATE item_basic SET name = 'toolbag_kabenro' WHERE name = 'toolbag_(kabenro)';
UPDATE item_basic SET name = 'toolbag_jinko' WHERE name = 'toolbag_(jinko)';
UPDATE item_basic SET name = 'toolbag_jinko' WHERE name = 'toolbag_(ryuno)';
UPDATE item_basic SET name = 'toolbag_mokujin' WHERE name = 'toolbag_(mokujin)';
UPDATE item_basic SET name = 'toolbag_inoshishinofuda' WHERE name = 'toolbag_(inoshishinofuda)';
UPDATE item_basic SET name = 'toolbag_shikanofuda' WHERE name = 'toolbag_(shikanofuda)';
UPDATE item_basic SET name = 'toolbag_chonofuda' WHERE name = 'toolbag_(chonofuda)';
UPDATE item_basic SET name = 'toolbag_ranka' WHERE name = 'toolbag_(ranka)';
UPDATE item_basic SET name = 'toolbag_furu' WHERE name = 'toolbag_(furu)';
