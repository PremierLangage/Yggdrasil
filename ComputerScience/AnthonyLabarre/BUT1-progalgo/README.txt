
Ressources
==========

La doc de Platon:           https://documentationpl.readthedocs.io/fr/latest/
La doc des composants:      https://pl.u-pem.fr/components/intro
Des exercices d'AP1/AP2:    dans /home/ComputerScience/python/

Intentions
==========

Plusieurs catégories d'exercices et de feuilles.

* feuille d'échauffement: test rapide (10-15 minutes) à réaliser en début de TP (ou chez soi?) pour vérifier les notions de base 
vues lors du dernier cours, ou nécessaires à la réalisation du TP. Idéalement, on voudrait:

- générer aléatoirement les feuilles de sorte que chaque étudiant reçoive une feuille différente;
- leur afficher les bonnes réponses à la fin (de l'exercice? ou de la feuille? à voir)
- leur attribuer également un score pour qu'ils se rendent compte de leur niveau (mais ne pas en tenir compte dans la note finale)

Les feuilles d'échauffement contiendront principalement des QCM ou des questions nécessitant des réponses très brèves, en tout cas 
pour ce qui concerne la programmation. On peut y reporter les questions très basiques de début de TP, pour l'instant je ne me base que 
sur ce que le cours fournit comme prérequis (donc "echauffement k" porte sur ce qu'on vient de voir dans le "CM k"). 

Pour l'algo, à voir...

NOTE: on n'est pas obligé de suivre le schéma du cours: on pourrait prévoir par exemple de faire un échauffement systématique par 
séance, quitte à se répéter de temps en temps.

* feuille de contrôle: des feuilles plus conséquentes avec des exercices nécessitant du code plus long et complexe, qui sera évalué sur
deux jeux de doctests: un jeu communiqué aux étudiants, et un jeu "caché" aléatoire ou non (à voir)

On peut autoriser plusieurs essais: je serais d'avis de ne pas le faire pour les échauffements mais de l'autoriser pour les contrôles.
Voire de ne pas limiter le nombre d'essais pour les contrôles

On peut éventuellement demander à quelques collègues de tester les feuilles

Structure de ce répertoire
==========================

./echauffement/                 contient les feuilles d'échauffement au format PLTP
./exercices/                    contient les exercices au format PL, qui seront inclus dans les feuilles PLTP
    ressources_exercices.py     diverses fonctions utiles à la génération d'exercices