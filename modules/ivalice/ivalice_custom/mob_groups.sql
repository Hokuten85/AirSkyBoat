-- LOWER RESPAWN TIME FOR ALL NORMAL MOBS
UPDATE mob_groups mg
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN mob_family_system mfs
	ON mp.familyid = mfs.familyid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
SET respawntime = 180
WHERE mp.mobType = 0x00
AND mg.respawntime > 1
AND mfs.ecosystemID NOT IN (19)
AND mg.groupid = mg.groupid
AND zs.zonetype != 5;

-- LOWER DYNAMIS MOB LEVELS
UPDATE mob_groups mg
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
SET mg.minLevel = mg.minLevel - 15, mg.maxLevel = mg.maxLevel - 15
WHERE zs.zonetype = 5
AND NOT (mp.mobType & 0x02)
AND mg.minLevel > 85;

-- NMs respawn timer to 900 seconds
UPDATE mob_groups mg
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
SET mg.respawntime = 600
WHERE mp.mobType & 0x02
AND mg.spawntype = 0
AND mg.respawntime > 900;