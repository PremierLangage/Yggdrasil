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


author=The ESIPE Dream Team !
bij =$ /AAAA/Quentin/Images/bij.png

# pour changer le nombre de question, c'est en dessous (10 MAX)
# si le nombre est plus petit que 10, ce sera un tirage aléatoire
# sans remise parmi le tas de questions.
nb_quest_voulu = 6

title=Grille évaluation Exposés Techniques Avancés

questions=@ /ComputerScience/C/review/Xpose_questions.txt