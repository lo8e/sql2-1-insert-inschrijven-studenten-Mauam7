USE lo8e_sql2;

INSERT INTO klassen
(klas_code, slb_code, cohort, opleiding_code)
VALUES
('lo9e-amo1', 'vlt03', 2019, 'amo'),
('lo9e-amo2', 'rs001', 2019, 'amo'),
('lo9e-amo3', 'bkr02', 2019, 'amo');

INSERT INTO studenten
(ov_nummer, achternaam, tussenvoegsel, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, inschrijvings_datum)
VALUES
(90001,'Koster','','Maurice','1999-04-30','2636 DJ','Schipluiden', 77.5, 1.88, '2019-01-01'),
(90002,'Jansen','','Jan','2001-06-06','1234 LO','Amsterdam', 70, 1.80, '2019-01-05'),
(90003,'Berg','','Joop','2000-12-06','4209 WD','Hindeloopen', 60, 1.79, '2019-03-21'),
(90004,'Manvis','','Huup','2001-02-07','5478 HJ','Moerkappelle', 80, 1.81, '2019-02-07');

INSERT INTO klassen_studenten(ov_nummer, klas_code) VALUES
    (90001,'lo9e-amo1'),
    (90002,'lo9e-amo2'),
    (90003,'lo9e-amo3'),
    (90004,'lo9e-amo3');
    
UPDATE studenten
SET geboortedatum='2001-06-07'
WHERE ov_nummer='90002';

UPDATE studenten
SET actief = false
WHERE inschrijvings_datum <= '2017-01-01';

SELECT concat(studenten.voornaam,' ', studenten.tussenvoegsel,' ', studenten.achternaam) AS Naam, klassen.cohort , klassen.klas_code, klassen_studenten.ov_nummer, concat(docenten.voorletters, ' ', docenten.tussenvoegsel, ' ', docenten.achternaam) AS 'slb-er' FROM studenten
INNER JOIN klassen_studenten 
ON klassen_studenten.ov_nummer = studenten.ov_nummer
INNER JOIN klassen
ON klassen.klas_code = klassen_studenten.klas_code
INNER JOIN docenten
ON klassen.slb_code = docenten.docent_code
WHERE studenten.actief = true
ORDER BY  klassen.klas_code ASC, studenten.achternaam ASC;

