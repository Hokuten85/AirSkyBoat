UPDATE mob_pools SET true_detection = 0 where poolid = 6377; -- fuck Poroggo_Excavator being true sight and blocking access to coffer mobs
UPDATE mob_pools SET links = 0 WHERE poolid = 2580; -- make marsh murre in cadaerva mire not link
UPDATE mob_pools SET links = 0 WHERE poolid = 6469; -- Colliery_Bat no link

UPDATE mob_pools SET immunity = 0x8 WHERE poolid = 723;