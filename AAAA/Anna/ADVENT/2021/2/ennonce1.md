Maintenant, vous devez comprendre comment piloter cette chose.

Il semble que le sous-marin puisse prendre une série de commandes comme vers l'avant 1, vers le bas 2 ou vers le haut 3 :

    - vers l'avant X augmente la position horizontale de X unités.
    - vers le bas X augmente la profondeur de X unités.
    - vers le haut X diminue la profondeur de X unités.

Notez que puisque vous êtes sur un sous-marin, le bas et le haut affectent votre profondeur, et ils ont donc le résultat opposé à ce à quoi vous pourriez vous attendre.

Le sous-marin semble déjà avoir un parcours planifié (votre entrée de puzzle). Vous devriez probablement comprendre où ça va. Par exemple:

    vers l'avant 5
    vers le bas 5
    vers l'avant 8
    vers le haut 3
    vers le bas 8
    vers l'avant 2

Votre position horizontale et votre profondeur commencent toutes deux à 0. Les étapes ci-dessus les modifieraient alors comme suit :

    - vers l'avant 5 ajoute 5 à votre position horizontale, un total de 5.
    - vers le bas 5 ajoute 5 à votre profondeur, ce qui donne une valeur de 5.
    - vers l'avant 8 ajoute 8 à votre position horizontale, un total de 13.
    - vers le haut 3 diminue votre profondeur de 3, ce qui donne une valeur de 2.
    - vers le bas 8 ajoute 8 à votre profondeur, ce qui donne une valeur de 10.
    - vers l'avant 2 ajoute 2 à votre position horizontale, soit un total de 15.

Après avoir suivi ces instructions, vous auriez une position horizontale de 15 et une profondeur de 10. (En les multipliant, vous obtenez 150.)

Calculez la position horizontale et la profondeur que vous auriez après avoir suivi le parcours prévu. Qu'obtenez-vous si vous multipliez votre position horizontale finale par votre profondeur finale ?s
