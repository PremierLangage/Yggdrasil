
title= De l'elec 
tag= electronique 


# ce code permet d'ajouter des qestions 
buildquestions==


import random
Xintensite=random.randint(2,5)
Xfrequence=20*random.randint(2,15)
l = [("",0,"0°"),("-\pi",-3.14,"12°"),("-\pi",-3.14,"12°"),("-\pi",-3.14,"12°"),("\pi",3.14,"13°"),("-\pi/2",3.14/2,"14°"),("-\pi/4",3.14/4,"15°")]
triple=random.choice(l)
XdecalageS,Xdecalage,rep = triple
signalX=f"{Xintensite}cos({Xfrequence}t {XdecalageS})"


text=f"""

Soit le signal $%x(t)%$ définis par :

$%x(t)={signalX}%$ 

Quelle est la phase à l'origine du signal, $%x(t)%$.
"""
title ="$% \\frac{R(R+j\omega L)}{2R+j\omega L}%$"
good=rep
bad = "\n".join([z for x,y,z in l if z != rep])


==

extends=/model/AMC_TXT.pl
questions==


* On considère les signaux $%x(t)%$ et $%y(t)%$ définis par  <br/>
  $%x(t)= 2cos(300t-\pi/4)%$  et <br/>
  $%y(t)= sin(300t)%$<br/>
   *Cochez les affirmations correctes.*
+ La fréquence du signal est $%good%$ Hz
- La fréquence du signal est $% bad %$ Hz
- La fréquence du signal est $% worst %$ Hz
- La fréquence du signal est $% nil %$ Hz

* On considère les signaux $%x(t)%$ et $%y(t)%$ définis par  <br/>
  $%x(t)= 2cos(300t-\pi/4)%$  et <br/>
  $%y(t)= sin(300t)%$<br/>
   *Cochez les affirmations correctes.*
+ La valeur efficace du signal est $%2%$ 
- La valeur efficace du signal est $%1/\sqrt{2}%$ 
- La valeur efficace du signal est $%\sqrt{2}%$ 
- La valeur efficace du signal est $%2\sqrt{2}%$ 


* On considère les signaux $%x(t)%$ et $%y(t)%$ définis par  <br/>
  $%x(t)= 2cos(300t-\pi/4)%$  et <br/>
  $%y(t)= sin(300t)%$<br/>
  Quelle est la phase à l'origine du signal
+ 30°
- 135°
- -45°
- 45°

* On considère les signaux $%x(t)%$ et $%y(t)%$ définis par  <br/>
  $%x(t)= 2cos(300t-\pi/4)%$  et <br/>
  $%y(t)= sin(300t)%$<br/>
   *Cochez les affirmations correctes.*
+ Le signal $%x(t)%$ est en avance de phase par rapport au signal $%y(t)%$.
- Les signaux $%x(t)%$ et $%y(t)%$ sont en phase.
- Le signal $%x(t)%$ est en retard de phase par rapport au signal $%y(t)%$.
- Le signal $%x(t)%$ est en retard ou en avance de phase par rapport au signal $%y(t)%$ suivant l'instant t d'observation.
- Les signaux $%x(t)%$ et $%y(t)%$ sont déphasés.

* On considère les signaux $%x(t)%$ et $%y(t)%$ définis par  <br/>
  $%x(t)= 2cos(300t-\pi/4)%$  et <br/>
  $%y(t)= sin(300t)%$<br/>
 Quel est le phaseur du signal $%y(t)%$ ?
+ $%20e^{j0}%$
- $%20e^{j\pi/2}%$
- $%20e^{j300}%$
- $%20e^{-j\pi/2}%$

==
