INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offambulance','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Regrut',12,'{}','{}'),
  ('offpolice',1,'police','Policajac',24,'{}','{}'),
  ('offpolice',2,'officer','Oficir',36,'{}','{}'),
  ('offpolice',3,'sergeant','Narednik',48,'{}','{}'),
  ('offpolice',4,'lieutenant','Porucnik',0,'{}','{}'),
  ('offpolice',4,'boss','Nacelnik',0,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulance',12,'{}','{}'),
  ('offambulance',1,'doctor','Doctor',24,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chef',36,'{}','{}'),
  ('offambulance',3,'boss','Boss',48,'{}','{}')
;