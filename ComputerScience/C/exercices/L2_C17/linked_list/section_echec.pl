







extends=/template/default.pl


text==#|markdown|

## La section suivante est consacrée au **jeu d'échec**.


Le jeu d’échecs est un jeu opposant deux joueurs (blanc et noir) qui se joue sur un plateau de $!8 \times 8 !$
cases. Il se joue avec différentes pièces, mais seules les tours, les fous et la reine nous intéresseront dans
cet exercice.  


Si une pièce se déplace sur une case occupée par une pièce adverse, celle-ci est prise et enlevée de
l’échiquier. Une pièce ne peut pas se placer sur une case occupée par une pièce de son propre camp. La
tour, le fou ou la reine ne peuvent pas non plus sauter au dessus d’une autre pièce.  


La tour se déplace horizontalement ou verticalement d’autant de cases qu’elle veut. Le fou se déplace
lui en diagonale d’autant de cases qu’il le souhaite. Enfin, la dame se déplace comme la tour et le fou : elle
peut donc se déplacer verticalement, horizontalement et en diagonale d’autant de cases qu’elle veut.  

---

Par exemple, dans la Figure 1, on a indiqué en couleur toutes les cases où la tour (respectivement le fou
et la reine) située en e4 peut aller. Noter que dans le diagramme de gauche, la tour noire en b7 ne peut
aller ni en g7, ni en h7. Elle peut néanmoins prendre le cavalier blanc en b2, mais ne peut pas se déplacer
en b1.  

![Figure 1](http://igm.univ-mlv.fr/~derycke/l2_c17_rattrapage_fig1.png)

Voic un code de base pour démarrer dans votre IDE de choix.

<div style="font-size:1em">
<details><summary>le code pour démarrer </summary><blockquote id="ode" style="white-space: pre-line" 
><code><pre>{{ode}}</pre></code>
</blockquote></details>



==

title = Les echecs
form=


ode==#|c|

#define VIDE 0
#define TOUR 1
#define FOU 2
#define REINE 4
#define NOIR 0
#define BLANC 1

typedef struct {
    int type;
    int color;
} Piece;

typedef struct {
    Piece board[8][8];
} Game;

typedef struct { 
    int i; 
    int j;
} Pos, Dir;

==
