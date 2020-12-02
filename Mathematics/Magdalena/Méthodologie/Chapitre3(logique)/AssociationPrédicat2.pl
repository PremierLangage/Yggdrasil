extends= /model/math.pl
extends= /AAAA/dominique/simplematchlist.pl


pairs ==
$%\forall a \in E \quad \exists b \in E \quad P(a,b)%$§ Tous les étudiants ont regardé le mur d'un étudiant.
$%\exists a \in E \quad \forall b \in E \quad  P(a,b)%$§ Un étudiant au moins a regarfé le mur de tous les étudiants.
$%\exists a \in E \quad \forall b \in E \quad  P(b,a)%$§ Au moins un des murs a été regardé par tous les étudiants.
$%\forall a \in E \quad \forall b \in E \quad  P(a,b)%$§ Tous les étudiants ont regardés tous les murs.
$%\forall a \in E \quad \exists  b \in E \quad  P(b,a)%$§ Chaque mur a été regardé par au moins un étudiant.
$%\exists a \in E \quad \forall b \in E \quad  {rm non}P(a,b)%$§ Un étudiant au moins n'a regardé aucun mur.
==

text = Soit $%E%$ l'ensemble des étudiants de la promotion. Le prédicat $% P(a,b) %$ signifie que $%a%$ a regardé le mur de $%b%$. Associer les propositions suivantes avec leur signification en français.

title = Sens d'un prédicat


