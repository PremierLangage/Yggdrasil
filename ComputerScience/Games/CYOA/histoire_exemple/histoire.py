{
'1':
    [
        'import random; cle=random.choice(["la cabane", "le champ", "la forêt", "le lac", "la montagne", "le verger"])',

        "<p>Voici un exemple d'histoire scénarisable avec inclusion d'images. </p><br />"

        "<p>De manière abstraite, une histoire dont vous êtes le héro est un graphe sur "
        "lequel le lecteur se promène parce qu'on lui laisse régulièrement des choix. "
        "Ce graphe a un seul point d'entrée, c'est à dire que les lecteurs, joueurs, "
        "voire étudiants, commencent systématiquemenent au même endroit. </p><br />"

        "<p>PLaTon peut en fait aller plus loin que ça, car il est possible (c'est optionnel) "
        "d'inclure un script python dans les noeuds de l'histoire, c'est à dire dans chacune des "
        "étapes visitables ; mais aussi des scripts dans les transitions du graphes (à chaque "
        "lien emprunté par l'utilisateur)</p></br>"
        
        "<p>Ici, dans cette démontration, l'exercice va cacher une clé dans un lieu aléatoire "
        "(c'est un tirage aléatoire uniforme dans une liste finie de lieux). Pour gagner, "
        "vous devrez aller chercher la clé dans l'endroit indiqué.</p><br />"
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
        "Sans vous faire plus attendre, ce coup-ci, voilà où se trouve la clé.</p><br />"

        "<center><b>La clé est dans {{ cle }}</b></center>",

        [
            ['3', "Vous vous dirigez vers la cabane", 'gagne = (cle=="la cabane")'],

            ['4', "Vous vous dirigez vers le champ", 'gagne = (cle=="le champ")'],

            ['5', "Vous vous dirigez vers la forêt", 'gagne = (cle=="la forêt")'],

            ['6', "Vous vous dirigez vers le lac", 'gagne = (cle=="le lac")'],

            ['7', "Vous vous dirigez vers la montagne", 'gagne = (cle=="la montagne")'],

            ['8', "Vous vous dirigez vers le verger", 'gagne = (cle=="le verger")'],
        ]
    ],

'3':
    [
        '',

        "<center><img src={{ cabane }} alt='image de cabane' style=\"width:400px;\" /></center><br />"

        "<p>Cette image de petite maison abandonnée est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans la cabane."],
        ]
    ],

'4':
    [
        '',

        "<center><img src={{ champ }} alt='image de champ' style=\"width:400px;\" /></center><br />"

        "<p>Cette image d'un champs est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans le champ."],
        ]
    ],

'5':
    [
        '',

        "<center><img src={{ foret }} alt='image de foret' style=\"width:400px;\" /></center><br />"

        "<p>Cette image d'une forêt est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans la forêt."],
        ]
    ],

'6':
    [
        '',

        "<center><img src={{ lac }} alt='image d'un lac style=\"width:400px;\" /></center><br />"

        "<p>Cette image d'un lac est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans le lac."],
        ]
    ],

'7':
    [
        '',

        "<center><img src={{ montagne }} alt='image d'une montagne' style=\"width:400px;\" /></center><br />"

        "<p>Cette image d'une montagne est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans la montagne."],
        ]
    ],

'8':
    [
        '',

        "<center><img src={{ verger }} alt='image de verger' style=\"width:400px;\" /></center><br />"

        "<p>Cette image de verger est libre de droit (merci au site BURST!). </p><br />"

        "<p>Que voulez-vous faire ?</p><br />",

        [
            ['9', "Vous voulez finalement quitter ce lieu pour aller dans un autre endroit"],

            ['10', "Vous cherchez la clé dans le verger."],
        ]
    ],

'9':
    [
        '',

        "<p>Le graphe de votre histoire, ou serious game, peut contenir des boucles. typiquement, vous "
        "vous trouvez sur une étape visitable une infinité de fois si vous ne voulez pas aller "
        "chercher la clé dans l'endroit où elle se trouve. </p><br />"

        "<p>Aussi, encore pour les fans de Python (les autres enseignants peuvent aussi demander de "
        "l'aide, c'est pas interdit), on peut facilement incrémenter un compteur ou mesurer les "
        "échecs et les réussites des utilisateurs. Celà permet, dans ces petits jeux, de calculer "
        "une note ou d'adapter un feedback adéquat vis à vis de ce que vous voulez présenter "
        "à vos élèves.<p><br />"

        "<p>Où voulez-vous aller ce coup-ci ? Pour rappel :</p><br />"

        "<center><b>La clé est dans {{ cle }}</b></center>",

        [
            ['3', "Vous vous dirigez vers la cabane", 'gagne = (cle=="la cabane")'],

            ['4', "Vous vous dirigez vers le champ", 'gagne = (cle=="le champ")'],

            ['5', "Vous vous dirigez vers la forêt", 'gagne = (cle=="la forêt")'],

            ['6', "Vous vous dirigez vers le lac", 'gagne = (cle=="le lac")'],

            ['7', "Vous vous dirigez vers la montagne", 'gagne = (cle=="la montagne")'],

            ['8', "Vous vous dirigez vers le verger", 'gagne = (cle=="le verger")'],
        ]
    ],

'10':
    [
        'grade = 100*(gagne)',

        "{% if gagne %}"

        "<center><img src={{ img_cle }} alt='image de clé' style=\"width:400px;\" /></center><br />"

        "<p>Incroyable, vous deviez être particulièrement bien renseigné ! "
        "Alors que les lieux semblait très vastes, voilà que paf, vous tombez directement sur la clé. "
        "Vraiment, bravo. Vous réussissez cette aventure qui est maintenant terminée. <p><br />"

        "{% else %}"

        "<p>Les lieux sont bien trop vaste. À force de chercher, vous perdez toute votre energie. "
        "Et puis chercher une clé, ça ne rime à rien. Bon bah ça se termine de manière triste mais "
        "est ce qu'un serious game, pour contenir un bon enjeu (voire challenge) pédagogique ne "
        "doit-il pas forcément contenir un scénario d'échec ? La question reste ouverte !<p><br />"

        "{% endif %}"

        "<p>Vous pouvez recommencer cette aventure en acutalisant la page.</p><br />"
        
        "<p>Dans cet démonstration de modèle d'exercice, la note finale calculée est <b>{{ grade }} sur "
        "100</b>.</p><br />",

        [

        ]
    ],

}

