** BRAVO VOUS ETES A LA DEUXIEME PARTIE**


--- Deuxième Partie ---

Maintenant, jetez les lignes corrompues. Les lignes restantes sont incomplètes.

Les lignes incomplètes n'ont pas de caractères incorrects - à la place, il leur manque des caractères de fermeture à la fin de la ligne. Pour réparer le sous-système de navigation, il vous suffit de comprendre la séquence de caractères de fermeture qui complètent tous les morceaux ouverts de la ligne.

Vous ne pouvez utiliser que des caractères de fermeture (), ], } ou >), et vous devez les ajouter dans le bon ordre afin que seules des paires légales soient formées et que tous les morceaux soient fermés.

Dans l'exemple ci-dessus, il y a cinq lignes incomplètes :

    [({(<(())[]>[[{[]{<()<>> - Complétez en ajoutant }}]])})].
    [(()[<>])]({[<{<<[]>>( - Complétez en ajoutant )}>]}).
    (((({<>}<{<{<>}{[]{[]{} - Complétez en ajoutant }}>}>)))).
    {<[[]]>}<{[{[{[]{()[[[] - Complétez en ajoutant ]]}}]}]}>.
    <{([{{}}[<[[[<>{}]]]>[]] - Complétez en ajoutant ])}>.

Saviez-vous que les outils de saisie semi-automatique proposent également des concours ? C'est vrai! Le score est déterminé en considérant la chaîne d'achèvement caractère par caractère. Commencez avec un score total de 0. Ensuite, pour chaque personnage, multipliez le score total par 5, puis augmentez le score total par la valeur en points donnée pour le personnage dans le tableau suivant :

    ): 1 point.
    ] : 2 points.
    } : 3 points.
    > : 4 points.

Ainsi, la dernière chaîne de complétion ci-dessus - ])}> - serait notée comme suit :

Commencez avec un score total de 0.
Multipliez le score total par 5 pour obtenir 0, puis ajoutez la valeur de ] (2) pour obtenir un nouveau score total de 2.
Multipliez le score total par 5 pour obtenir 10, puis ajoutez la valeur de ) (1) pour obtenir un nouveau score total de 11.
Multipliez le score total par 5 pour obtenir 55, puis ajoutez la valeur de } (3) pour obtenir un nouveau score total de 58.
Multipliez le score total par 5 pour obtenir 290, puis ajoutez la valeur > (4) pour obtenir un nouveau score total de 294.
Les chaînes d'achèvement des cinq lignes ont des scores totaux comme suit :

    }}]])})] - 288957 points au total.
    )}>]}) - 5566 points au total.
    }}>}>)))) - 1480781 points au total.
    ]]}}]}]}> - 995444 points au total.
    ])}> - 294 points au total.

Les outils de saisie semi-automatique sont un groupe étrange : le gagnant est trouvé en triant tous les scores, puis en prenant le score du milieu. (Il y aura toujours un nombre impair de scores à prendre en compte.) Dans cet exemple, le score du milieu est 288957 car il y a le même nombre de scores plus petits et plus grands que lui.

Trouvez la chaîne d'achèvement pour chaque ligne incomplète, notez les chaînes d'achèvement et triez les scores. Quel est le score moyen ?