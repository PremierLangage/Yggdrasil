extends = /AAAA/ThomasSaillard/EmbeddedDB/activities/MatchListSurvey.pl

title= MatchList Probleme Etudiants

text==
Relier chaque problème "vos étudiants" à sa solution 
==

teacher_name=revuz

beforeB==
import random
random.seed(0)
a,b = 3,5
matcl=[]
for op in ['+','-','/','//','%','*','**']:
    matcl.append( str(a)+op+str(b)+','+str(eval(str(a)+op+str(b))))
    matcl.append(str(b)+op+str(a)+','+str(eval(str(b)+op+str(a))))


matches = "\n".join(random.sample(matcl,8))

==


matches==
5/3,1.6666666666666667
3+5,8
5**3,125
3//5,0
5*3,15
3-5,-2
3**5,243
==

Xmatches==
ont besoin d’entraînement, exercice répétable aléatoires
n'apprennent pas le cours, Quizz pré-cours
s'ennuient, Activité hors programme 
se perdent, Ontologies support
sont très hétérogènes en niveaux, Etayage
apprennent mal, analyse de parcours
ne sont pas critiques, Evaluation par les pairs
ne sont pas engagés, ludification et réussite
==

multiple = True

evaluator==#|py|
score = max(0, (8 - nombre_erreurs)) * 100 / 8
==

# options
include_stats_score = True
include_stats_participation = True
