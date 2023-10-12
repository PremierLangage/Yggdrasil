Vous entrez dans une grande caverne pleine de rares pieuvres dumbo bioluminescentes ! Ils semblent ne pas aimer les lumières de Noël de votre sous-marin, alors vous les éteignez pour l'instant.

Il y a 100 pieuvres soigneusement disposées dans une grille de 10 par 10. Chaque pieuvre gagne lentement de l'énergie au fil du temps et clignote vivement pendant un moment où son énergie est pleine. Bien que vos lumières soient éteintes, vous pourriez peut-être naviguer dans la grotte sans déranger les pieuvres si vous pouviez prévoir quand les éclairs de lumière se produiront.

Chaque pieuvre a un niveau d'énergie - votre sous-marin peut mesurer à distance le niveau d'énergie de chaque pieuvre (votre entrée de puzzle). Par exemple:

5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
Le niveau d'énergie de chaque pieuvre est une valeur comprise entre 0 et 9. Ici, la pieuvre en haut à gauche a un niveau d'énergie de 5, celle en bas à droite a un niveau d'énergie de 6, et ainsi de suite.

Vous pouvez modéliser les niveaux d'énergie et les éclairs de lumière par étapes. Au cours d'une même étape, il se produit :

Tout d'abord, le niveau d'énergie de chaque pieuvre augmente de 1.
Ensuite, toute pieuvre avec un niveau d'énergie supérieur à 9 clignote. Cela augmente le niveau d'énergie de toutes les pieuvres adjacentes de 1, y compris les pieuvres adjacentes en diagonale. Si cela amène une pieuvre à avoir un niveau d'énergie supérieur à 9, elle clignote également. Ce processus se poursuit tant que le niveau d'énergie des nouvelles pieuvres continue d'augmenter au-delà de 9. (Une pieuvre ne peut clignoter qu'une seule fois par étape.)
Enfin, toute pieuvre qui a clignoté pendant cette étape a son niveau d'énergie réglé sur 0, car elle a utilisé toute son énergie pour clignoter.
Des éclairs adjacents peuvent faire clignoter une pieuvre sur une marche même si elle commence cette marche avec très peu d'énergie. Considérez la pieuvre du milieu avec 1 énergie dans cette situation :

    Avant toute étape :
    11111
    19991
    19191
    19991
    11111

    Après l'étape 1 :
    34543
    40004
    50005
    40004
    34543

    Après l'étape 2 :
    45654
    51115
    61116
    51115
    45654
    Une pieuvre est mise en surbrillance lorsqu'elle a clignoté pendant l'étape donnée.

    Voici comment l'exemple plus large ci-dessus progresse :

    Avant toute étape :
    5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526

    Après l'étape 1 :
    6594254334
    3856965822
    6375667284
    7252447257
    7468496589
    5278635756
    3287952832
    7993992245
    5957959665
    6394862637

    Après l'étape 2 :
    8807476555
    5089087054
    8597889608
    8485769600
    8700908800
    6600088989
    6800005943
    0000007456
    9000000876
    8700006848

    Après l'étape 3 :
    0050900866
    8500800575
    9900000039
    9700000041
    9935080063
    7712300000
    7911250009
    2211130000
    0421125000
    0021119000

    Après l'étape 4 :
    2263031977
    0923031697
    0032221150
    0041111163
    0076191174
    0053411122
    0042361120
    5532241122
    1532247211
    1132230211

    Après l'étape 5 :
    4484144000
    2044144000
    2253333493
    1152333274
    1187303285
    1164633233
    1153472231
    6643352233
    2643358322
    2243341322

    Après l'étape 6 :
    5595255111
    3155255222
    3364444605
    2263444496
    2298414396
    2275744344
    2264583342
    7754463344
    3754469433
    3354452433

    Après l'étape 7 :
    6707366222
    4377366333
    4475555827
    3496655709
    3500625609
    3509955566
    3486694453
    8865585555
    4865580644
    4465574644

    Après l'étape 8 :
    7818477333
    5488477444
    5697666949
    4608766830
    4734946730
    4740097688
    6900007564
    0000009666
    8000004755
    6800007755

    Après l'étape 9 :
    9060000644
    7800000976
    6900000080
    5840000082
    5858000093
    6962400000
    8021250009
    2221130009
    9111128097
    7911119976

    Après l'étape 10 :
    0481112976
    0031112009
    0041112504
    0081111406
    0099111306
    0093511233
    0442361130
    5532252350
    0532250600
    0032240000


Après l'étape 10, il y a eu un total de 204 flashs. Avance rapide, voici la même configuration toutes les 10 étapes :

    Après l'étape 20 :
    3936556452
    5686556806
    4496555690
    4448655580
    4456865570
    5680086577
    7000009896
    0000000344
    6000000364
    4600009543

    Après l'étape 30 :
    0643334118
    4253334611
    3374333458
    2225333337
    2229333338
    2276733333
    2754574565
    5544458511
    9444447111
    7944446119

    Après l'étape 40 :
    6211111981
    0421111119
    0042111115
    0003111115
    0003111116
    0065611111
    0532351111
    3322234597
    2222222976
    2222222762

    Après l'étape 50 :
    9655556447
    4865556805
    4486555690
    4458655580
    4574865570
    5700086566
    6000009887
    8000000533
    6800000633
    5680000538

    Après l'étape 60 :
    2533334200
    2743334640
    2264333458
    2225333337
    2225333338
    2287833333
    3854573455
    1854458611
    1175447111
    1115446111

    Après l'étape 70 :
    8211111164
    0421111166
    0042111114
    0004211115
    0000211116
    0065611111
    0532351111
    7322235117
    5722223475
    4572222754

    Après l'étape 80 :
    1755555697
    5965555609
    4486555680
    4458655580
    4570865570
    5700086566
    7000008666
    0000000990
    0000000800
    0000000000

    Après l'étape 90 :
    7433333522
    2643333522
    2264333458
    2226433337
    2222433338
    2287833333
    2854573333
    4854458333
    3387779333
    3333333333

    Après l'étape 100 :
    0397666866
    0749766918
    0053976933
    0004297822
    0004229892
    0053222877
    0532222966
    9322228966
    7922286866
    6789998766


Après 100 étapes, il y a eu un total de 1656 flashs.

Étant donné les niveaux d'énergie de départ des pieuvres dumbo dans votre caverne, simulez 100 pas. Combien y a-t-il de flashs au total après 100 étapes ?