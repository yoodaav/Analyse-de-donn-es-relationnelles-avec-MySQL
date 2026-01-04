-- Création de la table "Clients"
CREATE TABLE data.Clients (
    ClientID INT PRIMARY KEY,
    Nom VARCHAR(200),
    Prenom VARCHAR(200),
    Adresse VARCHAR(200),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(30)
);




-- Création de la table Fournisseurs
CREATE TABLE data.Fournisseurs (
	FournisseurID INT PRIMARY KEY,
    NomFournisseur VARCHAR(200),
    Adresse VARCHAR(100),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(200)
    ) ;
    
-- Creation de la table employe
CREATE TABLE data.Employes (
	EmployeID INT PRIMARY KEY,
    Nom VARCHAR(200),
    Prenom VARCHAR(200),
    Fonction VARCHAR(200),
    Email VARCHAR(200),
    NuméroTelephone VARCHAR(200)
    ) ;
    
 
 -- Insertion des données dans les table fournisseurs
 -- INSERT INTO Fournisseurs (FournisseurID, NomFournisseur, Adresse, Email, NumeroTelephone)
 -- VALUES (1233, "Steve", "Rue Voltaire", "steve2024@gmail.com", "07 54 34, 72"),
-- (1444, "Arthur", "Rue Lumière", "arthur024@gmail.com", "07 54 34, 72");
 
 -- Modification de la table Produits pour intégrer l'identifiant du fournisseur
 -- Création de la table "Produits"
CREATE TABLE data.Produits (
    ProduitID INT PRIMARY KEY,
    NomProduit VARCHAR(200),
    Description TEXT,
    PrixUnitaire DECIMAL(10, 2),
   FournisseurID INT,
   FOREIGN KEY(FournisseurID)  REFERENCES Fournisseurs(FournisseurID)
);


 -- Modification de la création de la table vente pour intégrer l'identifiant de l'employe
CREATE TABLE data.Ventes (
    VenteID INT PRIMARY KEY,
    DateVente DATE,
    ClientID INT,
    ProduitID INT,
    EmployeID INT,
    FOREIGN KEY(ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY(ProduitID)  REFERENCES Produits(ProduitID),
    FOREIGN KEY(EmployeID) REFERENCES Employes(EmployeID),
    QuantiteVendue INT,
    MontantTotal DECIMAL(10, 2)
);

-- Lire des informations dans la base

/*======================================================*/
/*                 Maîtriser la clause SELECT           */
/*======================================================*/

/*======================================================*/
/* Fonctionnalité 1: Sélectionner toutes les informations d'une table 
Syntaxe générale:
SELECT *
FROM nom_table;
*/
/*======================================================*/

-- QUESTION 1: Donner la table complète des produits vendus par l'entreprise 
SELECT *
FROM produits;

-- QUESTION 2: Donner la table complète des clients de l'entreprise
SELECT *
FROM clients;

/*======================================================*/
/* Fonctionnalité 2: Sélectionner une seule colonne
Syntaxe générale:
SELECT nom_colonne
FROM nom_table;
*/
/*======================================================*/
/*======================================================*/
/* Fonctionnalité 2: Sélectionner une seule colonne
Syntaxe générale:
SELECT nom_colonne
FROM nom_table;
*/
/*======================================================*/

-- QUESTION 3: Donner le nom de tous les produits de la base de données et le prix unitaire
SELECT NomProduit , PrixUnitaire
FROM Produits;


-- QUESTION 4: Donner le nom de tous les fournisseurs de la base de données
SELECT NomFournisseur
FROM Fournisseurs;


SELECT NomFournisseur, FournisseurID,Email, Adresse
FROM Fournisseurs;
 
/*======================================================*/
/* Fonctionnalité 3: Sélectionner deux ou plusieurs colonnes
Syntaxe générale:
SELECT nom_colonne1, nom_colonne2,..., nom_colonne3
FROM nom_table;
======================================================*/

-- QUESTION 5: Donner le nom et le prénom des employés de l'entreprise
-- QUESTION 6: Donner le nom, le prix et la description de tous les produits

/*======================================================*/
/* Fonctionnalité 4: Sélectionner des valeurs distinctes
Syntaxe générale:
SELECT DISTINCT nom_colonne
FROM nom_table;
======================================================*/

-- QUESTION 7: Donner les différentes dates auxquelles des ventes ont été réalisées
 SELECT DISTINCT DateVente, QuantiteVendue, montanttotal
 from Ventes

-- QUESTION 8: Donner les noms et prénoms distincts des employés de l'entreprise
SELECT DISTINCT Nom, Prenom
FROM Employes

/*==========================================================================================*/
/*                 Maîtriser la clause WHERE POUR FILTRER suivant des conditions           */
/*==========================================================================================*/

/*======================================================*/
/* Fonctionnalité 6: Filtrer suivant une condition
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition;
======================================================*/
-- Liste produit vendu 
SELECT *
FROM Produits
WHERE PrixUnitaire = 85;

-- Liste produit vendu est à > 200

SELECT *
FROM Produits
WHERE PrixUnitaire > 200;

-- Liste produit vendu est à <= 200
SELECT DISTINCT ProduitID, NomProduit,PrixUnitaire,FournisseurID
FROM Produits
WHERE PrixUnitaire >= 200;

-- Liste produit vendu compris et 50 et 100
SELECT *
FROM Produits
WHERE PrixUnitaire >=50 AND PrixUnitaire <=100;

-- QUESTION 9: Information sur le produit "Nike Air Max" 
SELECT *
FROM Produits
WHERE NomProduit = "Nike Air Max";

-- QUESTION 10: Donner la liste des produits du fournisseur numéro 13
SELECT *
FROM Produits
WHERE FournisseurID = 13;

-- Description des produits du fournisseur numéro 13
SELECT DescProduit
FROM Produits
WHERE FournisseurID = 13;



/*======================================================*/
/* Fonctionnalité 7: Utilisation de plusieurs conditions avec AND et OR
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition1 AND/OR condition2;
======================================================*/
-- Liste des produits vendu par le fournisseur 13 ou par le fournisseur 11
SELECT *
FROM Produits
WHERE FournisseurID=13 OR FournisseurID=11

/*======================================================*/
/* Fonctionnalité 8: Utilisation de IN dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne IN (valeur1, valeur2, ...);
/*======================================================*/
SELECT *
FROM Produits
WHERE FournisseurID IN (13, 15, 55, 45, 89, 88);

/*======================================================*/
/* Fonctionnalité 9: Utilisation de BETWEEN dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne BETWEEN valeur1 AND valeur2;
======================================================*/

-- Sélectionner les ventes réalisées entre le 1er janvier 2021 et le 31 décembre 2023
SELECT *
FROM Ventes
WHERE dateVente BETWEEN "2021-01-10" AND "2021-03-31";


/*======================================================*/
/* Fonctionnalité 10: Utilisation de LIKE dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne 
FROM nom_table 
WHERE nom_colonne LIKE 'motif';
======================================================*/
-- Nom des clients qui commencent par la lettre c
SELECT *
FROM Clients
WHERE Nom like "c%";

-- Nom des clients qui commencent par la lettre c et qui se termine par a
SELECT *
FROM Clients
WHERE Nom LIKE "c%a" ;

SELECT *
FROM Clients
WHERE Nom LIKE "c%" AND Prenom LIKE "%y";

-- Le nom contient la lettre n
SELECT *
FROM Clients
WHERE Nom LIKE "%n%";

-- Le nom contient  "on"
SELECT *
FROM Clients
WHERE Nom LIKE "%on%";

-- Donner la liste des produits qui commencent par 'a'
-- Donner la liste des produits qui contiennent la lettre 'a'
-- Donner la liste des produits commençant par 'N' et finissant par 'x'

/*==========================================================================================
                 Maîtriser la clause ORDER BY POUR CLASSER
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition
ORDER BY nom_colonne [ASC | DESC], autre_nom_colonne [ASC | DESC], ...;
==========================================================================================*/

-- Donner la liste des produits du moins coûteux au plus coûteux
SELECT *
FROM Produits
ORDER BY prixUnitaire ;
-- Donner la liste des produits du prix le plus élevé au prix le moins élevé
SELECT *
FROM Produits
ORDER BY prixUnitaire ASC;

-- Liste des employés ordre alphabétique le nom croissant prénom
SELECT *
FROM Employes
ORDER BY nom ASC;

-- La liste des produits dont le prix est supérieur à 200, résultat par alphabétqiue suivant le nom du produit
SELECT *
FROM Produits
WHERE PrixUnitaire >200
ORDER BY NomProduit;


-- EXERCICE 
-- tabe complete des produits vendus 
SELECT *
FROM produits ;

-- la table complete des clients
SELECT *
FROM ventes;
-- les differentes dates distinctes de vente
SELECT DISTINCT DateVente , ProduitID
FROM ventes;
-- Les noms distincts des employes
SELECT nom , prenom
FROM employes;
-- Liste des produits prix donc le prix <= 200
SELECT *
FROM produits
WHERE PrixUnitaire <= 200;
-- Liste des produits prix donc le prix>= 200
SELECT *
FROM produits
WHERE PrixUnitaire >= 200;
-- liste des produits donc le prix est compris entre 50-100
 SELECT *
 FROM produits
 WHERE PrixUnitaire BETWEEN "50" AND "100";

-- La liste des produits du fournisseurs 13
 SELECT *
 FROM  produits
 WHERE FournisseurID = "13";
  -- La liste des produits du fournisseurs 13, 15 , 88, 89
 SELECT *
 FROM  produits
 WHERE FournisseurID IN ("13", "15" , "88", "89");
 -- LES VENTES REALISER ENTRE LE PREMIER JANVIER 2021 AU 31 DEC 2023
 SELECT *
 FROM ventes 
 WHERE DateVente BETWEEN "2021-01-01" AND "2023-12-31";
  
-- LISTE DE PRODUITS DU MOINS COUTEUX AU PLUS COUTEUX
SELECT ProduitID, NomProduit,PrixUnitaire
FROM produits
ORDER BY PrixUnitaire DESC;
--  LISTE DES EMPLOYES PAR ORDRE ALPHABETIQUE
SELECT*
FROM employes
 ORDER BY Nom ASC;
 
 -- la liste des lients dont le numero comment par 05 ou se termine par 94
 SELECT *
 FROM clients
 WHERE NumeroTelephone LIKE "05%" OR "%94";
 
  SELECT *
 FROM clients
 WHERE NumeroTelephone REGEXP "^05|94$";

  SELECT *
 FROM clients
 WHERE NumeroTelephone REGEXP "94$";

-- Liste des dix premiers clients par ordre alphabetique
SELECT *
FROM  clients 
ORDER BY Nom ASC
LIMIT 10;
-- LISTE DES 10 PRODUITS LES PLUS CHERES
SELECT *
FROM produits
ORDER BY PrixUnitaire DESC
LIMIT 10;

SELECT *
FROM produits
ORDER BY PrixUnitaire ASC
LIMIT 10;
-- LES FONCTION D'AGGREGATION --
-- Les nombres de clients dans ma base
 
SELECT COUNT(ClientID) AS NbreClient
FROM clients;
-- CLIENTS DISTINCTS
SELECT COUNT(DISTINCT ClientID) AS NbreClient
FROM clients;
-- LA SOMME TOTAL DES VENTES
SELECT SUM(MontantTotal) AS CA
FROM ventes;
-- CHIFFRE D'AFAIRE MOYENNE
SELECT AVG(MontantTotal) AS CAM
FROM ventes;
-- VENTE MAX ET MIN
SELECT MAX(MontantTotal) AS VenteMax
FROM ventes;

SELECT MIN(MontantTotal) AS VenteMIN
FROM ventes;

-- LE PRODUIT LE PLUS CHER ST LE MOINS CHER
SELECT MIN(PrixUnitaire),  MAX(PrixUnitaire)
FROM produits ;
--  LE CA PAR EMPLOYE
SELECT EmployeID , SUM(MontantTotal) AS CA
FROM ventes 
GROUP BY EmployeID ;

-- LE NOMBRE DE VENTE PAR EMPLOYE
SELECT EmployeID , COUNT(VenteID) AS CA
FROM ventes 
GROUP BY EmployeID ;

-- LE NOMBRE DE VENTE PAR DATE ET EMPLOYE
SELECT DateVente ,EmployeID, COUNT(VenteID)
FROM ventes 
GROUP BY DateVente ,EmployeID ;

-- LE CA PAR ANNE ET EMPLOYE
SELECT EXTRACT(YEAR FROM DateVente) AS Annee, SUM(MontantTotal)
FROM ventes
GROUP BY Annee 
ORDER BY Annee ASC ;

-- LE CA PAR ANNE ET EMPLOYE
SELECT EmployeID,YEAR(DateVente) AS Annee, SUM(MontantTotal)
FROM ventes
GROUP BY EmployeID,Annee 
ORDER BY Annee ASC ;

-- VENTE MOYENNE PAR ANNE ET EMPLOYE
SELECT EmployeID,YEAR(DateVente) AS Annee, AVG(MontantTotal) AS VenteMoyenne
FROM ventes
GROUP BY EmployeID,Annee 
ORDER BY Annee ASC ;

-- LES JOINTURES ------------------------
-- donnes pour chaque vente le nom et le prenon de l'employé qui a realisé la vente 
-- avec USING
SELECT venteID , Nom , Prenom
FROM ventes INNER JOIN employes  USING (EmployeID) ;
-- avec ON
SELECT venteID , Nom , Prenom
FROM ventes INNER JOIN employes ON ventes.EmployeID = employes.EmployeID ;


-- Pour chaque produit de la base de données donnez le nom et l'adresse de son fournisseur
SELECT produitID ,NomProduit, NomFournisseur , Adresse
FROM produits 
INNER JOIN fournisseurs USING (FournisseurID) ;

-- donner les nom et les penoms  des employes qui ont realisé la somme de vente plus élévé
SELECT EmployeID,Nom, Prenom , SUM(MontantTotal) AS CA
FROM employes INNER JOIN ventes USING (EmployeID)
GROUP BY EmployeID,Nom, Prenom
ORDER BY CA DESC; 

 -- Donner pour chaque client le nom l'adresse ainsi que le nombre d'achat realisé 
 SELECT clientID,Nom , Prenom , Adresse , COUNT(VenteID) AS TotalVente
 FROM clients INNER JOIN ventes USING(clientID)
 GROUP BY clientID,Nom , Prenom, Adresse 
 ORDER BY TotalVente DESC;
 
 -- les clauses LEFT et RIGHT JOIN pour combiner les lignes des differentes tables
 -- donner les nom et les penoms  des employes qui ont realisé une vente ( la clause LEFT JOINT  va afficher toutes les lignes meme ceux qui n'on ealisé auune vente
 SELECT clientID,Nom , Prenom , Adresse , COUNT(VenteID) AS TotalVente
 FROM clients LEFT JOIN ventes USING(clientID)
 GROUP BY clientID,Nom , Prenom, Adresse 
 ORDER BY TotalVente ASC;
 -- DONNER POUR CHAQUE FOURNISSEUR SON NOM SON ARESSE E_MAIL  ET LE NOMBRE DE PRODUIT FOUNIS
 SELECT NomFournisseur ,Email , COUNT(ProduitID) AS QteProduit
 FROM fournisseurs LEFT JOIN produits USING(FournisseurID)
 GROUP BY NomFournisseur ,Email 
 ORDER BY QteProduit ASC ;
 -- Donner le nom, prenom et la moyenne de vente par client
 SELECT Nom , Prenom , AVG(MontantTotal) AS VenteAVG
 FROM clients LEFT JOIN ventes USING(clientID)
 GROUP BY Nom , Prenom
 ORDER BY VenteAVG ASC ;
 -- POUR LA REQUETE PRECEDENTE REMPLACER LES VALEURS NULL PAR ZERO
-- la clause COALESCE
 SELECT Nom , Prenom , ROUND(COALESCE(AVG(MontantTotal),0),3 ) AS VenteAVG
 FROM clients LEFT JOIN ventes USING(clientID)
 GROUP BY Nom , Prenom
 ORDER BY VenteAVG ASC ;
 
 -- LA LISTE DES CLIENTS QUI ONT REALISE PLUS DE 1 ACHATS EN 2021
 -- ON CREE D'ABORD DE VUE DE VENTE POUR L'ANNEE 2021
 CREATE VIEW Vente2021 AS
 SELECT *
 FROM ventes
 WHERE YEAR(DateVente) = 2021;
 
 -- ensuite
 SELECT Nom, prenom, COUNT(venteID) AS Nachat
 FROM clients LEFT JOIN vente2021  USING(clientID)
 GROUP BY Nom, prenom
 HAVING Nachat > 2 
 ORDER BY Nachat ASC;
  -- QUELLE EST LA LISTE DES EMPLOYES QUI ONTLES VENTES MOYEMMES SUPERIEUR A 500  EN 2021
  CREATE VIEW VENTEavg2021 AS
  SELECT*
  FROM ventes
  WHERE YEAR(DateVente) = 2021 ;
-- ensuite
SELECT EmployeID , Nom, prenom, AVG(MontantTotal) AS AvgVente
FROM employes LEFT JOIN venteavg2021 USING(EmployeID)
GROUP BY EmployeID , Nom, prenom
HAVING AvgVente > 1000
ORDER BY AvgVent ASC;

-- creer une vue contenant les produits dont Le prix est superieur à 500
CREATE VIEW Produit500 AS 
SELECT *
FROM produits
WHERE PrixUnitaire > 500 ;

-- notion de sous requete
-- la liste des produit quin'ont pas ete vendu en 2023
SELECT ProduitID , NomProduit
FROM produits 
WHERE ProduitID NOT IN (SELECT ProduitID FROM ventes WHERE YEAR(DateVente)= 2023);

-- la liste des produit qui ont ete vendu en 2023
 SELECT ProduitID , NomProduit
FROM produits 
WHERE ProduitID IN (SELECT DISTINCT ProduitID  FROM ventes WHERE YEAR(DateVente)= 2023)
GROUP BY ProduitID , NomProduit
ORDER BY  NomProduit ASC;

 -- la liste des client qui ont qui ont un CA superieur à la moyenne 
 SELECT *
 FROM clients 
 LEFT JOIN ventes USING(clientID)
 WHERE MontantTotal > (SELECT AVG(MontantTotal) AS AvgCA  FROM ventes); 
 -- liste des clients qui n'ont realise aucun achat
 SELECT *
 FROM clients 
  WHERE clientID NOT IN (SELECT clientID FROM  ventes);

 -- la liste des client qui ont qui ont un CA superieur à la moyenne 
 SELECT C.Nom, C.Prenom , SUM(MontantTotal) AS CA
 FROM clients C
 INNER JOIN ventes V USING(clientID)
 GROUP BY C.Nom, C.Prenom 
 HAVING CA > (SELECT AVG(MontantTotal) FROM ventes);
 
 
 SELECT C.Nom, C.Prenom , SUM(MontantTotal) AS CA
 FROM clients C
 INNER JOIN ventes V USING(clientID)
 GROUP BY C.Nom, C.Prenom ;
 
 -- donner les noms et les prenoms  des employes qui ont realisé la somme de vente plus élévé
 SELECT E.Nom, E.Prenom, SUM(MontantTotal) AS CA
 FROM employes E
 INNER JOIN ventes V USING(EmployeID)
 GROUP BY E.Nom, E.Prenom
 ORDER BY CA DESC;
 
 SELECT SUM(Quantitevendue) AS QTE
 FROM ventes ;
 SELECT SUM(MontantTotal) AS CA
 FROM ventes;
 
 SELECT (SELECT SUM(PrixUnitaire) FROM produits)*(SELECT SUM(QuantiteVendue)  FROM ventes) AS TotalVente;
 
 SELECT SUM(v.Quantitevendue * p.PrixUnitaire) AS TotalVente
 FROM ventes v 
 JOIN produits p USING(ProduitID);
 
-- la liste des clients qui n'ont realise aucune ventes en 2021
SELECT ClientID, C.Nom,C.Prenom
FROM clients C
WHERE ClientID  IN (SELECT ClientID  FROM ventes WHERE  YEAR(DateVente)= 2022)
 GROUP BY ClientID, C.Nom,C.Prenom;
 

-- afficher le nom , prenom des commerciaux ayant realisé de vente par année 
SELECT C.Nom,C.Prenom ,YEAR(DateVente) AS Année, SUM(MontantTotal) AS CAA 
 FROM clients C 
 INNER JOIN ventes USING(ClientID)
 GROUP BY  C.Nom,C.Prenom,Année 
 ORDER BY Nom,Année






