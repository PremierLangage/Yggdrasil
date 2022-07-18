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
        'audace=0;panache=0;confiance=10;disallow=[]',
     
        "<center><img src={{ img1 }} alt='IMAGE_Ace_Debugger_logo' style=\"width:400px;\" /></center>"

        "<p>Bienvenue dans la première aventure de Ace debugger, le prof "
        "de TP qui trouve les erreurs plus vite que son ombre.</p><br /><p>Vos "
        "compétences en informatique sont maintenant tellement "
        "reconnues que vous allez devoir guider l'Ace debugger "
        "durant les TP d'informatique. Cette première "
        "aventure vous emmenera en salle 104 du batiment Clément Ader "
        "pour un TP sur les tris en C. </p><br />"

        "<p>En incarnant l'Ace debugger, vous devrez, à chaque événement, "
        "prendre les meilleures décisions pour aider les élèves. </p><br />",

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
        "mais d'autres sont déjà au travail avec l'énoncé en pdf ouvert "
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
        'disallow.append("4")',

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
        'audace+=1;confiance-=3;disallow.append("5")',

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
        'disallow.append("6")',

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

        "<p><b>Yves :</b> Ça ne donne rien de plus et puis le bug est toujours là "
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
        'audace+=1',

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
            ['14', "Il y a une erreur dans les macros préprocesseur !"],

            ['15', "Il y a une erreur dans la fonction d'affichage !"],

            ['16', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait...", "audace-=1"]
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
            ['17', "Il y a une erreur dans la partie qui échange les deux valeurs."],

            ['18', "Il y a une erreur dans les bornes des boucles."],

            ['16', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait...", 'confiance-=1']
        ]
    ],

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
            ['19', "La mémoire de votre tableau <code>tab</code> n'est pas géré correctement." ],

            ['20', "Votre tableau <code>tab</code> n'est pas initialisé correctement." ],

            ['16', "Euh... J'ai dû me tromper car cela m'a l'air correct en fait...", "audace-=1"]
        ]
    ],

'14':
    [
        'disallow.append("14");confiance-=1',
        
        "<pre>"
        "#include &lt;stdio.h&gt; <br />"
        "#include &lt;stdlib.h&gt; <br />"
        "#include &lt;time.h&gt; <br />"
        "#define TAILLE 20 <br />"
        "#define MAX 100 <br /> <br />"
        "</pre>"
        
        "<p><b>Yves :</b> Alors j'utilise les entrées/sorties standards pour les affichages. J'utilise "
        "la libraire standard pour générer aléatoirement les nombres. La librairie time, c'est pour "
        " initialiser la graine de génération ou je ne sais quoi, mais c'était marqué dans l'énoncé."
        " </p> <br />"
         
         "<p><b>Yves :</b> Les deux autres directives sont justes des déclarations de constantes. "
         "Ça ne peut pas bugger de juste définir des constantes nan ?</p> <br />"
         
         "<p><b>N.B. :</b> Effectivement, il ne peut y avoir d'erreur dans tout cela...</p> <br />"
         ,

         [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],

            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
         ]
    ],

'15':
    [ 
        'disallow.append("15");confiance-=1',
        
        "<pre>"
        "void affichetab(int tab[], int taille){ <br />"
        "  int i; <br /><br />"

        "  for(i=0 ;i&lt;taille;i++) <br />"
        "    printf(\"%d \", tab[i]); <br />"
        " putchar('\\n'); <br />"
        "} "
        "</pre>"

        "<p><b>Yves :</b> C'est pas très joli car je ne mets pas de séparateur, ni parenthèse ou "
        "crochet. Mais je ne vois vraiment pas de problème dans ma fonction d'affichage. C'est "
        "juste un parcours de l'index zéro à l'index taille moins un inclus.</p> <br />"

        "<p><b>N.B. :</b> Effectivement, il n'y a pas d'erreur dans cela...</p> <br />"
        ,

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],
            
            ['9', "Demander à voir le main du programme d'Yves."],

            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'16':
    [
        '',

        "<p><b>Yves :</b> Vous avez vu, il est pénible mon bug. J'ai tout fait comme il faut.</p> <br />"

        "<p><b>N.B. :</b> Aussi cachée soit-elle, il y a forcement une erreur qui s'est glissée "
        "quelque part. Pas d'inquiétude, on va finir pas la trouver.</p> <br />"

        "<p><b>Yves (rêvant):</b> Mais quelle sérénitée dont fait preuve le Ace Debugger !</p> <br />"
        ,

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],

            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'17':
    [
        'disallow.append("17");confiance-=1',

        "<pre>"
        "          if(T[j+1] &lt; T[j]){<br />"
	    "      tmp = T[j];<br />"
	    "      T[j] = T[j+1];<br />"
	    "      T[j+1] = tmp;<br />"
        "          }<br />"
        "</pre>"

        "<p><b>Yves :</b> Une variable temporaire pour stockée la première des deux valeurs écrasées. "
        " C'est toujours comme cela qu'on fait...</p> <br />"

        "<p><b>N.B. :</b> En effet, je vois le mal là où il n'est pas...</p> <br />",

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],

            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'18':
    [
        '',
        
        "<p><b>N.B. :</b> Il y a une erreur dans les bornes des boucles! </p><br />"

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
            ['21', "Le tri monte un cran trop loin et trie une valeur en trop."],

            ['22', "Le tri à bulles est bien correct, le bug n'est pas là.", "confiance-=2"],

            ['23', "Avec un tableau d'entiers non signés, vous n'auriez peut-être jamais vu votre bug.", "panache+=1"],

            ['24', "Ce tri ne fait pas monter des bulles mais descendrent des cailloux."]
        ]
    ],

'19':
    [
        'disallow.append("19");confiance-=1',

        "<p><b>Yves :</b> Mais monsieur, avec une macro définissant une constante, la mémoire de "
        "mon tableau est "
        "statique. Ce n'est pas moi qui la gère, c'est le programme. Mon tableau tab est une "
        "variable locale de mon main. Tout est géré automatiquement.</p> <br />"

        "<pre>"
        "int main(){ <br />"
        "  int tab[TAILLE]; <br />"
        "  ...<br />"
        "}"
        "</pre>"

        "<p><b>N.B. :</b> En effet, je vois le mal là où il n'est pas...</p> <br />"
        ,

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],

            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'20':
    [
        'disallow.append("20");confiance-=1',

        "<p><b>Yves :</b> Mon tableau <code>tab</code> est de taille <code>TAILLE</code> je l'inititalise du "
        "crochet zéro au crochet TAILLE moins 1 inclus avec des entiers aléatoires compris entre 0 et MAX. "
        "C'est pas safe ça monsieur ?</p><br />"
        
        "<pre>"
        "int main(){ <br />"
        "  int tab[TAILLE]; <br />"
        "  int i; <br /><br />"
        
        "  srand(time(NULL)); /* Le prof a dit de coller ca... */ <br />"
        
        "  for (i=0 ; i&lt;TAILLE;i++) <br />"
        "    tab[i]=rand()%MAX; <br /><br />"

        "...<br />"
        "}"
        "</pre>"

        "<p><b>N.B. :</b> En effet, votre tableau est correctement initialisé, je me suis trompé.</p> <br />"
        ,

        [
            ['4', "Rappeler à Yves ce que sont les garbages values."],

            ['5', "Expliquer que si ça marche souvent, et bien ça suffit."],

            ['6', "Demander à Yves de recompiler devant vos yeux ébahis avec les options Wall et ansi."],

            ['7', "Demander à voir le début du fichier de code avec les macros et la fonction d'affichage."],

            ['8', "Demander à voir la fonction opérant le tri à bulles."],

            ['9', "Demander à voir le main du programme d'Yves."],
            
            ['10', "Annoncer que vous pensez savoir où se trouve le bug."],
        ]
    ],

'21':
    [
        '',

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
        "</pre>"

        "<p><b>N.B. :</b> Le tri monte un cran trop loin et trie une valeur en trop. En effet, lors du "
        "premier tour du premier for, i vaut zéro. De ce fait, dans le second for, j va de zéro inclus "
        "à taille exclus. Si j monte à taille - 1 inclus alors j + 1 vaut taille et faire un crochet taille, c'est "
        "travailler sur une valeur trop loin.</p> <br />"
        
        "<p><b>N.B. :</b> En commençant un cran plus loin avec i égal à un au lieu de zéro, la première "
        "bulle devrait monter un cran moins haut et ça devrait fixer le problème."
        ,

        [
            ['25', "Appliquer le correctif proposé."]
        ]
    ],

'22':
    [ 
        'disallow.append("24");disallow.append("22");confiance-=1',

        "<p><b>N.B. :</b> Votre tri à bulles est bien correct, le bug n'est pas là.</p> <br />"
        
        "<p><b>Yves :</b> Attendez, si, il y a bien un problème. Regardez, c'est à cause de la "
        "première bulle... Je crois que quand i vaut 0, le j+1 est peut être trop grand ? </p><br />"
        
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
        "</pre><br />"
        ,

        [
            ['21', "Le tri monte un cran trop loin et trie une valeur en trop."],

            ['23', "Avec un tableau d'entiers non signés, vous n'auriez peut-être jamais vu votre bug.", "panache+=1"],
        ]
    ],

'23':
    [
        'panache+=1',

        "<p><b>N.B. :</b> Avec un tableau d'entiers non signés, vous n'auriez peut-être jamais vu votre bug."
        "</p><br />"
        
        "<p><b>Yves :</b> Je ne comprends pas, le fait que mon tableau soit un <code>int*</code> est important ?"
        "</p><br />"

        "<p><b>N.B. :</b> Tout à fait ! Votre tri monte un cran trop loin. De ce fait, vous triez une valeur en "
        "trop qui est non initialisée et donc une garbage value. Cette valeur non initialisée est un "
        "<code>int</code> et comme elle est aléatoire sur un type signée, il y a une chance sur deux qu'elle "
        "soit négative et une chance sur deux qu'elle soit positive. Lorsque la valeur en trop est négative, "
        "votre tri à bulle la place en tête et on voit le bug (c'est l'ordre croissant). Si la valeur en trop "
        "est positive, alors c'est un nombre aléatoire entre 0 et 2 milliards et des brouettes. Comme on a toutes "
        "les chances que le nombre soit plus grand que votre MAX, le bug existe mais est silencieux. "
        "</p><br />"

        "<p><b>Yves :</b> Purée mais c'est pour cela que ça affichait en tête une grosse valeur négative une fois "
        "sur deux ! Incroyable ! Il faut juste supprimer la première bulle ou la monter un cran moins haut..."
        "</p><br />"
        ,

        [
            ['25', "Appliquer le correctif proposé." ]
        ]
    ],

'24':
    [ 
        'disallow.append("24");confiance-=2',

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
        "</pre>"

        "<p><b>Yves :</b> Quoi ? Qu'est ce que c'est que ces cailloux ? Mon second for sur j "
        "commence à zéro et va en sens croissant, si les crochet j et j+1 sont mal triés, "
        "alors je les échange. C'est faire monter une bulle ça!</p> <br />"

        "<p><b>N.B. :</b> Ah euh, oui oui, j'ai mal lu...</p> <br />",

        [
            ['21', "Le tri monte un cran trop loin et trie une valeur en trop."],

            ['22', "Le tri à bulles est bien correct, le bug n'est pas là.", "confiance-=2"],

            ['23', "Avec un tableau d'entiers non signés, vous n'auriez peut-être jamais vu votre bug."],
        ]
    ],

'25':
    [
        'grade=100',
 
        "<p><b>Yves :</b> Oh merci, ça fonctionne bien maitenant et dans tous les cas en plus ! Quel flair "
        "de chien truffier vous avez monsieur le Ace Debugger.</p> <br />"

        "<p><b>N.B. :</b> Je ne sais pas si c'est un compliment Yves, mais je suis content qu'on est "
        "trouvé cette erreur discrète dans votre code. N'oubliez pas de compiler régulièrement et de "
        "ne pas aller trop vite Yves !</p> <br />"

        "<center><b>.: Fin de l'aventure :.</b></center><br />"

        "<u><b>Points de confiance :</b></u> {{ confiance }} sur 10<br />"

        "<u><b>Points d'audace (tête brulée) :</b></u> +{{ audace }}<br />"

        "<u><b>Points de panache (avec style) :</b></u> +{{ panache }}<br /><br />"
        
        "<u><b>Nombre d'étapes traversées :</b></u> +{{ nb_total_step }}<br />"
        
        "<u><b>Efficacité :</b></u> {{ Math.round(100 - ( (100*(nb_total_step-8)) /(nb_total_step) )) }} sur 100<br />",

        [
        ]
    ]
}









