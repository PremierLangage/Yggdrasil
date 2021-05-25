extends = /model/basic/radio.pl

title = Géographie

before ==
datasample = csv_sample(data, 4)
capitale = datasample[0]['capitale']
items = [row['pays'] for row in datasample]
==

question ==
Quel pays a pour capitale {{capitale}} ?
==

data ==
pays,article,capitale
Allemagne,l,Berlin
Autriche,l,Vienne
Belgique,la,Bruxelles
Danemark,le,Copenhague
Espagne,l,Madrid
Finlande,la,Helsinki
France,la,Paris
Grèce,la,Athènes
Hongrie,la,Budapest
Irlande,l,Dublin
Italie,l,Rome
Norvège,la,Oslo
Pays-Bas,les,Amsterdam
Pologne,la,Varsovie
Portugal,le,Lisbonne
Roumanie,la,Bucarest
Royaume-Uni,le,Londres
Slovaquie,la,Bratislava
Suède,la,Stockholm
Suisse,la,Berne
==
