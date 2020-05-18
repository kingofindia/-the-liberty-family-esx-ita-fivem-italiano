SET @job_name = 'bahama_mamas';
SET @society_name = 'society_bahama_mamas';
SET @job_Name_Caps = 'Bahama Mamas';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_bahama_mamas_fridge', 'Bahama Mamas (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Barman', 300, '{}', '{}'),
  (@job_name, 1, 'dancer', 'Ballerina', 300, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Vice Boss', 500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Boss', 600, '{}', '{}')
;
