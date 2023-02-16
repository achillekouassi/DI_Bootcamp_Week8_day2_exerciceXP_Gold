-- PARTIE 1
-- 1- Créez une table nommée achats . Il doit avoir 3 colonnes
CREATE TABLE purchases (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  item_id INT,
  quantity_purchased INT
);

-- 2- Insérez les achats pour les clients, utilisez des sous-requêtes
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 3, 1
FROM customers
WHERE first_name = 'Scott' AND last_name = 'Scott';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 2, 10
FROM customers
WHERE first_name = 'Melanie' AND last_name = 'Johnson';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 1, 2
FROM customers
WHERE first_name = 'Greg' AND last_name = 'Jones';

--PARTIE 2
-- 1- Utilisez SQL pour obtenir les éléments suivants à partir de la base de données :
-- 1.1- Tous les achats. Ces informations nous sont-elles utiles
SELECT * FROM purchases;

-- 1.2- Tous les achats, joint à la table des clients .
SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- 1.3- Achats du client avec l'ID égal à 5.
SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id
WHERE customers.id = 5;

-- 1.4- Achats pour un grand bureau ET un petit bureau
SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id
WHERE items.name = 'Large Desk' OR items.name = 'Small Desk';

-- 2- Utilisez SQL pour afficher tous les clients qui ont effectué un achat. Afficher les champs/colonnes suivants :
-- 2.1- Prénom du client
SELECT customers.first_name
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- 2.2- Nom de famille du client
SELECT customers.last_name
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- 2-3- Nom de l'article
SELECT items.name
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;


-- 3- Ajoutez une ligne qui référence un client par ID, mais ne référence pas un article par ID (laissez-la vide). Est-ce que ça marche? Pourquoi pourquoi pas?
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);



