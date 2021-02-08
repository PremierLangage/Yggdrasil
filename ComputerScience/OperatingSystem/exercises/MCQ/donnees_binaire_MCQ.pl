#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

tag=system|unix|donnees|binaire

extends = /ComputerScience/OperatingSystem/exercises/MCQ/caroussel_template.pl

#****************************************************************************
# PANNEAU DE CONTROLE ICI
#****************************************************************************
title=Quizz sur les données binaires
questions=@ donnees_binaire.txt
nb_question=5
feedback=True
min_options=4
max_options=8
#****************************************************************************
# FIN DU PANNEAU DE CONTROLE : NE PLUS RIEN TOUCHER APRES
#****************************************************************************

