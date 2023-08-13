UPDATE status_effects SET flags = flags + 0x0002 WHERE id = 16; -- Amnesia eraseable

UPDATE status_effects SET type = 95 WHERE id = 51; -- blood_weapon
UPDATE status_effects SET type = 96 WHERE id = 275; -- auspice