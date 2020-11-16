.mode csv

DROP TABLE IF EXISTS deguisement;
DROP TABLE IF EXISTS vendre;
DROP TABLE IF EXISTS personne;
DROP TABLE IF EXISTS soiree;
DROP TABLE IF EXISTS participe;

CREATE TABLE deguisement (
	modele varchar(25) primary key,
	avatar varchar(25),
	marque varchar(25)
);

CREATE TABLE vendre (
	nomMag varchar(25),
	modele varchar(25) REFERENCES deguisement(modele),
	taille varchar(3),
	prix float,
	PRIMARY KEY(nomMag,modele,taille)
);

CREATE TABLE personne (
	surnom varchar(25) primary key,
	nom varchar(25),
	prenom varchar(25),
	age int,
	taille int
);

CREATE TABLE soiree (
	idS int primary key,
	lieu varchar(25),
	date date,
	entree int,
	organisateur varchar(25) REFERENCES personne(surnom),
	nbmax int
);

CREATE TABLE participe (
	ids int REFERENCES soiree(ids),
	surnom varchar(25) REFERENCES personne(surnom),
	avatar varchar(25),
	PRIMARY KEY(ids,surnom)
);

--.import ../databases/deguisement.sql deguisement
--.import ../databases/vendre.sql vendre
--.import ../databases/personne.sql personne
--.import ../databases/soiree.sql soiree
--.import ../databases/participe.sql participe

.exit
