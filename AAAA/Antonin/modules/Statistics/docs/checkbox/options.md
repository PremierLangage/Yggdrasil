[Options Checkbox.pl](https://pl-preprod.u-pem.fr/filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/modules/Statistics/activities/CheckboxSurvey.pl)

-  **`all_possibilities`** : `Boolean`   -   Défaut: `False`

    - Les graphes doivent-ils contenir toutes les combinaisons possibles (non recommandé si plus de 4 choix possibles)

    Exemple:

    - ```unique_choice = True```

- **`graph_horizontal_X`** : `Int`   -   Défaut: `0`

    - Le graphe de la question **`X`** doit-il être affiché avec des barres horizontales

    Exemple:

    `question_test= ma question`

    `items_test==`

    `unique choix`

    `==`

    `graph_horizontal_test = 1`

- **`graph_combinations_X`** : `Int`   -   Défaut: `0`

    - Les données de la question **`X`** doivent-elles êtres affichées sous format de combinaisons dans un autre graphe en plus de l'original?

    Exemple:

    `question_test= ma question`

    `items_test==`

    `unique choix`

    `==`

    `graph_combinations_test = 1`

[Options stats.pl](https://pl-preprod.u-pem.fr/filebrowser/option?name=test_pl&path=Yggdrasil/AAAA/Antonin/modules/Statistics/stats.pl)

-  **`include_stats_score`** : `Boolean`   -   Défaut: `False`

    - Afficher le graphe représentant le score des utilisateurs

    Exemple:

    - ```include_stats_score = True```

-  **`include_stats_participation`** : `Boolean`   -   Défaut: `False`

    - Afficher le graphe représentant le taux de participation des utilisateurs

    Exemple:

    - ```include_stats_participation = True```
