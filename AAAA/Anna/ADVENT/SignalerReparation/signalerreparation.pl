extends = /gift/templates/qnumericset.pl

@ /builder/before.py [builder.py]
@sol.py [build.py]
@ennonce.md
@exemple


title= Signaler Reparation

text==

{{lenonce}}

La liste des informations est dans le fichier "data" .

Comme d'habitude vous avez un fichier "exemple" pour lequel la bonne reponse est : 


==

choices==
153837.0:0.0 #Bravo !Vous avez tous les points.
%50.0%153837.0:100.0 #Il a écrit 153 837 vers. Votre réponse était pas mal proche, vous avez la moitié des points.
%33.0%153837.0:500.0 #Il a écrit 153 837 vers. Votre réponse était pas mal proche, vous avez le tiers des points.
%25.0%153837.0:1000.0 #Il a écrit 153 837 vers. Votre réponse était un peu proche, vous avez le quart des points.
== 


before==
import g

with open("ennonce.md","r") as f:
    lenonce = f.read()

r = getQ()

choices = r

==


