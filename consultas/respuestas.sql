-- 1. Busqué el reporte del crimen en la fecha y ciudad indicadas. Descubrí que hay dos testigos.
SELECT * FROM crime_scene_report
	WHERE type == "murder" AND date == 20180115 AND city == "SQL City"

-- 2. Encontré el primer testigo que vive en la ultima casa de Northwestern Dr.
SELECT *
FROM person
	WHERE address_street_name LIKE '%Northwestern Dr%'
ORDER BY address_number desc
limit 1

-- 3. Busqué la entrevista del primer testigo y encontré que tiene una membresía gold en el ginmasio, y tiene un carro con placa que contiene las letras H42W.
SELECT *
FROM interview
	JOIN person
		ON person_id = id
	WHERE name == "Morty Schapiro"

-- 4. Encontré el segundo testigo que vive en Franklin Ave y su primer nombre es Annabel.
SELECT *
FROM person
	WHERE name LIKE '%Annabel%' AND address_street_name == "Franklin Ave"

-- 5. Busqué la entrevista del segundo testigo y encontré que el asesinato ocurrio el 9 de enero (2018)
SELECT *
FROM interview
	JOIN person
		ON person_id = id
	WHERE name == 'Annabel Miller'

-- 6. Busco una persona que sea miembro gold del gimnasio, que haya ido el 9 de enero del 2018 y tenga un carro con placa que contiene H42W.
--encontré el nombre del asesino: Jeremy Bowers.
SELECT person.name, check_in_date, membership_status, plate_number  FROM person

JOIN get_fit_now_member
	ON person.id = person_id
JOIN get_fit_now_check_in
	ON get_fit_now_member.id = membership_id
JOIN drivers_license
	ON license_id = drivers_license.id
	
WHERE check_in_date = 20180109
	AND membership_status == "gold"
	AND plate_number LIKE "%H42W%"

-- 7. verifico la solucion
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
    SELECT value FROM solution;

-- 8. Busco el verdadero villano que me propone el reto
SELECT person.name, transcript  FROM person

JOIN interview
	ON person.id = person_id
WHERE name = "Jeremy Bowers";

-- 9. Encuentro el autor intelectual del asesinato: Miranda Priestly
SELECT person.name, event_name, sum(1) AS times_she_went, height, hair_color, car_make, car_model  FROM person

	JOIN facebook_event_checkin
		ON person.id = facebook_event_checkin.person_id
	JOIN drivers_license
		ON license_id = drivers_license.id

	WHERE hair_color == "red"
		AND 65<=height<=67
		AND event_name == "SQL Symphony Concert"
		AND date LIKE '%201712%'
		AND car_make == "Tesla" AND car_model == "Model S"

-- 10. Verifico que si sea ella el autor intelectual
INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;

