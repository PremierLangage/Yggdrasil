DROP TABLE IF EXISTS magasin CASCADE;
DROP TABLE IF EXISTS usine CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS provenance CASCADE;

CREATE TABLE produit (
	ref_prod int PRIMARY KEY,
	 nom_prod text NOT NULL,
	 couleur text ,
	 poids int
);

CREATE TABLE usine (
	ref_usine int PRIMARY KEY,
	 nom_usine text NOT NULL,
	 ville text NOT NULL
);

CREATE TABLE magasin (
	ref_mag int PRIMARY KEY,
	 nom_mag text NOT NULL,
	 ville text NOT NULL
);

CREATE TABLE provenance (
	ref_prod int REFERENCES produit(ref_prod),
	ref_usine int REFERENCES usine(ref_usine),
	ref_mag int REFERENCES magasin(ref_mag),
	quantite int,
	PRIMARY KEY (ref_prod, ref_usine, ref_mag)
);

--
-- Data for Name: magasin
--
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (14, 'Stock10', 'Paris');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (16, 'JaiTout', 'Marseille');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (18, 'EnGros', 'Bordeaux');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (20, 'PrixBas', 'Toulouse');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (22, 'BasPrix', 'Marseille');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (24, 'DuBon', 'Lyon');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (26, 'DuBeau', 'Toulouse');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (28, 'BasDeGamme', 'Dublin');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (30, 'PasCher', 'Lyon');


--
-- Data for Name: produit
--

INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (1, 'tabouret', 'rouge', 5);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (2, 'evier', 'bleu', 65);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (3, 'bureau', 'jaune', 45);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (4, 'lampe a petrole', 'vert', 15);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (5, 'ordinateur', 'rouge', 10);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (6, 'telephone', 'bleu', 8);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (7, 'tabouret', 'violet', 1);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (8, 'evier', 'bleu', 65);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (9, 'tabouret', 'orange', 3);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (10, 'lampe halogene', 'rose', 11);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (11, 'lampe a souder', 'noir', 3);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (12, 'telephone', 'bleu', 2);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (13, 'casse-noix', 'vert', 1);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (14, 'casse-pied', 'marron', 55);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (15, 'casse-oreille', 'violet', 15);


--
-- Data for Name: provenance
--

INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 109, 14, 80);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 109, 16, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 302, 16, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (2, 189, 30, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 402, 14, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (4, 200, 18, 985);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (5, 302, 20, 858);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (6, 213, 16, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (6, 109, 22, 458);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (7, 109, 16, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (8, 302, 16, 2000);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (9, 189, 30, 175);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (10, 402, 14, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (11, 109, 16, 750);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (11, 302, 16, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 189, 30, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 200, 16, 589);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 189, 22, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (13, 402, 14, 499);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (14, 109, 18, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (15, 189, 20, 1958);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (15, 189, 16, 333);


--
-- Data for Name: usine
--

INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (109, 'martin', 'Nantes');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (189, 'leroux', 'Marseille');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (213, 'dupont', 'Bordeaux');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (402, 'peugeot', 'Toulouse');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (200, 'peugeot', 'Marseille');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (302, 'rover', 'Londres');
