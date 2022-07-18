

# Mots Méchants Mots Gentils.

Le Père Noël a besoin d'aide pour déterminer quelles chaînes de son fichier texte sont méchantes ou gentilles.

Une chaîne gentille est une chaîne avec toutes les propriétés suivantes :

     Il contient au moins trois voyelles (aeiou uniquement), comme aei, xazegov ou aeiouaeiouaeiou.
     Il contient au moins une lettre qui apparait deux fois de suite, comme xx, abcdde (dd) ou aabbccdd (aa, bb, cc ou dd).
     Il ne contient pas les chaînes ab, cd, pq ou xy, même si elles font partie de l'une des autres exigences.

Par example:

     ugknbfddgicrmopn est agréable car il a au moins trois voyelles (u...i...o...), une lettre double (...dd...), et aucune des sous-chaînes interdites.
     aaa est agréable car il a au moins trois voyelles et une lettre double, même si les lettres utilisées par différentes règles se chevauchent.
     jchzalrnumimmnmhp est méchant car il n`a pas de double lettre.
     haegwjzuvuyypxyu est méchant car il contient la chaîne xy.
     dvszwmarrgswjxmb est méchant car il ne contient qu`une seule voyelle. 

Ecrire une fonction Question1() qui lit dans le fichier "data" et compte et retourne le nombre de chaines (une par ligne) gentilles.


Réalisant l'erreur de ses manières, le Père Noël est passé à un meilleur modèle pour déterminer si une chaîne est méchante ou gentille. Aucune des anciennes règles ne s'applique, car elles sont toutes clairement ridicules.

Maintenant, une belle chaîne est une chaîne avec toutes les propriétés suivantes :

    Il contient une paire de deux lettres quelconques qui apparaissent au moins deux fois dans la chaîne sans se chevaucher,
     comme xyxy (xy) ou aabcdefgaa (aa), mais pas comme aaa (aa, mais ça se chevauche).
    Il contient au moins une lettre qui se répète avec exactement une lettre entre elles, comme xyx, abcdefeghi (efe), ou même aaa.

Par example:

    qjhvhtzxzqqjkmpb est sympa car il a une paire qui apparaît deux fois (qj) et une lettre qui se répète avec exactement une lettre entre elles (zxz).
    xxyxx est agréable car il a une paire qui apparaît deux fois et une lettre qui se répète avec une entre, même si les lettres utilisées par chaque règle se chevauchent.
    uurcxstgmygtbstg est méchant car il a une paire (tg) mais pas de répétition avec une seule lettre entre eux.
    ieodomkazucvgmuy est méchant car il a une lettre répétitive avec une entre (odo), mais aucune paire qui apparaît deux fois.

Combien de chaînes sont agréables selon ces nouvelles règles ?

