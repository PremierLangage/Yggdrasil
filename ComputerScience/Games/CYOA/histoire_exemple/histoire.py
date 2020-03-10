{
    '1':
    [
        'import random; cle=random.choice(["la cabane", "le champ", "la forêt", "le lac", "la montagne", "le verger"])',

        "<p>Voici un exemple d'histoire scénarisable avec inclusion d'images par exemple. </p><br />"

        "<p>De manière abstraite, une histoire dont vous êtes le héro est un graphe sur "
        "lequel le lecteur se promène parce qu'on lui laisse régulièrement des choix. "
        "Ce graphe a un seul point d'entrée, c'est à dire que les lecteurs, joueurs, "
        "voire étudiants, commencent systématiquemenent au même endroit. </p><br />"

        "<p>PLaTon peut en fait aller plus loin que ça car il est possible (et optionnel) "
        "d'inclure un script python dans les noeuds de l'histoire, c'est à dire dans chacune des "
        "étapes visitables mais aussi des scripts dans les transitions du graphes (à chaque "
        "lien emprunté par l'utilisateur)</p></br>"
        
        "<p>Ici, dans cette démontration, l'exercice va cacher une clé dans un lieu aléatoire "
        "(c'est un tirage aléatoire uniforme dans une liste finie de lieux). Pour gagner, "
        "vous devrez aller chercher la clé dans l'endroit indiquéé.</p><br />"
        ,

        [
            ['2' , "continuer (remarquez ici qu'un seul choix est possible)"]
        ],
    ],

    '2':
    [
        '',

        "<p>Une décision a été prise lors de la première étape, Pour les connaisseurs de Python "
        "cette exercice PLaTon a éxécuté ça : </p> "
        "<pre>"
        "import random <br />"
        " <br />"
        "lieux = [\"la cabane\", \"le champ\", \"la forêt\", \"le lac\", \"la montagne\", \"le verger\"]<br />"
        "cle=random.choice(lieux)"
        "</pre>"
        
        "<p>C'est complètement optionnel et vous pourriez écrire une histoire très classique avec "
        "seulement des étapes contenant du texte en français et rien de plus. Toutefois, pour les "
        "enseignants à l'aise avec Python, sachez qu'il est possible d'utiliser toute la puissance "
        "de python à chaque étape. Ainsi, on pourrait afficher le graphe d'une fonction, dessiner une "
        "molécule, inclure une image au microscope, etc. Tout ce qui est Python et javascript friendly "
        "est envisageable.</p><br />"

        "<p>Pour en revenir à cette petite démonstration, l'exercice vient de cacher la clé dans un des "
        "lieux possibles. Si vous recommencez cette démonstration (en actualisant sauvagement la page par "
        "exemple), il y a de forte chance (5 sur 6) que la clé se retrouve dans un endroit différent. "
        "Sans sous faire plus attendre, ce coup-ci, voilà où se trouve la clé.</p><br />"

        "<center><b>La clé est dans {{ cle }}</b></center>",

        [
            ['3', "Vous vous dirigez vers la cabane"],

            ['4', "Vous vous dirigez vers le champ"],

            ['5', "Vous vous dirigez vers la forêt"],

            ['6', "Vous vous dirigez vers le lac"],

            ['7', "Vous vous dirigez vers la montagne"],

            ['8', "Vous vous dirigez vers le verger"],
        ]
    ],
}

