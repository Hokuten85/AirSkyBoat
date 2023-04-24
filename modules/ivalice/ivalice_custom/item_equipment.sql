UPDATE item_equipment SET jobs = 14785 WHERE name = 'ryl.kgt._bascinet'; -- WAR, PLD, DRK, BST, SAM, NIN, DRG
UPDATE item_equipment SET jobs = 14785 WHERE name = 'haubergeon';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'hauberk';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'adaman_hauberk';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'ryl.kgt._chainmail';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'ryl.kgt._mufflers';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'ryl.kgt._breeches';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'ryl.kgt._sollerets';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'haubergeon_+1';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'hauberk_+1';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'r.k._mufflers_+1';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'r.k._mufflers_+2';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'r.k._sollerets_+1';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'r.k._sollerets_+2';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'armada_hauberk';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'alumine_haubert';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'luisant_haubert';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'sipahi_jawshan';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'abtal_jawshan';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'sipahi_dastanas';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'abtal_dastanas';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'sipahi_zerehs';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'abtal_zerehs';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'sipahi_boots';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'abtal_boots';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'sipahi_turban';
UPDATE item_equipment SET jobs = 14785 WHERE name = 'abtal_turban';

UPDATE item_equipment SET jobs = 36321 WHERE name = 'ridill'; -- WAR, THF, PLD, DRK, BST, RNG, SAM, BLU

UPDATE item_equipment SET jobs = 2111715 WHERE name = 'bomb_core'; -- WAR, MNK, THF, PLD, DRK, SAM, NIN, DRG, 

UPDATE item_equipment SET jobs = 2 | 2048 | 4096 WHERE name IN ('white_belt','black_belt','purple_belt','brown_belt'); -- MNK, SAM, NIN

UPDATE item_equipment SET jobs = jobs | 64 WHERE name IN ('nemesis_earring','eris_earring','eris_earring_+1'); -- ADD PLD

UPDATE item_equipment SET MId = 16 WHERE MId IN (14,15) AND name like '%subligar%'; -- CHANGE SUBLIGARS TO PANTS