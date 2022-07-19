Vous atteignez à peine la sécurité de la grotte lorsque la baleine s'écrase dans la bouche de la grotte, l'effondrant. Des capteurs indiquent une autre sortie vers cette grotte à une profondeur beaucoup plus grande, vous n'avez donc pas d'autre choix que de continuer.

Alors que votre sous-marin progresse lentement dans le système de grottes, vous remarquez que les affichages à quatre chiffres et à sept segments de votre sous-marin fonctionnent mal ; ils ont dû être endommagés lors de l'évasion. Vous aurez beaucoup de problèmes sans eux, alors vous feriez mieux de comprendre ce qui ne va pas.

Chaque chiffre d'un affichage à sept segments est rendu en activant ou désactivant l'un des sept segments nommés de a à g :

    0 : 1 : 2 : 3 : 4 :
    aaaa .... aaaa aaaa ....
    avant JC  . c. c. c b c
    avant JC  . c. c. c b c
    .... .... dddd dddd dddd
    ef. f e . . F  . F
    ef. f e . . F  . F
    gggg .... gggg gggg ....

    5 : 6 : 7 : 8 : 9 :
    aaaa aaaa aaaa aaaa aaaa
    b. b. . c b c b c
    b. b. . c b c b c
    dddd dddd .... dddd dddd
    . f e f . f e f . F
    . f e f . f e f . F
    gggg gggg .... gggg gggg


Ainsi, pour rendre un 1, seuls les segments c et f seraient activés ; le reste serait éteint. Pour rendre un 7, seuls les segments a, c et f seraient activés.

Le problème est que les signaux qui contrôlent les segments ont été mélangés sur chaque écran. Le sous-marin essaie toujours d'afficher des nombres en produisant une sortie sur les fils de signal a à g, mais ces fils sont connectés aux segments de manière aléatoire. Pire, les connexions fil/segment sont mélangées séparément pour chaque affichage à quatre chiffres ! (Cependant, tous les chiffres d'un affichage utilisent les mêmes connexions.)

Donc, vous savez peut-être que seuls les fils de signal b et g sont allumés, mais cela ne signifie pas que les segments b et g sont allumés : le seul chiffre qui utilise deux segments est 1, donc cela doit signifier que les segments c et f sont destinés être sur. Avec juste cette information, vous ne pouvez toujours pas dire quel fil (b/g) va à quel segment (c/f). Pour cela, vous devrez collecter plus d'informations.

Pour chaque affichage, vous observez les signaux changeants pendant un certain temps, notez les dix modèles de signaux uniques que vous voyez, puis notez une seule valeur de sortie à quatre chiffres (votre entrée de puzzle). En utilisant les modèles de signal, vous devriez être en mesure de déterminer quel modèle correspond à quel chiffre.

Par exemple, voici ce que vous pourriez voir dans une seule entrée de vos notes :

acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab |
cdfeb fcadb cdfeb cdbaf
(L'entrée est enveloppée ici sur deux lignes pour qu'elle tienne ; dans vos notes, tout sera sur une seule ligne.)

Chaque entrée se compose de dix modèles de signal uniques, un | délimiteur, et enfin la valeur de sortie à quatre chiffres. Dans une entrée, les mêmes connexions fil/segment sont utilisées (mais vous ne savez pas quelles sont réellement les connexions). Les modèles de signal uniques correspondent aux dix façons différentes que le sous-marin essaie de rendre un chiffre en utilisant les connexions fil/segment actuelles. Étant donné que 7 est le seul chiffre qui utilise trois segments, dab dans l'exemple ci-dessus signifie que pour rendre un 7, les lignes de signal d, a et b sont activées. Étant donné que 4 est le seul chiffre qui utilise quatre segments, eafb signifie que pour rendre un 4, les lignes de signal e, a, f et b sont activées.

À l'aide de ces informations, vous devriez être en mesure de déterminer quelle combinaison de fils de signal correspond à chacun des dix chiffres. Ensuite, vous pouvez décoder la valeur de sortie à quatre chiffres. Malheureusement, dans l'exemple ci-dessus, tous les chiffres de la valeur de sortie (cdfeb fcadb cdfeb cdbaf) utilisent cinq segments et sont plus difficiles à déduire.

Pour l'instant, concentrez-vous sur les chiffres faciles. Considérez cet exemple plus large :

    être cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
    edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec   | fcgedb cgb dgebacf gc
    fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef   | cg cg fdcagbcbg
    fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega   | efabcd cedba gadfec cb
    aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga   | gecf egdcabf bgf bfgea
    fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf   | gebdcfa ecba ca fadegcb
    dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf   | cefg dcbef fcge gbcadfe
    bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd   | ed bcgafe cdgba cbgef
    egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg   | gbdfcae bgc cg cgb
    gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc   | fgae cfgab fg bagce


Étant donné que les chiffres 1, 4, 7 et 8 utilisent chacun un nombre unique de segments, vous devriez être en mesure de dire quelles combinaisons de signaux correspondent à ces chiffres. En comptant uniquement les chiffres dans les valeurs de sortie (la partie après | sur chaque ligne), dans l'exemple ci-dessus, il y a 26 instances de chiffres qui utilisent un nombre unique de segments (mis en surbrillance ci-dessus).

Dans les valeurs de sortie, combien de fois les chiffres 1, 4, 7 ou 8 apparaissent-ils ?