#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

# template Tout nouveau malheuresement... feedback pas encore programmé...
extends=/ComputerScience/C/examples/Stoi_le_caroussel.pl


author = Enseignants Méthodologie
bij =$ /AAAA/Quentin/Images/bij.png

# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 4

title= carroussel


image1 =$ /AAAA/Quentin/EXAM-JEUDI/Images/bij.png
image2 =$ /AAAA/Quentin/EXAM-JEUDI/Images/non-appli.png
image3 =$ /AAAA/Quentin/EXAM-JEUDI/Images/nsur-ninj.png
image4 =$ /AAAA/Quentin/EXAM-JEUDI/Images/surj-ninj.png

questions==

** On considère l'application $!f:E\to F!$ donnée par le dessin ci-contre. Cocher la (ou les) bonne(s) réponse(s).

![image1]({{ image1 }})

+ f est surjective
+ f est injective
+ f est bijective
- f n'est pas une application
- f est bien définie mais n'est ni injective ni surjective

** On considère l'application $!f:E\to F!$ donnée par le dessin ci-contre. Cocher la (ou les) bonne(s) réponse(s).

![image2]({{ image2 }})

+ f n'est pas une application
- f est surjective
- f est injective
- f est bijective
- f est bien définie mais n'est ni injective ni surjective

** On considère l'application $!f:E\to F!$ donnée par le dessin ci-contre. Cocher la (ou les) bonne(s) réponse(s).

![image3]({{ image3 }})

+ f est bien définie mais n'est ni injective ni surjective
- f est surjective
- f est injective
- f est bijective
- f n'est pas une application

** On considère l'application $!f:E\to F!$ donnée par le dessin ci-contre. Cocher la (ou les) bonne(s) réponse(s).

![image4]({{ image4 }})

- f est bien définie mais n'est ni injective ni surjective
+ f est surjective
- f est injective
- f est bijective
- f n'est pas une application

==