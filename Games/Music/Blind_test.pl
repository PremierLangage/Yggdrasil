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

countdown % { "cid": "countdown", "selector": "c-countdown" }
countdown.time % 33
countdown.hidden % false

autoSubmit== #|js|
const btn = document.querySelector('.action-submit');
btn.click()
==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Le nom du groupe 
inputbox.appearance = outline

url_sample1 =$ Samples/back_in_black.mp3
url_sample2 =$ Samples/chop_suey.mp3
url_sample3 =$ Samples/completement_siphone.mp3
url_sample4 =$ Samples/je_t_aime_de_ouf.mp3
url_sample5 =$ Samples/la_chanson_du_cerceuil.mp3
url_sample6 =$ Samples/la_fille_du_coupeur_de_joint.mp3
url_sample7 =$ Samples/naruto.mp3
url_sample8 =$ Samples/new_york_unite_speciale.mp3
url_sample9 =$ Samples/no_woman_no_cry.mp3
url_sample10 =$ Samples/partenaire_particulier.mp3
url_sample11 =$ Samples/reflechir.mp3
url_sample12 =$ Samples/titanic.mp3
url_sample13 =$ Samples/tortues_ninjas.mp3
url_sample14 =$ Samples/where_is_my_mind.mp3

logOnConsole==#|js|
// you may open the browser console to see the message
console.log('hello world');
==

before== #|python|
import random

# Change here to select the number of question outside all possibles samples
# Please provide more than 2 due to plural feedback formulation...
number_of_sample=5

samples = [[33, 2, "AC/DC", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample1],
[62, 3, "System of a down", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample2],
[33, 2, "AC/DC", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample3],
[35, 2, "Wejdene", "Vous devez trouver <b>le nom de la chanteuse</b> interprétant originellement ce morceaux.", "Le nom de la chanteuse", url_sample4],
[91, 3, "cercueil", "Vous devez trouver <b>le nom de l'objet</b> avec lequel les acteurs du clip de ce même internet dansent frénétiquement.", "Le nom de l'objet", url_sample5],
[37, 2, "La fille du coupeur de joint", "Vous devez trouver <b>le titre de la chansom</b> interprétant originellement par Hubert Félix Thiéfaine.", "Le titre de la chanson", url_sample6],
[64, 2, "Naruto", "Vous devez trouver <b>le nom de la série d'animés</b> dans laquelle on peut enttendre ce morceaux.", "La série animée", url_sample7],
[65, 6, "Unité spéciale", "Vous devez trouver <b>le nom de la série</b> (après NY) dans laquelle on peut suivre Olivia Benson.", "Le nom de la série", url_sample8],
[80, 4, "Bob Marley", "Vous devez trouver <b>le prénom et le nom du chanteur</b> interprétant originellement ce morceaux.", "Le chanteur de cette chanson", url_sample9],
[59, 3, "Partenaire particulier", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample10],
[45, 2, "Wejdene", "Vous devez trouver <b>le nom de la chanteuse</b> interprétant originellement ce morceaux.", "Le nom de la chanteuse", url_sample11],
[36, 2, "Titanic", "Vous devez trouver <b>le nom du film</b> ayant dans sa bande originale ce magnifique morceau.", "Le nom du film", url_sample12],
[65, 2, "Tortues ninjas", "Vous devez trouver <b>le nom de la série d'animés</b> dont ce morceau est le générique.", "La série d'animés", url_sample13],
[66, 4, "Pixies", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample14]]

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]

# the indices of the ranmdomly selected samples
samples_keys = random.sample(range(len(samples)), number_of_sample)
current_index = 0

def make_text_exo(sample_meta):
    """
    Return the python string generating the text exercice adapted to meta information in argument
    """
    ans=sample_meta[3]
    ans+="<br /><br />"
    ans+="""
    <center>
    <div>
    <audio controls autoplay>
    """
    ans+='<source src="'+sample_meta[5]+'" type="audio/mp3">'
    ans+="""
        Votre navigateur ne supporte pas la lecture du clip audio.
    </audio>
    </div>
    </center>
    """
    return ans

def make_form(sample_meta):
    """
    Return the python string generating the form adapted to the meta information in argument
    """
    ans="""
    <br />
    <center><b>Temps restant : </b></center>

    {{ countdown|component }}

    <br />

    {{ inputbox|component}}
    """
    return ans

text=make_text_exo(samples[samples_keys[current_index]])
form=make_form(samples[samples_keys[current_index]])
inputbox.placeholder=samples[samples_keys[current_index]][4]
countdown.time=samples[samples_keys[current_index]][0]
make_next = False
mark=[]
==

title=Bind test

text==#|html|

==

form==#|html|

==

evaluator== #|python|
# I did found this relatively efficient Livenshtein distance using Numpy
import numpy as np

def levenshtein(chaine1, chaine2):
    taille_chaine1 = len(chaine1) + 1
    taille_chaine2 = len(chaine2) + 1
    levenshtein_matrix = np.zeros ((taille_chaine1, taille_chaine2))
    for x in range(taille_chaine1):
        levenshtein_matrix [x, 0] = x
    for y in range(taille_chaine2):
        levenshtein_matrix [0, y] = y
    for x in range(1, taille_chaine1):
        for y in range(1, taille_chaine2):
            if chaine1[x-1] == chaine2[y-1]:
                levenshtein_matrix [x,y] = min(
                    levenshtein_matrix[x-1, y] + 1,
                    levenshtein_matrix[x-1, y-1],
                    levenshtein_matrix[x, y-1] + 1
                )
            else:
                levenshtein_matrix [x,y] = min(
                    levenshtein_matrix[x-1,y] + 1,
                    levenshtein_matrix[x-1,y-1] + 1,
                    levenshtein_matrix[x,y-1] + 1
                )
    return (levenshtein_matrix[taille_chaine1 - 1, taille_chaine2 - 1])

def make_text_exo(sample_meta):
    """
    Return the python string generating the text exercice adapted to meta information in argument
    """
    ans=sample_meta[3]
    ans+="<br /><br />"
    ans+="""
    <center>
    <div>
    <audio controls autoplay>
    """
    ans+='<source src="'+sample_meta[5]+'" type="audio/mp3">'
    ans+="""
        Votre navigateur ne supporte pas la lecture du clip audio.
    </audio>
    </div>
    </center>
    """
    return ans

def make_form(sample_meta):
    """
    Return the python string generating the form adapted to the meta information in argument
    """
    ans="""
    <br />
    <center><b>Temps restant : </b></center>

    {{ countdown|component }}

    <br />

    {{ inputbox|component}}
    """
    return ans


if make_next:
    make_next=False
    if current_index < number_of_sample:
        # Time to set the nest music sample with its question
        text=make_text_exo(samples[samples_keys[current_index]])
        form=make_form(samples[samples_keys[current_index]])
        inputbox.placeholder=samples[samples_keys[current_index]][4]
        countdown.time=samples[samples_keys[current_index]][0]
        make_next = False
        feedback=""

        # reset timer
        for e in countdown.actions:
            e['consumed'] = False
        
        grade = (sum(mark) // len(mark), feedback)
    else:
        # It's over thus it is time to provide final score
        text=""
        form=""
        nb_ok=mark.count(100)
        feedback="C'est fini, vous avez obtenu "+str(nb_ok)+" réponses correctes sur "+str(number_of_sample)+" questions."
        grade = (sum(mark) // len(mark), feedback)

else:

    if levenshtein(samples[samples_keys[current_index]][2], inputbox.value) <= samples[samples_keys[current_index]][1]:
        mark.append(100)
        feedback = "Vous avez trouvé la bonne réponse en " + str(samples[samples_keys[current_index]][0] - countdown.time) + " secondes."
    else:
        mark.append(0)
        feedback = "Non, ce n'est pas la bonne réponse."

    text=""
    current_index += 1
    form = "<br />{{ countdown|component }} <br /><br />Attendez calmement le démarrage du prochain morceau..."
    make_next = True
    countdown.time = 10

    # reset timer
    for e in countdown.actions:
        e['consumed'] = False

    grade = (sum(mark) // len(mark), feedback)
==