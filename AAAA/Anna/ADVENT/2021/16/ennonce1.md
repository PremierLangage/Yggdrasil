Lorsque vous quittez la grotte et atteignez les eaux libres, vous recevez une transmission des Elfes de retour sur le navire.

La transmission a été envoyée à l'aide du système de transmission d'échange de flottabilité (BITS), une méthode de conditionnement d'expressions numériques dans une séquence binaire. L'ordinateur de votre sous-marin a enregistré la transmission en hexadécimal (votre entrée de puzzle).

La première étape du décodage du message consiste à convertir la représentation hexadécimale en binaire. Chaque caractère de l'hexadécimal correspond à quatre bits de données binaires :

0 = 0000
1 = 0001
2 = 0010
3 = 0011
4 = 0100
5 = 0101
6 = 0110
7 = 0111
8 = 1000
9 = 1001
A = 1010
B = 1011
C = 1100
J = 1101
E = 1110
F = 1111
La transmission BITS contient un seul paquet à sa couche la plus externe qui contient elle-même de nombreux autres paquets. La représentation hexadécimale de ce paquet peut coder quelques bits 0 supplémentaires à la fin ; ceux-ci ne font pas partie de la transmission et doivent être ignorés.

Chaque paquet commence par un en-tête standard : les trois premiers bits codent la version du paquet et les trois bits suivants codent l'ID du type de paquet. Ces deux valeurs sont des nombres ; tous les nombres codés dans n'importe quel paquet sont représentés sous forme binaire avec le bit le plus significatif en premier. Par exemple, une version codée comme la séquence binaire 100 représente le nombre 4.

Les paquets de type ID 4 représentent une valeur littérale. Les paquets de valeur littérale codent un seul nombre binaire. Pour ce faire, le nombre binaire est complété par des zéros non significatifs jusqu'à ce que sa longueur soit un multiple de quatre bits, puis il est divisé en groupes de quatre bits. Chaque groupe est préfixé par un bit 1 sauf le dernier groupe qui est préfixé par un bit 0. Ces groupes de cinq bits suivent immédiatement l'en-tête du paquet. Par exemple, la chaîne hexadécimale D2FE28 devient :

110100101111111000101000
VVVTTTAAAABBBBBCCCCC
Sous chaque bit se trouve une étiquette indiquant son objectif :

    Les trois bits étiquetés V (110) sont la version du paquet, 6.
    Les trois bits étiquetés T (100) sont l'ID de type de paquet, 4, ce qui signifie que le paquet est une valeur littérale.
    Les cinq bits étiquetés A (10111) commencent par un 1 (pas le dernier groupe, continuez à lire) et contiennent les quatre premiers bits du nombre, 0111.
    Les cinq bits étiquetés B (11110) commencent par un 1 (pas le dernier groupe, continuez à lire) et contiennent quatre autres bits du nombre 1110.
    Les cinq bits étiquetés C (00101) commencent par un 0 (dernier groupe, fin de paquet) et contiennent les quatre derniers bits du nombre, 0101.
    Les trois bits 0 non étiquetés à la fin sont supplémentaires en raison de la représentation hexadécimale et doivent être ignorés.

Ainsi, ce paquet représente une valeur littérale avec une représentation binaire 011111100101, soit 2021 en décimal.

Tous les autres types de paquets (tout paquet avec un ID de type autre que 4) représentent un opérateur qui effectue un calcul sur un ou plusieurs sous-paquets contenus à l'intérieur. À l'heure actuelle, les opérations spécifiques ne sont pas importantes ; concentrez-vous sur l'analyse de la hiérarchie des sous-paquets.

Un paquet opérateur contient un ou plusieurs paquets. Pour indiquer quelles données binaires ultérieures représentent ses sous-paquets, un paquet d'opérateur peut utiliser l'un des deux modes indiqués par le bit immédiatement après l'en-tête de paquet ; c'est ce qu'on appelle l'ID de type de longueur :

Si l'ID de type de longueur est 0, alors les 15 bits suivants sont un nombre qui représente la longueur totale en bits des sous-paquets contenus par ce paquet.
Si l'ID de type de longueur est 1, alors les 11 bits suivants sont un nombre qui représente le nombre de sous-paquets immédiatement contenus par ce paquet.
Enfin, après le bit ID de type de longueur et le champ 15 bits ou 11 bits, les sous-paquets apparaissent.

Par exemple, voici un paquet d'opérateur (chaîne hexadécimale 38006F45291200) avec un ID de type de longueur 0 qui contient deux sous-paquets :

    00111000000000000110111101000101001010010001001000000000
    VVVTTTILLLLLLLLLLLLLLAAAAAAAAAABBBBBBBBBBBBBBBB
    Les trois bits étiquetés V (001) sont la version du paquet, 1.
    Les trois bits étiquetés T (110) sont l'ID de type de paquet, 6, ce qui signifie que le paquet est un opérateur.
    Le bit étiqueté I (0) est l'ID de type de longueur, qui indique que la longueur est un nombre de 15 bits représentant le nombre de bits dans les sous-paquets.
    Les 15 bits étiquetés L (000000000011011) contiennent la longueur des sous-paquets en bits, 27.
    Les 11 bits étiquetés A contiennent le premier sous-paquet, une valeur littérale représentant le nombre 10.
    Les 16 bits étiquetés B contiennent le deuxième sous-paquet, une valeur littérale représentant le nombre 20.

Après lecture de 11 et 16 bits de données de sous-paquet, la longueur totale indiquée dans L (27) est atteinte, et ainsi l'analyse de ce paquet s'arrête.

Comme autre exemple, voici un paquet d'opérateur (chaîne hexadécimale EE00D40C823060) avec l'ID de type de longueur 1 qui contient trois sous-paquets :

    11101110000000001101010000001100100000100011000001100000
    VVVTTTILLLLLLLLLLAAAAAAAAAAABBBBBBBBBBBCCCCCCCCCCC
    Les trois bits étiquetés V (111) sont la version du paquet, 7.
    Les trois bits étiquetés T (011) sont l'ID de type de paquet, 3, ce qui signifie que le paquet est un opérateur.
    Le bit étiqueté I (1) est l'ID de type de longueur, ce qui indique que la longueur est un nombre de 11 bits représentant le nombrede sous-paquets.
    Les 11 bits étiquetés L (00000000011) contiennent le nombre de sous-paquets, 3.
    Les 11 bits étiquetés A contiennent le premier sous-paquet, une valeur littérale représentant le nombre 1.
    Les 11 bits étiquetés B contiennent le deuxième sous-paquet, une valeur littérale représentant le nombre 2.
    Les 11 bits étiquetés C contiennent le troisième sous-paquet, une valeur littérale représentant le nombre 3.

Après lecture de 3 sous-paquets complets, le nombre de sous-paquets indiqué en L (3) est atteint, et donc l'analyse de ce paquet s'arrête.

Pour l'instant, analysez la hiérarchie des paquets tout au long de la transmission et additionnez tous les numéros de version.

Voici quelques exemples supplémentaires de transmissions codées en hexadécimal :

    8A004A801A8002F478 représente un paquet opérateur (version 4) qui contient un paquet opérateur (version 1) qui contient un paquet opérateur (version 5) qui contient une valeur littérale (version 6); ce paquet a une somme de version de 16.
    620080001611562C8802118E34 représente un paquet opérateur (version 3) qui contient deux sous-paquets ; chaque sous-paquet est un paquet d'opérateur qui contient deux valeurs littérales. Ce paquet a une somme de version de 12.
    C0015000016115A2E0802F182340 a la même structure que l'exemple précédent, mais le paquet le plus externe utilise un ID de type de longueur différente. Ce paquet a une somme de version de 23.
    A0016C880162017C3686B18A3D4780 est un paquet d'opérateur qui contient un paquet d'opérateur qui contient un paquet d'opérateur qui contient cinq valeurs littérales ; il a une somme de version de 31.

Décodez la structure de votre transmission BITS encodée en hexadécimal ; qu'obtenez-vous si vous additionnez les numéros de version de tous les paquets ?