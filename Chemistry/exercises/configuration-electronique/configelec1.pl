title= Configuration Electronique 

author= I. Navizet 

form=@ /form/simpletextform.html 

@ /builder/before.py [builder.py]

@ verif.py
grader=@ /grader/evaluator.py

@ /utils/sandboxio.py 

text="Quelle est la configuration éléctronique de l'élément {{name}} ? Pour être validé dans l'application, on notera 1s2 2s2 2p6...sans mettre en exposant le nombre d'électrons"

before==
import random

table=[("Hydrogène ,H 	",1 ),("Hélium    ,He 	",2 ),("Lithium   ,Li 	",3 ),("Berryllium,Be 	",4 ),("Bore 	   ,B 	",5 ),("Carbone   ,C 	",6 ),("Azote 	   ,N 	",7 ),("Oxygène   ,O 	",8 ),("Fluor 	   ,F 	",9 ),("Néon 	   ,Ne 	",10),("Sodium    ,Na 	",11),("Magnésium ,Mg 	",12),("Aluminum  ,Al 	",13),("Silicium  ,Si 	",14),("Phosphore ,P 	",15),("Soufre    ,S 	",16),("Chlore    ,Cl 	",17),("Argon 	   ,Ar 	",18),("Potassium ,K 	",19),("Calcium   ,Ca 	",20),("Scandium  ,Sc 	",21),("Titane    ,Ti 	",22),("Vanadium  ,V 	",23),("Chrome    ,Cr 	",24),("Manganèse ,Mn 	",25),("Fer 	   ,Fe 	",26),("Cobalt    ,Co 	",27),("Nickel    ,Ni 	",28),("Cuivre    ,Cu 	",29),("Zinc 	   ,Zn 	",30),("Gallium   ,Ga 	",31),("Germanium ,Ge 	",32),("Arsenic   ,As 	",33),("Sélénium  ,Se 	",34),("Brome 	   ,Br 	",35),("Krypton   ,Kr 	",36)]
name, a = random.choice(table)
#random.randint(1,36)


==


evaluator==
import traceback
import sys

import verif
failure_feedback = """
<div style="background-color:darkred;color:white;padding:4px">
    Mauvaise réponse. <br><br>
    Votre réponse est:response['txt_answer'].lower()
    <br>
    La bonne réponse est: verif.strfromz(a)
    <br>
</div>
"""

success_feedback = """
<div style="background-color:darkgreen;color:white;padding:4px">
    Félicitations ! <br>
    La bonne réponse est: verif.strfromz(a)
    <br>
    Votre réponse est: response['txt_answer'].lower()
<br>
"""


try: 
    print("la bonne réponse est:",verif.strfromz(a),"votre response est :", response['txt_answer'].lower(), file=sys.stderr)
    if verif.verif(response['txt_answer'].lower(),a) :
        grade = (100, success_feedback)
    else:
        grade = (0, failure_feedback)
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer une configuration comme dans l'exemple")
==





