#*****************************************************************************
#  Copyright (C) 2023 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

################### Modifier ici ###########################
author=ESIEE info AD&D année 1

title=Vos choix d'options personnels

text ==
Sans consultation de vos maitres d'apprentissage et seulement en interrogeant vos goûts personnels, veuillez 
classer les trois options de votre premier voeux (l'option qui vous interesse le plus) à votre troisième voeux 
(l'option qui vous interesse le moins).
==

question1=<b>Quel est votre premier choix d'option ?</b>

question2=<b>Quel est votre second choix d'option ?</b>

question3=<b>Quel est votre troisième choix d'option ?</b>

items==
Géomatique
Logiciel
Réseaux
==

############################################

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup

before==#|python|

group1.items = []
group2.items = []
group3.items = []

for i, item in enumerate(items.splitlines()):
    group1.items.append({ "id": i+1, "content": item })
    group2.items.append({ "id": i+1, "content": item })
    group3.items.append({ "id": i+1, "content": item })
==

form==

{{ question1 }}

{{ group1|component }}

{{ question2 }}

{{ group2|component }}

{{ question3 }}

{{ group3|component }}

==

# EVALUATE THE STUDENT ANSWER
evaluator == #|py|
score = 100
feedback = '<span class="success-state">Réponse enregistrée</span>'



import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import mpld3
from mpld3 import plugins
np.random.seed(9615)

# generate df
N = 100
df = pd.DataFrame((.1 * (np.random.random((N, 5)) - .5)).cumsum(0),
                  columns=['a', 'b', 'c', 'd', 'e'],)

# plot line + confidence interval
fig, ax = plt.subplots()
ax.grid(True, alpha=0.3)

for key, val in df.items():
    l, = ax.plot(val.index, val.values, label=key)
    ax.fill_between(val.index,
                    val.values * .5, val.values * 1.5,
                    color=l.get_color(), alpha=.4)

# define interactive legend

handles, labels = ax.get_legend_handles_labels() # return lines and labels
interactive_legend = plugins.InteractiveLegendPlugin(zip(handles,
                                                         ax.collections),
                                                     labels,
                                                     alpha_unsel=0.5,
                                                     alpha_over=1.5, 
                                                     start_visible=True)


ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_title('Interactive legend', size=20)

feedback += mpld3.fig_to_html(fig)




grade = (score, feedback)
==


