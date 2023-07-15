UPDATE mob_skills SET mob_anim_id = 45 WHERE mob_skill_name = 'petal_pirouette'; -- Not the right animation, but stops crashing
UPDATE mob_skills SET mob_anim_id = 34 WHERE mob_skill_name = 'king_cobra_clamp'; -- Not the right animation, but stops crashing

INSERT INTO mob_skill_lists VALUES ('Colibri', 72, 622); -- Helldive
INSERT INTO mob_skill_lists VALUES ('Colibri', 72, 623); -- Wing Cutter
INSERT INTO mob_skill_lists VALUES ('Colibri', 72, 400); -- triple attack