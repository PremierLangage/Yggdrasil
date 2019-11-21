
author= PhilippeC

# comment
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title = années depuis la naissance
taboo=import
text == 
Fonction **resteDeXpar3()** qui retourne le reste de la division de X par 3 ?

    {{pltest2}}
==

before==
from datetime import datetime 

def saisieAnneeNaissance():
	"""Retourne une année de naissance saisie par un utilisateur comprise entre
	   1890 et la date du jour

    >>> saisieAnneeNaissance()
    1988

	"""
	anneeCourante = datetime.now().year
	anneeNaissance=0
	while anneeNaissance<1890 or anneeNaissance>anneeCourante:
		anneeNaissance=int(input("Veuillez saisir une année de naissance:"))
	return anneeNaissance


def affichageDecennies(anneeDebut,anneeFin):
	"""Affiche toutes les années entre 2 dates en effectuant un
	   saut de ligne à chaque décennie !
	   
	>>> affichageDecennies(1987,2019)
	Veuillez saisir une année de naissance:1988

	Les années vécues sont les suivantes:

	Années de la décennie: 1988 1989
	Années de la décennie: 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999
	Années de la décennie: 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009
	Années de la décennie: 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019
	"""
	decennie=1
	annee=anneeDebut
	print("\nLes années vécues sont les suivantes:\n")
	while annee<=anneeFin:
		print("Années de la décennie:",annee,end=' ')
		annee+=1
		while annee%10!=0 and annee<=anneeFin:
			print(annee,end=' ')
			annee+=1
			if annee%10==0:
				print()
		decennie+=1

affichageDecennies(saisieAnneeNaissance(),datetime.now().year)

after=before
==

pltest0==
>>> resteDeXpar3(3)
0
==

pltest1==
>>> resteDeXpar3(7)
0
>>> resteDeXpar3(4)
1
>>> resteDeXpar3(4765)
1
==


pltest3==
>>> resteDeXpar3(0)
0
>>> resteDeXpar3(4)
1
>>> resteDeXpar3(4765)
1
==






