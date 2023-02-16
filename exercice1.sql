-- 1 Découvrez combien de films il y a pour chaque note
SELECT rating, COUNT(*) as num_films
FROM film
GROUP BY rating;


-- 2.1 Filtrez davantage cette liste : recherchez uniquement les films qui durent moins de 2 heures et dont le prix de location (rental_rate) est inférieur à 3,00. Triez la liste par ordre alphabétique.
SELECT title
FROM film
WHERE (rating = 'G' OR rating = 'PG-13')
  AND length < 120
  AND rental_rate < 3.00
ORDER BY title;


-- 2.2 Recherchez un client dans la table des clients et remplacez ses coordonnées par vos coordonnées à l'aide de SQL UPDATE.
SELECT * FROM customer WHERE customer_id = 1; -- To find the customer's details

UPDATE customer
SET first_name = 'Your first name', last_name = 'Your last name', email = 'your.email@example.com'
WHERE customer_id = 1; 

-- Trouvez maintenant l'adresse du client et utilisez UPDATE pour remplacer l'adresse par votre adresse (ou créez-en une).
UPDATE address
SET address = 'Your address', city = 'Your city', postal_code = 'Your postal code'
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 1);