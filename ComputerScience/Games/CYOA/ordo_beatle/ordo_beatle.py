{
'1':
    [
        'time_tot=0',

        "<p>Les quatre compères John, Paul, George et Ringo se trouvent au bord d'une rivière. "
        "Il y a seulement une petite barque à deux places pour traverser cette rivière. "
        "John, grand marin dans l'âme, peut traverser la rivière avec la barque en 1 minute. "
        "Pour Paul, qui est lui aussi rapide, c'est quand même un peu trop vite 1 minute, il "
        "peut traverser sans "
        "emcombre en 2 minutes. George n'aime pas l'eau et il lui faut 5 minutes pour traverser. "
        "Enfin Ringo, qui est toujours malade en bateau, a besoin de 10 minutes pour pouvoir "
        "traverser. </p> <br />"

        "<p>Alors la barque ne peut pas voyager seule (et puis il n'y a pas de corde dans le coin...). "
        "Les quatre compères vont devoir organiser de nombreuses traversées à une ou deux personnes "
        "pour pouvoir traverser tous les quatres. Quand ils sont deux dans la barque, la barque va à "
        "vitesse la plus lente pour ne pas brusquer ses fragiles occupants.</p>  <br />"

        "<p>Aider les quatre compères pour les faire traverser au plus vite.</p>  <br />"
        ,

        [
            ['JP', "Envoyer les deux plus rapides John(1) et Paul(2).", 'time_tot += 2'],

            ['GR', "Envoyer les deux plus lents George(5) et Ringo(10).", 'time_tot += 10'],

            ['JR', "Envoyer le plus rapide John(1) avec le plus lent Ringo(10).", 'time_tot += 10'],

            ['PG', "Envoyer les deux moyens ensembles Paul(2) et George(5).", 'time_tot += 5']
        ]
    ],

'JP':
    [
        '',
        
        "Mais maintenant, la barque est de l'autre... Il faut la ranemer pour aller "
        "chercher les deux autres. "
        ,

        [
            ['BJ', "Paul(2) ramène la barque.", 'time_tot += 2'],

            ['BP', "John(1) ramène la barque.", 'time_tot += 1']
        ]
    ],

'GR':
    [
        '',

        "Mais maintenant, la barque est de l'autre... Il faut la ranemer pour aller "
        "chercher les deux autres. "
        ,
        
        [
            ['BR', "George(5) ramène la barque.", 'time_tot += 5'],

            ['BG', "Ringo(10) ramène la barque.", 'time_tot += 10']
        ]
    ],

'JR':
    [
        '',

        "Mais maintenant, la barque est de l'autre... Il faut la ranemer pour aller "
        "chercher les deux autres. "
        ,
        
        [
            ['BR', "John(1) ramène la barque.", 'time_tot += 1'],

            ['BG', "Ringo(10) ramène la barque.", 'time_tot += 10']
        ]
    ],

'PG':
    [
        '',

        "Mais maintenant, la barque est de l'autre... Il faut la ranemer pour aller "
        "chercher les deux autres. "
        ,
        
        [
            ['BG', "Paul(2) ramène la barque.", 'time_tot += 2'],

            ['BP', "George(5) ramène la barque.", 'time_tot += 5']
        ]
    ],

'BJ':
    [
        '',

        ""
        ,
        [

        ]
    ],

'BP':
    [
        '',

        ""
        ,
        [

        ]
    ],

'BG':
    [
        '',

        ""
        ,
        [

        ]
    ],

'BR':
    [
        '',

        ""
        ,
        [

        ]
    ]

}

