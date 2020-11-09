
extends=QCM-AMCE.pl

questions==
=*+ Exo avec click sur un mot ici bonne est le bon mot 
 Vous  pouvez en mettre plusieurs séparer vos mots par des espace 
 si vous souhaiter mettre un espace ajouter des crochet autour des caractères en question   
>j'indique avec des doubles curly brackets la {{bonne}} réponse

=**[nb=13, group=odd] What are the $%odd%$ numbers ? 

+=[x for x in range(3,77) if x%2==1 ]
-=[100,200,300,400,500,600]
-=[x for x in range(2,20) if x%2==0 ]


==


