



/* PL:title= Tableau Trie  */
/* PL:text==

Ecrire une fonction de prototype **int ajoutTrie(int \*tab,int nbe, int valeur);**
qui ajoute la *valeur* dans le tableau trié tab de taille TAILLE contenant déjà nbe elements.

On suppose que l'on a definie TAILLE comme suit:


 \#define TAILLE 341

mais pas nécessairement avec l'entier 341.

Si nbe == TAILLE, la fonction ne fait rien et retourne 0.


Sinon la valeur est insérée dans le tableau de sorte que le tableau reste trié en ordre **décroissant**
dans ce cas la fonction retourne 1.

PL:== */

// PL:code_before==
#include <stdio.h>
#include <stdlib.h>
#ifndef TAILLE
#define TAILLE 1000
#endif
// PL:==
// PL:solution==

int ajoutTrie(int *tab, int nbe, int valeur)
{
    if (nbe == TAILLE)
    {
        return 0;
    }
    int i = 0;
    while (i < nbe && tab[i] > valeur)
    {
        i++;
    }
    for (int j = nbe; j > i; j--)
    {
        tab[j] = tab[j - 1];
    }
    tab[i] = valeur;
    return 1;
}

// PL:==

/* PL:code==
int ajoutTrie(int *tab,int nbe, int valeur) {}

PL:== */

// PL:code_after==

void printTab(int *t, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d ", t[i]);
    }
    printf("\n");
}

int main(int c, char *v[])
{
    int n;
    int i = 0;
    int tab[TAILLE];
    int pas= atoi(v[1]);
    while (scanf("%d", &n) == 1)
    {
        i += ajoutTrie(tab, i, n);
        if (i % pas == 0)
            printTab(tab, i);
    }
    return 0;
}
// PL:==

/* PL:checks_args_stdin==
[["Test 1", ["4"], "5 4 7 190 8 14 17 16 161 16 16 13 11"],
["Test Yveline", ["12"], "4 538 98 876 65 54 43 1 883 8 798739 66 23 14 17 98 900 1000 12"],
["Test aléatoire", ["300"], '6389 556 4510 7827 3516 4985 3650 5716 8016 2147 780 5610 567 1445 3134 3076 8244 2763 8295 2635 3020 262 896 5634 6388 1743 6143 50 2610 5615 988 2821 9762 6939 8510 738 7102 4029 8290 7587 87 5000 8689 1605 2681 5467 1762 7995 2342 3082 6617 7340 9064 5433 192 5701 536 4003 2207 8595 6711 4542 5294 729 5872 2820 2608 8692 3974 6890 466 8974 9339 2792 6375 1884 9012 7884 4491 9560 5931 7518 9794 8056 5398 5749 8428 8453 370 9619 6633 8293 4368 5194 4634 5221 7706 9640 2867 2547 1687 2244 4484 5915 5383 9371 2998 4215 2447 7621 344 7881 3636 7070 6481 3500 4280 2001 5175 6193 925 7923 7538 4324 2097 4303 1536 6194 7241 4360 7546 2036 6092 9251 1946 5869 2517 1666 1236 925 8499 7384 124 7996 4828 9592 2230 4663 4281 387 6510 7879 8586 6786 6705 8087 6240 5841 9545 6135 8297 1014 5117 8799 1168 5562 936 3895 1344 5898 1175 3657 8470 2056 4725 4251 3916 3024 3367 7734 6359 3829 260 2120 9601 4414 8558 4228 4345 6552 9363 5038 -46 9290 4071 526 2686 4309 5965 4534 5470 1914 5246 3609 7424 1144 788 8535 6637 735 2615 8563 9090 5304 4201 6040 5428 6803 8696 4241 3577 358 1119 5684 7065 4480 9902 5065 5767 5707 2816 6473 4691 9320 1186 4199 2814 5341 2384 3281 4598 3171 4576 437 8419 7814 1039 8940 9939 884 7761 8572 7749 1616 8666 115 6627 3389 -57 1904 8028 3733 5975 8 4881 6947 3774 8672 4320 5400 3213 3772 4344 1791 6806 1946 6199 8929 1602 9272 7268 2380 1290 -7 4198 8494 4373 3140 3382 7991 822 9914 8554 4955 4852 5274 9682 2117 5569 5098 8193 3629 888 396 5712 1122 7539 839 48 6555 3509 9223 2950 5057 263 5830 6561 1762 3932 8990 3984 1870 4988 1246 8082 9452 5790 6131 7029 584 7293 594 3956 7288 1441 3052 6160 7754 8114 1325 3954 4568 649 5622 4362 5403 6028 1761 4927 6649 7499 4080 2181 1040 1831 6020 679 2099 8030 8919 6965 4527 729 9232 2022 6945 6110 7282 581 752 2104 9592 4043 1961 4960 8582 1777 1488 6515 2924 9280 4389 6333 3786 5105 9703 3837 4978 4453 7226 541 272 3611 8413 7457 2714 4597 8070 9418 7743 270 2393 2184 5675 1000 7534 5187 5745 4280 6445 9546 2261 5395 9077 6812 9942 9966 8182 826 8278 1288 2814 84 3152 3371 2532 5420 8904 1741 2749 5722 5770 5677 50 8907 7098 850 6501 3322 3024 197 96 7636 5122 4227 1030 6355 8710 7012 2772 1699 8756 6463 3226 591 7460 9187 5923 5142 547 9892 651 2605 3419 7728 3453 1569 5103 3400 8632 5082 7190 977 -96 4715 2557 733 6497 7429 1331 7459 5425 7922 422 7254 5302 -11 943 3288 359 8354 8956 9727 2408 5006 4665 8642 3677 3075 3770 8047 7348 4955 2042 8551 267 5525 3315 8402 9091 2773 2458 1209 2519 1954 6912 6227 7879 7410 1398 92 8041 2621 5921 8554 3519 6546 4277 9405 2108 3579 810 4636 6353 243 8729 6200 2594 6332 8860 6226 2325 460 11 5427 2116 1793 5322 8339 1612 1143 4594 3421 164 7217 3707 9552 4552 3067 1146 7443 2531 5754 4103 7211 9394 8590 4753 9420 8274 1220 54 5114 8749 3882 3942 7359 3084 4273 2379 7315 5601 1244 -51 6112 5471 9505 5368 9475 5072 2547 8921 777 9920 7424 3877 8569 895 7441 3835 9450 4743 5849 5208 960 8637 595 8995 2733 7997 2215 7151 -100 8415 6040 9473 4985 1302 2614 9431 739 6065 6451 2531 5285 74 8569 6404 5329 9894 9764 6285 5897 1833 9742 5739 2631 8898 793 8139 2234 7568 2385 7327 1720 4825 2844 9170 1427 6484 9971 7123 6338 9355 2946 8530 9278 21 8920 4773 2595 1760 4853 5096 1962 3082 2282 1342 7668 9931 1311 9576 9159 6921 7841 6927 4987 9200 5699 3098 2947 128 348 6175 1912 8601 9704 2032 2081 1556 9816 2450 2640 9937 7713 318 1585 9020 5929 3437 9648 5221 5630 5588 3980 4054 4446 4017 7097 7378 8328 2006 9965 3503 -18 1074 61 1776 5941 7657 1551 2761 4287 9303 9386 2905 7492 4842 8118 2810 1950 3232 6899 7594 9174 386 2894 9417 4934 450 8647 251 5263 3801 9935 4362 1777 5664 334 5756 8491 1583 7990 610 385 1948 6678 1948 5092 7015 3325 6126 2157 4823 3098 4589 766 9315 5882 4438 1737 8934 5176 179 7535 8554 5717 5060 4943 -48 3662 7970 3411 6947 6328 8227 6877 68 4614 8408 2168 2296 502 9505 3410 1086 6344 5856 3798 2769 4771 4762 6039 5656 3662 8701 2300 1153 8827 1403 8214 7435 8381 1253 7679 6468 8494 4606 1482 1923 7533 7601 7334 9895 5863 8241 4777 7591 7304 7692 5794 6247 8107 1367 1922 8404 9618 6376 6680 8869 9608 7461 9564 3808 8560 -94 1492 9103 8273 3530 6120 5863 1396 5629 4926 4656 9530 6343 1180 8685 3565 5606 617 2293 6234 190 5586 291 1522 3911 7567 2890 8102 9533 676 9376 6366 8812 5265 7415 7708 5711 9257 5600 9000 3503 5047 7829 6118 9677 5114 5848 8311 9618 7987 7660 7474 -70 2374 251 9916 719 653 1198 4151 9734 8794 6865 662 9131 4027 1373 5107 3890 4405 1134 6456 6483 9507 363 752 1430 4488 3418 2567 2502 7995 3060 2583 5018 7440 4992 7958 2692 3358 5307 3706 9408 9357 3312 1959 5857 8068 8293 7971 9130 6553 5088 3305 6992 7240 483 3690 1073 3593 1613 5677 3467 1430 1768 1151 1917 6142 8523 3792 5537 3731 6861 9517 3960 8147 2298 3402 3151 2711 2790 603 5932 5757 3098 6566 1489 7986 540 1589 6018 6222 5886 2599 3966 6319 738 1101 384 9440 236 4119 7899 5523 1977 -37 2116 3858'
]
]
PL:== */