



text==

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


Ecrire une fonction question2(char *filename) qui retourne le nombre de chaines gentilles dans le fichier passé en paramêtre.


Le fichier "gentil.test" contient 1000 chaines et le nombre de mots gentils est 50.
===
