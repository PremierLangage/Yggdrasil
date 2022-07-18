
Commande plant uml
    pu < code  > svg

-public + 
-protected #
-package ~
-private - 

losange vide : agragation 
losange noir composition 
fleche -> associatopn 
fleche creuse -|> heritage (extends) ou implements 

<<stéréotypes>> 
----> dépendance 

Composition 
-> element constitutif voiture:chassis 
si le containeur est détruit les composants aussi 


Agr&agation 
-> regroupement informatif 
un professeur + ses élèves 


Association 
-> connection temporaire entre deux classes
Vol <-> avion
Vol(paris-madrid de 11h) 
Avion(Cet airbus A19 N° de série 5B667000291) 

