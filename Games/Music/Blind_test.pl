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
url_sample15 =$ Samples/tennessee.mp3
url_sample16 =$ Samples/moi_lolita.mp3
url_sample17 =$ Samples/stairway.mp3
url_sample18 =$ Samples/sunday_bloody_sunday.mp3
url_sample19 =$ Samples/anarchy_in_the_uk.mp3
url_sample20 =$ Samples/basket_case.mp3
url_sample21 =$ Samples/creeps.mp3
url_sample22 =$ Samples/des_que_le_vent_soufflera.mp3
url_sample23 =$ Samples/encore_un_matin.mp3
url_sample24 =$ Samples/foule_sentimentale.mp3
url_sample25 =$ Samples/je_te_promets.mp3
url_sample26 =$ Samples/la_bamba.mp3
url_sample27 =$ Samples/les_champs_elysees.mp3
url_sample28 =$ Samples/les_corons.mp3
url_sample29 =$ Samples/paint_it_black.mp3
url_sample30 =$ Samples/redemption_song.mp3


logOnConsole==#|js|
// you may open the browser console to see the message
console.log('hello world');
==

before== #|python|
import random

# Change here to select the number of question outside all possibles samples
# Please provide more than 2 due to plural feedback formulation...
number_of_sample=8

samples = [[33, 2, "AC/DC", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample1],
[62, 3, "System of a down", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample2],
[113, 4, "Complètement siphoné", "Vous devez trouver <b>le nom du morceaux</b> pouvant être croisé sur la plateforme Youtube.", "Le nom du morceau", url_sample3],
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
[66, 4, "Pixies", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample14],
[62, 4, "Quelque chose de Tennessee", "Vous devez trouver <b>le titre de cette chanson</b> magnifiquement interprétée avec une flûte.", "Le titre de la chanson", url_sample15],
[69, 5, "Moi... Lolita", "Vous devez trouver <b>le titre de cette chanson</b> magnifiquement interprétée en sifflotant.", "Le titre de la chanson", url_sample16],
[50, 3, "Led Zeppelin", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample17],
[55, 4, "Sunday bloody sunday", "Vous devez trouver <b>le titre de cette chanson</b> magnifiquement interprétée avec une flûte.", "Le titre de la chanson", url_sample18],
[59, 4, "Sex Pistols", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "le nom du groupe", url_sample19],
[60, 4, "Green Day", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "le nom du groupe", url_sample20],
[68, 3, "Radiohead", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "le nom du groupe", url_sample21],
[43, 3, "Renaud", "Vous devez trouver <b>le nom de l'artiste</b> interprétant originellement ce morceaux.", "le nom de l'artiste", url_sample22],
[65, 3, "Jean-Jacques Goldman", "Vous devez trouver <b>le nom de l'artiste</b> interprétant originellement ce morceaux.", "Prénom et nom de l'artiste", url_sample23],
[52, 4, "Alain Souchon", "Vous devez trouver <b>le nom de l'artiste</b> interprétant originellement ce morceaux.", "Prénom et nom de l'artiste", url_sample24],
[63, 4, "Je te promets", "Vous devez trouver <b>le titre de la chanson</b> magnifiquement interprétée avec une flûte.", "le titre de la chanson", url_sample25],
[35, 4, "La bamba", "Vous devez trouver <b>le titre de la chanson</b> magnifiquement interprétée avec une flûte.", "le titre de la chanson", url_sample26],
[45, 4, "Joe Dassin", "Vous devez trouver <b>le nom de l'artiste</b> interprétant originellement ce morceaux.", "Prénom et nom de l'artiste", url_sample27],
[58, 4, "Pierre Bachelet", "Vous devez trouver <b>le nom de l'artiste</b> interprétant originellement ce morceaux (hymne d'un stade du chnord).", "Prénom et nom de l'artiste", url_sample28],
[66, 5, "Rolling Stones", "Vous devez trouver <b>le nom du groupe</b> interprétant originellement ce morceaux.", "Le nom du groupe", url_sample29],
[81, 5, "Bob Marley", "Vous devez trouver <b>le prénom et le nom du chanteur</b> interprétant originellement ce morceaux.", "Le chanteur de cette chanson", url_sample30]]



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
tps_ans=[]
==

title=Le bind test du fou à la flûte

author=Nicolaï Nightmare

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


make_next = true
if make_next:
    make_next=False
    if current_index < number_of_sample:
        # Time to set the nest music sample with its question
        text=make_text_exo(samples[samples_keys[current_index]])
        form=make_form(samples[samples_keys[current_index]])
        inputbox.placeholder=samples[samples_keys[current_index]][4]
        countdown.time=samples[samples_keys[current_index]][0]
        inputbox.value=""
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
        feedback="C'est fini, vous avez obtenu "+str(nb_ok)+" r&eacute;ponses correctes sur "+str(number_of_sample)+" questions.<br /><br />"
        feedback+="Temps de r&eacute;ponse moyen : "+str(sum(tps_ans) / len(tps_ans))+" secondes.<br />"
        grade = (sum(mark) // len(mark), feedback)

else:
    dist_error = levenshtein(samples[samples_keys[current_index]][2], inputbox.value)
    if dist_error <= samples[samples_keys[current_index]][1]:
        mark.append(100)
        feedback = "Réponse donnée : "+inputbox.value+" (erreurs : "+str(int(dist_error))+")<br />"
        feedback += "Réponse attendue : <b>"+samples[samples_keys[current_index]][2]+"</b><br />"
        feedback += "Vous avez trouvé la bonne réponse en " + str(samples[samples_keys[current_index]][0] - countdown.time) + " secondes."
    else:
        mark.append(0)
        feedback = "Non, ce n'est pas la bonne réponse.<br />"
        feedback += "Réponse attendue : <b>"+samples[samples_keys[current_index]][2]+"</b>"

    tps_ans.append(samples[samples_keys[current_index]][0] - countdown.time)
    text=""
    current_index += 1
    form = "<br />{{ countdown|component }} <br /><br />Attendez calmement le démarrage automatique du prochain morceau..."
    make_next = True
    countdown.time = 8

    # reset timer
    for e in countdown.actions:
        e['consumed'] = False

    grade = (sum(mark) // len(mark), feedback)
==