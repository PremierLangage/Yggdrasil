DROP TABLE IF EXISTS magasin CASCADE;
DROP TABLE IF EXISTS usine CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS provenance CASCADE;

CREATE TABLE produit (
	ref_prod int PRIMARY KEY,
	 nom_prod text,
	 couleur text,
	 poids int
);

CREATE TABLE usine (
	ref_usine int PRIMARY KEY,
	 nom_usine text,
	 ville text
);

CREATE TABLE magasin (
	ref_mag int PRIMARY KEY,
	 nom_mag text,
	 ville text
);

CREATE TABLE provenance (
	ref_prod int REFERENCES produit(ref_prod),
	ref_usine int REFERENCES usine(ref_usine),
	ref_mag int REFERENCES magasin(ref_mag),
	quantite int,
	PRIMARY KEY (ref_prod, ref_usine, ref_mag)
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
