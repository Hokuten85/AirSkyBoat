update item_mods set value = 30 where modid = 501 and value < 30;
update item_mods set value = 50 where modid = 501 and itemid IN (18148,18150); -- acid, blind bolt

-- COR Double-up enhancement
INSERT INTO item_mods VALUES (12004,3003,1);
INSERT INTO item_mods VALUES (15920,3003,1);
INSERT INTO item_mods VALUES (19007,3003,1);

INSERT INTO item_mods VALUES (11993,3004,1); -- Rogue's Torque

INSERT INTO item_mods VALUES (14226,68,10); -- Ninja Hakama
INSERT INTO item_mods VALUES (14101,169,18); -- Ninja Kyahan
