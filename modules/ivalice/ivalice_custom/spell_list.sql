UPDATE spell_list SET recastTime = 10000 WHERE name = 'haste';
UPDATE spell_list SET jobs = 0x00000000300000000000000000000000000000300000 WHERE spellid = 845; -- Flurry
UPDATE spell_list SET requirements = 0 WHERE spellid = 260; -- dispel

UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE name IN ('enfire','enblizzard','enaero','enstone','enthunder','enwater');
UPDATE spell_list SET recastTime = 10000 WHERE name = 'refresh';
UPDATE spell_list SET castTime = 1500 WHERE name = 'erase';

UPDATE spell_list SET mpCost = 4, base = 10 WHERE spellid IN (144,149,154,159,164,169);    -- fire,blizzard, aero, stone, thunder, water
UPDATE spell_list SET mpCost = 16, base = 78 WHERE spellid IN (145,150,155,160,165,170);   -- fire 2,blizzard 2, aero 2, stone 2, thunder 2, water 2
UPDATE spell_list SET mpCost = 40, base = 210 WHERE spellid IN (146,151,156,161,166,171);  -- fire 3,blizzard 3, aero 3, stone 3, thunder 3, water 3
UPDATE spell_list SET mpCost = 8, base = 381 WHERE spellid IN (147,152,157,162,167,172);   -- fire 4,blizzard 4, aero 4, stone 4, thunder 4, water 4
UPDATE spell_list SET mpCost = 156, base = 626 WHERE spellid IN (148,153,158,163,168,173); -- fire 5,blizzard 5, aero 5, stone 5, thunder 5, water 5
UPDATE spell_list SET mpCost = 24, base = 56 WHERE spellid IN (174,179,184,189,194,199);   -- firaga, blizzaga, aeroga, stonega, thundaga, waterga
UPDATE spell_list SET mpCost = 93, base = 201 WHERE spellid IN (175,180,185,190,195,200);  -- firaga 2, blizzaga 2, aeroga 2, stonega 2, thundaga 2, waterga 2
UPDATE spell_list SET mpCost = 175, base = 434 WHERE spellid IN (176,181,186,191,196,201); -- firaga 3, blizzaga 3, aeroga 3, stonega 3, thundaga 3, waterga 3
UPDATE spell_list SET mpCost = 345, base = 667 WHERE spellid IN (177,182,187,192,197,202); -- firaga 4, blizzaga 4, aeroga 4, stonega 4, thundaga 4, waterga 4
UPDATE spell_list SET mpCost = 512, base = 868 WHERE spellid IN (178,183,188,193,198,203); -- firaga 5, blizzaga 5, aeroga 5, stonega 5, thundaga 5, waterga 5

UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 242; -- absorb-acc
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 266; -- absorb-str
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 267; -- absorb-dex
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 268; -- absorb-vit
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 269; -- absorb-agi
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 270; -- absorb-int
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 271; -- absorb-mnd
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 272; -- absorb-chr

UPDATE spell_list SET jobs = 0x0000000000004B000000000000000000000000000000 WHERE spellid = 310; -- enlight PLD 75
UPDATE spell_list SET jobs = 0x000000000000004B0000000000000000000000000000 WHERE spellid = 311; -- endark DRK 75

UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE name IN ('enfire_ii','enblizzard_ii','enaero_ii','enstone_ii','enthunder_ii','enwater_ii');

UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 479; -- boost-str
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 480; -- boost-dex
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 481; -- boost-vit
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 482; -- boost-agi
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 483; -- boost-int
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 484; -- boost-mnd
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000, spell_range = 0 WHERE spellid = 485; -- boost-chr

UPDATE spell_list SET jobs = 0x000000004B0000000000000000000000000000000000 WHERE spellid IN (486,487,488,489,490,491,492); -- gain-str,gain-dex,gain-vit,gain-agi,gain-int,gain-mnd,gain-chr

UPDATE spell_list SET validTargets = 3, spell_range = 204  WHERE spellid IN (249,250,251); -- blaze, ice, shock spikes

UPDATE spell_list SET jobs = 0x00000000000000000000000000000000000000004B00 WHERE spellid IN (829,831,833,835,837,839); -- fira_ii,blizzara_ii,aera_ii,stonera_ii,thundara_ii,watera_ii

UPDATE spell_list SET jobs = 0x00000000000000000000000019000000000000000000 WHERE name IN ('gekka_ichi','yain_ichi');
UPDATE spell_list SET jobs = 0x00000000000000000000000046000000000000000000 WHERE name IN ('yurin_ichi');

UPDATE spell_list SET content_tag = NULL;