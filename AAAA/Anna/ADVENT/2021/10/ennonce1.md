Vous demandez au sous-marin de déterminer le meilleur itinéraire pour sortir de la grotte sous-marine, mais il ne répond que :

Erreur de syntaxe dans le sous-système de navigation en ligne : tous
Tous?! Les dégâts sont pires que vous ne le pensiez. Vous affichez une copie du sous-système de navigation (votre entrée de puzzle).

La syntaxe du sous-système de navigation est composée de plusieurs lignes contenant des morceaux. Il y a un ou plusieurs morceaux sur chaque ligne, et les morceaux contiennent zéro ou plusieurs autres morceaux. Les morceaux adjacents ne sont séparés par aucun délimiteur ; si un bloc s'arrête, le bloc suivant (le cas échéant) peut démarrer immédiatement. Chaque bloc doit s'ouvrir et se fermer avec l'une des quatre paires légales de caractères correspondants :

    Si un bloc s'ouvre avec (, il doit se fermer avec ).
    Si un morceau s'ouvre avec [, il doit se fermer avec ].
    Si un bloc s'ouvre avec {, il doit se fermer avec }.
    Si un bloc s'ouvre avec <, il doit se fermer avec >.


Ainsi, () est un bloc légal qui ne contient aucun autre bloc, tout comme []. Les morceaux plus complexes mais valides incluent ([]), {()()()}, <([{}])>, [<>({}){}[([])<>]], et même (((((((((())))))))))).

Certaines lignes sont incomplètes, mais d'autres sont corrompues. Recherchez et supprimez d'abord les lignes corrompues.

Une ligne corrompue est une ligne où un bloc se ferme avec le mauvais caractère - c'est-à-dire où les caractères avec lesquels il s'ouvre et se ferme ne forment pas l'une des quatre paires légales répertoriées ci-dessus.

Des exemples de morceaux corrompus incluent (], {()()()>, (((()))} et <([]){()}[{}]). Un tel morceau peut apparaître n'importe où dans un ligne, et sa présence fait que toute la ligne est considérée comme corrompue.

Par exemple, considérez le sous-système de navigation suivant :

    [({(<(())[]>[[{[]{<()<>>
    [(()[<>])]({[<{<<[]>>(
    {([(<{}[<>[]}>{[]{[(<()>
    (((({<>}<{<{<>}{[]{[]{}
    [[<[([]))<([[{}[[()]]]
    [{[{({}]{}}([{[{{{}}([]
    {<[[]]>}<{[{[{[]{()[[[]
    [<(<(<(<{}))><([]([]()
    <{([([[(<>()){}]>(<<{{
    <{([{{}}[<[[[<>{}]]]>[]]

Certaines des lignes ne sont pas corrompues, juste incomplètes ; vous pouvez ignorer ces lignes pour l'instant. Les cinq lignes restantes sont corrompues :

    {([(<{}[<>[]}>{[]{[(<()> - Attendu ], mais trouvé } à la place.
    [[<[([]))<([[{}[[()]]] - Attendu ], mais trouvé ) à la place.
    [{[{({}]{}}([{[{{{}}([] - Attendu ), mais trouvé ] à la place.
    [<(<(<(<{}))><([]([]() - Attendu >, mais trouvé ) à la place.
    <{([([[(<>()){}]>(<<{{ - Attendu ], mais trouvé > à la place.

Arrêtez-vous au premier caractère de fermeture incorrect sur chaque ligne corrompue.

Saviez-vous que les vérificateurs de syntaxe organisent des concours pour voir qui peut obtenir le meilleur score pour les erreurs de syntaxe dans un fichier ? C'est vrai! Pour calculer le score d'erreur de syntaxe d'une ligne, prenez le premier caractère illégal de la ligne et recherchez-le dans le tableau suivant :

    ): 3points.
    ] : 57 points.
    } : 1 197 points.
    > : 25137points.


Dans l'exemple ci-dessus, un illégal ) a été trouvé deux fois (2*3 = 6 points), un illégal ] a été trouvé une fois (57 points), un illégal } a été trouvé une fois (1197 points) et un illégal > a été trouvé une fois ( 25137 points). Ainsi, le score total d'erreurs de syntaxe pour ce fichier est de 6+57+1197+25137 = 26397 points !

Trouvez le premier caractère illégal dans chaque ligne corrompue du sous-système de navigation. Quel est le score d'erreur de syntaxe total pour ces erreurs ?