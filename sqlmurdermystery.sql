SELECT *
FROM crime_scene_report
WHERE city = 'SQL City' AND type = 'murder';
/* 2 witnesses: first lives at last house in Northwestern Dr
		second named Annabel living somewhere on Franklin Ave
*/

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
/* id: 14887, name: Morty Schapiro, license_id: 118009, address_number: 4919
	ssn: 111564949
*/

SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave' AND name LIKE 'Annabel%';
// id: 16371, name: Annabel Miller, address_number: 103, ssn: 318771143

SELECT person.name, interview.transcript
FROM person
JOIN interview
	ON person.id = interview.person_id
WHERE person.id = 14887 OR person.id = 16371;
/* MS: guy, get fit now gym bag, gold membership id started with "48Z" 
	got into car with plate including "H42W"
   AM: killer at gym on Jan 9
*/

SELECT c.membership_id, m.person_id, m.name, m.membership_status
FROM get_fit_now_member AS m
JOIN get_fit_now_check_in AS c
	ON m.id = c.membership_id
WHERE check_in_date LIKE '%0109'
	AND c.membership_id LIKE '48Z%'
	AND membership_status = 'gold';         
/* 2 matches:
	membership id: 48Z7A, person_id: 28819, name: Joe Germuska
	membership id: 48Z55, person_id: 67318, name: Jeremy Bowers
*/

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%'
	AND gender = 'male';
/* 2 matches:
	id: 423327
	id: 664760
*/

//LAST QUERY (2 METHODS)

SELECT p.name, p.id
FROM person AS p
JOIN drivers_license AS d
	ON p.license_id = d.id
WHERE plate_number LIKE '%H42W%'
	AND p.name = 'Joe Germuska' OR p.name = 'Jeremy Bowers';

SELECT p.name
FROM person AS p
JOIN drivers_license AS d
	ON p.license_id = d.id
JOIN get_fit_now_member AS m
	ON p.id = m.person_id
WHERE d.plate_number LIKE '%H42W%'
	AND m.membership_status = 'gold'
	AND m.person_id LIKE '48Z%'
	AND p.id = 28819 OR p.id = 67318

// Jeremy Bowers

INSERT INTO solution VALUES (1, 'Jeremy Bowers');      
	SELECT value FROM solution;

SELECT transcript
FROM interview
WHERE person_id = 67318;
/* I was hired by a woman with a lot of money. I don't know her name but I know 
	she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a
	 Tesla Model S. I know that she attended the SQL Symphony Concert 3 
	times in December 2017.
*/

SELECT p.name
FROM person AS p
JOIN drivers_license AS d
	ON p.license_id = d.id
JOIN facebook_event_checkin AS f
	ON p.id = f.person_id
WHERE d.height BETWEEN 65 AND 67
	AND d.hair_color = 'red'
	AND d.car_make = 'Tesla'
	AND d.car_model = 'Model S'
	AND f.date LIKE '201712%'
GROUP BY p.name
HAVING COUNT(f.person_id) = 3;
// Miranda Priestly
