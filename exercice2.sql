-- Mise À Jour
-- 1- Lea Benichou' et 'Marc Benichou' sont jumeaux, ils doivent avoir les mêmes dates de naissance. Mettez à jour leurs dates de naissance au 02/11/1998.
UPDATE student
SET birth_date = '1998-11-02'
WHERE first_name = 'Lea' OR first_name = 'Marc';

-- 2- Changez le nom de famille de David de 'Grez' à 'Guez'.
UPDATE student
SET last_name = 'Guez'
WHERE first_name = 'David';


-- SUPPRIMER
-- 1- Supprimez l'élève nommée 'Lea Benichou' du tableau.
DELETE FROM student
WHERE first_name = 'Lea' AND last_name = 'Benichou';


-- Compter
-- 1- Comptez le nombre d'élèves dans le tableau
SELECT COUNT(*) AS num_students
FROM student;

-- 2- Comptez le nombre d'élèves nés après le 1/01/2000.
SELECT COUNT(*) AS num_students
FROM student
WHERE birth_date > '2000-01-01';


-- Insérer / Modifier
-- 1- Ajoutez une colonne à la table des étudiants appelée math_grade .
ALTER TABLE student
ADD math_grade INT;

-- 2- Ajoutez 80 à l'étudiant dont l'identifiant est 1.
UPDATE student
SET math_grade = math_grade + 80
WHERE id = 1;

-- 3- Ajoutez 90 aux étudiants qui ont des identifiants de 2 ou 4.
UPDATE student
SET math_grade = math_grade + 90
WHERE id IN (2, 4);

-- 4- Ajoutez 40 à l'élève dont l'identifiant est 6.
UPDATE student
SET math_grade = math_grade + 40
WHERE id = 6;

-- 5- Comptez combien d'élèves ont une note supérieure à 83
SELECT first_name, last_name, COUNT(*) AS total_grades
FROM student
WHERE math_grade > 83
GROUP BY first_name, last_name;

-- 6- Ajoutez un autre étudiant nommé "Omer Simpson" avec la même date_de_naissance que celui déjà dans le tableau. Donnez-lui une note de 70.
INSERT INTO student (first_name, last_name, birth_date, math_grade)
SELECT first_name, last_name, birth_date, 70
FROM student
WHERE first_name = 'Omer' AND last_name = 'Simpson';

-- 7- Maintenant, dans le tableau, "Omer Simpson" devrait apparaître deux fois. C'est le même élève, bien qu'il ait reçu 2 notes différentes parce qu'il a repris l'examen de mathématiques.
SELECT first_name, last_name, COUNT(math_grade) AS total_grades
FROM student
GROUP BY first_name, last_name;


-- SOMME
-- 1- Trouver la somme de toutes les notes des élèves.
SELECT SUM(math_grade) AS total_grades
FROM student;



