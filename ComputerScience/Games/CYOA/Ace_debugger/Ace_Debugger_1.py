# ****************************************************************************
#    Copyright (C) 2020 Nicolas Borie <nicolas.borie at univ-eiffel dot fr>
#
#          Distributed under the terms of the CC-BY-SA 4.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#    The full text of the CC-BY-SA 4.0 is available at:
#
#          https://creativecommons.org/licenses/by-sa/4.0/legalcode
# ****************************************************************************

{

# L'étape 0 n'existera jamais, le template commencera de manière harcodé à l'étape '1'    
    
# '0' :
#     [
#         'code python qui sera eval(...) à chaque entrée sur cette
#         étape 0',

#         "Texte de l'étape qui sera affiché à l'ecran et contextuelle
#         de la situation de l'histoire, de l'exercice",

#         [
#             ['X', "texte du lien pour aller vers l'étape X"],
#             ['Y', "texte du lien pour aller vers l'étape Y"]
#         ]
#     ],

'1' :
    [
        'audace=0;panache=0;confiance=0',
     
        "<center><img src={{ img1 }} alt='IMAGE_Ace_Debugger_logo' style=\"width:400px;\" /></center>"

        "<p>Bienvenue dans la première aventure de Ace debugger, le prof "
        "de TP qui trouve les erreurs plus vite que son ombre. Vos "
        "compétences en informatique sont maintenant tellement "
        "reconnues que vous allez devoir guider l'Ace debugger "
        "durant les TP d'informatique. Cette première "
        "aventure vous emmenera en salle 104 du batiment Clément Ader "
        "pour un TP sur les tris en C. </p><br />"

        "<p>En incarnant Nicolas Borie, à chaque événement, vous devrez "
        "prendre les meilleurs décisions pour aider les élèves. </p><br />",

        [
            ['2', "Entrer dans la salle de TP!"]
        ]
    ],
    
'2' :
    [
        '',

        "<p>Vous entrez dans la salle de TP et vous voyez déjà une "
        "vingtaine d'étudiants assis derrière les postes sur les deux "
        "rangées de bureau. Certains jouent encore sur leurs téléphones "
        "mais d'autres sont déjå au travail avec l'énoncé en pdf ouvert "
        "sur leur poste. </p><br />"

        "<p>A peine entré, vous croisez le regard d'un élève qui lève "
        "instantannément le bras en l'air. C'est Yves Vatrovytch qui "
        "fait mine de vous appeler. Avec ces fameuses questions qui "
        "sont toujours toutes plus tordues les unes que les autres, "
        "quelle colle va-t-il bien pour poser ce coup-ci ? </p><br />",

        [
            ['3', "Vous vous approchez de l'élève"]
        ]
    ],

'3' :
    [
        '',

        "<p><b>Yves :</b> Bonjour monsieur, j'ai un bug incroyable parce que "
        "c'est pas un bug.</p> <br />"

        "<p><b>N.B. :</b> Vous savez, la plupart du temps, soit il y a un bug ou "
        "plusieurs soit il n'y a pas de bug dans les programmes.</p> <br />"
        
        "<p><b>Yves :</b> Ah ouais mais là c'est différent m'sieur ! J'ai un tri "
        "à bulle qui fonctionne, mais parfois il affiche des trucs "
        "bizarres, mais il marche aussi vachement souvent. Regardez mes "
        "tests en terminal. </p> <br />"

        "<div style=\"background-color:black;padding:5px\" ><code style=\"color:white;\">"
        "**yvatrovyt@p12-104:~/C/TP4$** gcc -o plop tribul.c <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "70 73 99 16 54 60 50 25 12 76 89 18 79 90 89 31 23 25 99 0 <br />"
        "-846772480 0 12 16 18 23 25 25 31 50 54 60 70 73 76 79 89 89 90 99 <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "86 38 64 44 59 97 71 26 95 11 13 43 42 57 15 8 76 24 76 92 <br />"
        "8 11 13 15 24 26 38 42 43 44 57 59 64 71 76 76 86 92 95 97 <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "71 9 43 24 9 57 66 85 26 82 2 57 74 24 33 25 13 40 37 54 <br />"
        "-1162119008 2 9 9 13 24 24 25 26 33 37 40 43 54 57 57 66 71 74 82 <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "64 74 87 32 49 73 59 67 65 1 61 34 73 16 44 3 38 93 65 65 <br />"
        "-552418144 1 3 16 32 34 38 44 49 59 61 64 65 65 65 67 73 73 74 87 <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "5 35 89 97 13 89 67 16 29 18 37 73 59 22 23 54 89 70 3 83 <br />"
        "3 5 13 16 18 22 23 29 35 37 54 59 67 70 73 83 89 89 89 97 <br />"
        "</code></div> <br />",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."]
        ]
    ],

'4' :
    [
        '',

        "<p><b>N.B. :</b> Toute variable C possède 4 caractéristiques : un "
        "identificateur, un type, un emplacement mémoire et de ce fait "
        "une valeur. Comme l'emplacement mémoire existe, il y a des "
        "bits qui valent 0 ou 1 à la création de toute variable. Ces "
        "valeurs, que votre terminal affiche, semblent être presque "
        "aléatoires comme des bits qui traineraient dans votre "
        "programme venant de variables que vous auriez oublié "
        "d'initialiser.</p> <br />"

        "<p><b>Yves :</b> Je vous assure que j'ai bien tout initialisé "
        "monsieur. Le problème ne doit pas venir de là, je construis un "
        "tableau aléatoire au debut de mon main. </p> <br />",
        
        [
            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'5' :
    [
        'audace+=1;confiance-=2',

        "<p><b>N.B. :</b> Non mais le principal, c'est que ça fonctionne bien de "
        "temps en temps. Si vous avez compris et que le tri est correct "
        "environs une fois sur deux... </p> <br />"

        "<p><b>Yves :</b> Mais.... mais... mais monsieur, enfin ! Vous êtes sûr ? "
        "Et les avions, les centrales nucléaires... Le principal, c'est "
        "aussi que ça fonctionne bien de temps en temps. Monsieur "
        "Zipstein nous a demandé en soutenance de projet, l'année "
        "dernière, si on accepterait de monter dans un avion mais qui "
        "fonctionne bien une fois sur deux. Finalement, on lui a dit "
        "qu'on partirait en vacances un peu moins loin. Vraiment, "
        "monsieur Borie, vous le Ace debugger, je suis très déçu de "
        "vous. </p> <br />"

        "<p><b>N.B. *(très géné)* :</b> On peut être le Ace debugger est faire un "
        "peu d'humour... Ça ne fait de mal à personne de rire 5 "
        "secondes. Bon, j'ai effectivement un peu besoin de "
        "vacances. Revenons à votre tri qui affiche une valeur bizarre "
        "de temps en temps. </p> <br />",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'6' :
    [
        '',

        "<p>L'élève acquiesce et se met tout de suite à la tâche. </p> <br />"

        "<p><b>Yves :</b> Si vous voullez... voici ce que j'obtiens. </p> <br />"

        "<div style=\"background-color:black;padding:5px\" ><code style=\"color:white;\">"
        "**yvatrovyt@p12-104:~/C/TP4$** gcc -o plop code.c -Wall -ansi <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "32 3 92 32 72 61 48 68 82 94 39 34 1 43 73 73 87 61 4 23 <br />"
        "1 3 4 23 32 32 34 39 43 48 61 61 68 72 73 73 82 87 92 94 <br />"
        "**yvatrovyt@p12-104:~/C/TP4$** ./plop <br />"
        "46 6 24 6 63 80 57 21 88 30 27 34 13 3 25 21 28 75 20 20 <br />"
        "-1413911584 3 6 6 13 20 20 21 21 24 25 27 28 30 34 46 57 63 75 80 <br />"
        "</code></div> <br />"

        "<p><b>Yves :</b> Ça ne donne rien de plus et puis le bug est toujours là"
        "on dirait, mais pas à chaque fois. Bizarre quand même ! </p> <br />",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],
    
'7' :
    [
        '',

        "<p><b>Yves :</b> Voici le haut de mon fichier monsieur. </p> <br />"

        "<pre>"
        "#include &lt;stdio.h&gt; <br />"
        "#include &lt;stdlib.h&gt; <br />"
        "#include &lt;time.h&gt; <br />"
        "#define TAILLE 20 <br />"
        "#define MAX 100 <br /> <br />"
        
        "void affichetab(int tab[], int taille){ <br />"
        "  int i; <br /><br />"

        "  for(i=0 ;i&lt;taille;i++) <br />"
        "    printf(\"%d \", tab[i]); <br />"
        " putchar('\\n'); <br />"
        "} "
        "</pre>"

        "<p><b>Yves :</b> La macro TAILLE, c'est pour la taille du tableau dans "
        "le test fait dans mon main. La macro MAX, c'est pour "
        "determiner des entrées aléatoires dans le tableau, je vais un "
        "modulo MAX monsieur. Franchement, je ne vois pas de problème "
        "là dedans. </p> <br />",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],
    
'8' :
    [
        '',

        "<p><b>Yves :</b> Ça, c'est mon tri à bulles. Double boucles for "
        "imbriquées exactement comme dans le cours monsieur !</p> <br />"

        "<pre>"
        "void tribulle(int* T, int taille){ <br />"
        "  int i,j; <br />"
        "  int tmp; <br /><br />"
        
        "for(i=0;i&lt;taille;i++){<br />"
        "  for(j=0;j&lt;taille-i;j++){<br />"
        "          if(T[j+1] &lt; T[j]){<br />"
	    "      tmp = T[j];<br />"
	    "      T[j] = T[j+1];<br />"
	    "      T[j+1] = tmp;<br />"
        "          }<br />"
        "  }<br />"
        " }<br />"
        "}"
        "</pre>",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],
            
            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'9' :
    [
        '',

        "<p><b>Yves :</b> Voici mon main monsieur. </p> <br />"

        "<pre>"
        "int main(){ <br />"
        "  int tab[TAILLE]; <br />"
        "  int i; <br /><br />"
        
        "  srand(time(NULL)); /* Le prof a dit de coller ca... */ <br />"
        
        "  for (i=0 ; i&lt;TAILLE;i++) <br />"
        "    tab[i]=rand()%MAX; <br /><br />"

        "affichetab(tab, TAILLE); <br />"
        "  tribulle(tab, TAILLE); <br />"
        "affichetab(tab, TAILLE); <br /><br />"
        
        "  return 0; <br />"
        "}"
        "</pre>",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'10' :
    [
        '',

        "<center><b>N.B. :</b> J'ai trouvé où se situe le bug !</center> <br /><br />"
        
        "<center><img src={{ img2 }} alt='IMAGE_Ace_Debugger_find_bug' style=\"width:400px;\" /></center><br />"
        
        "<p><b>Yves :</b> L'Ace debugger a encore frappé, nous allons avoir le fin mot de cette histoire. </p> <br />"
        
        "<p><b>N.B. (la pression monte...):</b> Calmez-vous, je vais juste vous indiquer où "
        "je pense qu'est située l'erreur, rien de plus...</p> <br />"
        
        "<p><b>Yves :</b> Vous êtes vraiment trop fort m'sieur. </p> <br />"

        "<p><b>N.B. (avec une goutte de sueur):</b> Alors, je pense qu'une erreur s'est glissé </p> <br />"
        ,

        [
            ['11', "dans le haut de votre fichier source (entête et affichage)."],

            ['12', "dans votre fonction qui opère le tri à bulles."],

            ['13', "dans le bas de votre fichier source (fonction main)."]
        ]
    ],

'11':
    [
        '',

        "<p><b>Yves :</b> Ah ouais, et elle est où l'erreur ? </p> <br />"

        "<pre>"
        "#include &lt;stdio.h&gt; <br />"
        "#include &lt;stdlib.h&gt; <br />"
        "#include &lt;time.h&gt; <br />"
        "#define TAILLE 20 <br />"
        "#define MAX 100 <br /> <br />"
        
        "void affichetab(int tab[], int taille){ <br />"
        "  int i; <br /><br />"

        "  for(i=0 ;i&lt;taille;i++) <br />"
        "    printf(\"%d \", tab[i]); <br />"
        " putchar('\\n'); <br />"
        "} "
        "</pre>"
        ,

        [
            ['14', "Il y a une erreur dans les macros préprocesseur !", 'confiance-=1'],

            ['15', "Il y a une erreur est dans la fonction d'affichage !", 'confiance-=1'],

            ['16', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait..."]
        ]
    ],

'12':
    [
        '',

        "<p><b>Yves :</b> Mon tri à bulles, c'est celui du cours... Elle est où l'erreur ? </p> <br />"

        "<pre>"
        "void tribulle(int* T, int taille){ <br />"
        "  int i,j; <br />"
        "  int tmp; <br /><br />"
        
        "for(i=0;i&lt;taille;i++){<br />"
        "  for(j=0;j&lt;taille-i;j++){<br />"
        "          if(T[j+1] &lt; T[j]){<br />"
	    "      tmp = T[j];<br />"
	    "      T[j] = T[j+1];<br />"
	    "      T[j+1] = tmp;<br />"
        "          }<br />"
        "  }<br />"
        " }<br />"
        "}"
        "</pre>",

        [
            ['17', "Il y a une erreur dans la partie qui échange les deux valeurs.", 'confiance-=1'],

            ['18', "Il y a une erreur dans les bornes des boucles."],

            ['19', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait...", 'confiance-=1']
        ]
    ]

'13':
    [
        '',

        "<p><b>Yves :</b> Voici mon main monsieur. </p> <br />"

        "<pre>"
        "int main(){ <br />"
        "  int tab[TAILLE]; <br />"
        "  int i; <br /><br />"
        
        "  srand(time(NULL)); /* Le prof a dit de coller ca... */ <br />"
        
        "  for (i=0 ; i&lt;TAILLE;i++) <br />"
        "    tab[i]=rand()%MAX; <br /><br />"

        "affichetab(tab, TAILLE); <br />"
        "  tribulle(tab, TAILLE); <br />"
        "affichetab(tab, TAILLE); <br /><br />"
        
        "  return 0; <br />"
        "}"
        "</pre>"
        ,

        [
            ['20', "La mémoire de votre tableau <code>tab</code> n'est pas géré correctement.", 'confiance-=1'],

            ['21', "Votre tableau <code>tab</code> n'est pas initialisé correctement.", 'confiance-=1'],

            ['22', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait..."]
        ]
    ]
}





