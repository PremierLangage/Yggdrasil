DROP TABLE IF EXISTS magasin CASCADE;
DROP TABLE IF EXISTS usine CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS provenance CASCADE;

CREATE TABLE produit (
	ref_prod integer primary key,
	 nom_prod text not null,
	 couleur text ,
	 poids integer
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
	idS int REFERENCES soiree(idS),
	surnom varchar(25) REFERENCES personne(surnom),
	avatar varchar(25),
	PRIMARY KEY(idS,surnom)
);


--Filling table deguisement:
INSERT INTO deguisement VALUES ('min0','minion','SoParty');
