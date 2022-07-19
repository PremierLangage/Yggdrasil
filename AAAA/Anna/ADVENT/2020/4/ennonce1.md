Vous arrivez à l'aéroport pour vous rendre compte que vous avez saisi vos informations d'identification du pôle Nord au lieu de votre passeport. Bien que ces documents soient extrêmement similaires, les informations d'identification du pôle Nord ne sont pas délivrées par un pays et ne sont donc pas des documents valides pour voyager dans la plupart des pays du monde.

Il semble que vous n'êtes pas le seul à avoir des problèmes, cependant; une très longue file d'attente s'est formée pour les scanners automatiques de passeports, et le retard pourrait perturber votre itinéraire de voyage.

En raison d'une sécurité réseau douteuse, vous réalisez que vous pourrez peut-être résoudre ces deux problèmes en même temps.

Les scanners automatiques de passeports sont lents car ils ont du mal à détecter quels passeports contiennent tous les champs obligatoires. Les champs attendus sont les suivants :

    byr (année de naissance)
    an (année d'émission)
    ayr (année d'expiration)
    hgt (hauteur)
    hcl (coloration des cheveux)
    ecl (couleur des yeux)
    pid (ID de passeport)
    cid (identifiant du pays)
    

Les données de passeport sont validées dans des fichiers batch (votre entrée de puzzle). Chaque passeport est représenté comme une séquence de paires clé:valeur séparées par des espaces ou des retours à la ligne. Les passeports sont séparés par des lignes vierges.

Voici un exemple de fichier batch contenant quatre passeports :

    ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
    byr:1937 an:2017 cid:147 hgt:183cm

    yr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
    hcl:#cfa07d byr:1929

    hcl:#ae17e1 an:2013
    an:2024
    ecl:brn pid:760753108 byr:1931
    hauteur:179cm

    hcl:#cfa07d eyr:2025 pid:166559648
    an:2011 ecl:brn hgt:59po


Le premier passeport est valide - les huit champs sont présents. Le deuxième passeport n'est pas valide - il manque hgt (le champ Hauteur).

Le troisième passeport est intéressant ; le seul champ manquant est cid, il ressemble donc à des données de North Pole Credentials, pas à un passeport du tout ! Sûrement, personne ne s'en soucierait si vous faisiez en sorte que le système ignore temporairement les champs cid manquants. Traitez ce "passeport" comme valide.

Le quatrième passeport manque deux champs, cid et byr. Cid manquant, c'est bien, mais aucun autre champ ne l'est, donc ce passeport n'est pas valide.

Selon les règles ci-dessus, votre système amélioré signalerait 2 passeports valides.

Comptez le nombre de passeports valides - ceux qui ont tous les champs obligatoires. Considérez cid comme facultatif. Dans votre fichier batch, combien de passeports sont valides ?