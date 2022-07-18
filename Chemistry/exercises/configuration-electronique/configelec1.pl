title= Configuration Electronique 

author= I. Navizet & DR

form=@ /form/simpletextform.html 

@ /builder/before.py [builder.py]

@ verif.py
grader=@ /grader/evaluator.py

@ /utils/sandboxio.py 

text==
Quelle est la configuration éléctronique de l'élément  **{{name}}** avec $%Z%$= {{Z}}  ?

Pour être validé dans l'application, on notera 1s2 2s2 2p6...sans mettre en exposant le nombre d'électrons (contrairement à ce qui est demandé dans une copie papier)
<br/>
<font font-size="10px" color="blue" > nbessai = {{nbessai}}; nbsuccess ={{nbsuccess}}</font>
==

nbessai % 0
nbsuccess % 0 

before==
import random

table=[("Hydrogène, H 	",1 ),("Hélium   , He 	",2 ),
    ("Lithium  , Li 	",3 ),("Berryllium,Be 	",4 ),("Bore 	  , B 	",5 ),
    ("Carbone, C 	",6 ),("Azote 	  , N 	",7 ),("Oxygène  , O 	",8 ),
    ("Fluor 	  , F 	",9 ),("Néon 	  , Ne 	",10),("Sodium   , Na 	",11),
    ("Magnésium, Mg 	",12),("Aluminum , Al 	",13),("Silicium , Si 	",14),
    ("Phosphore, P 	",15),("Soufre   , S 	",16),("Chlore   , Cl 	",17),("Argon 	  , Ar 	",18),
    ("Potassium, K 	",19),("Calcium  , Ca 	",20),("Scandium , Sc 	",21),("Titane   , Ti 	",22),
    ("Vanadium , V 	",23),("Chrome   , Cr 	",24),("Manganèse, Mn 	",25),("Fer 	  , Fe 	",26),
    ("Cobalt   , Co 	",27),("Nickel   , Ni 	",28),("Cuivre   , Cu 	",29),("Zinc 	  , Zn 	",30),
    ("Gallium  , Ga 	",31),("Germanium, Ge 	",32),("Arsenic  , As 	",33),("Sélénium , Se 	",34),
    ("Brome 	  , Br 	",35),("Krypton  , Kr 	",36)]
#table=[("Chrome   , Cr 	",24 ),("Cuivre   , Cu 	",29)]
name, Z = random.choice(table)
#random.randint(1,36)


==




failure_feedback==
<div style="background-color:darkred;color:white;padding:4px">
    Mauvaise réponse. Voir correction ci-dessous <br>
    Réssayez avec la question ci-dessus!
</div>
==

success_feedback==
<div style="background-color:green;color:white;padding:4px">
    Félicitations ! <br>
    Réssayez avec la question ci-dessus!
<br>
</div>
==





evaluator==
import traceback
import sys
import verif


try: 
    print("On vous a demandé la configuration du ",name.split(",")[0],"la réponse correcte est:",verif.strfromz(Z),file=sys.stderr)
    s=response['txt_answer'].lower()
    nbessai += 1
    if verif.verif(s,Z) :
        nbsuccess += 1
        grade = (100, success_feedback)
    else:
        print("La réponse que vous avez donnée est :", response['txt_answer'].lower(), file=sys.stderr)
        grade = (0, failure_feedback)
        print("Réessayez avec le nouvel élément donné ci-dessus")
    exec(before)
except:
    print(traceback.format_exc(), file=sys.stderr)
    grade = (-1, "Merci de rentrer une configuration comme dans l'exemple")
==










