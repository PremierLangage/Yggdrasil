Votre vol part dans quelques jours de l'aéroport côtier ; le chemin le plus simple vers la côte à partir d'ici est par le toboggan.

Le commerçant du North Pole Toboggan Rental Shop passe une mauvaise journée. « Quelque chose ne va pas avec nos ordinateurs ; 
nous ne pouvons pas nous connecter ! » Vous demandez si vous pouvez jeter un œil.

Leur base de données de mots de passe semble être un peu corrompue : certains mots de passe n'auraient pas été autorisés par 
la politique d'entreprise officielle de Toboggan qui était en vigueur lorsqu'ils ont été choisis.

Pour essayer de déboguer le problème, ils ont créé une liste (votre saisie de puzzle) de mots de passe (selon la base de données corrompue) 
et la politique de l'entreprise lorsque ce mot de passe a été défini.

Par exemple, supposons que vous ayez la liste suivante :

    1-3 a : abcde
    1-3 b : cdefg
    2-9 c : ccccccccc

Chaque ligne donne la politique de mot de passe puis le mot de passe. La politique de mot de passe indique le plus petit et le plus grand 
nombre de fois qu'une lettre donnée doit apparaître pour que le mot de passe soit valide. Par exemple, 1-3 a signifie que le mot de passe 
doit contenir a au moins 1 fois et au plus 3 fois.

Dans l'exemple ci-dessus, 2 mots de passe sont valides. Le mot de passe du milieu, cdefg, ne l'est pas ; il ne contient aucune instance de b, 
mais en a besoin d'au moins 1. Les premier et troisième mots de passe sont valides : ils contiennent un a ou neuf c, tous deux dans les limites 
de leurs politiques respectives.

Combien de mots de passe sont valides selon leurs politiques ?
