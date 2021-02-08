extends=/model/AMC_TXT.pl

title= Majorant-Minorant/Sup-Inf/Max-Min
tag= Majorant|Minorant|Borne supérieure|Borne inférieure 


# ce code permet d'ajouter des qestions 
buildquestions==
import random
# questions=""
for toto in range(1):
    b=random.randint(1,10)
    a=random.randint(-10,0)

** Soit $%A=[{a} , {b}[%$ un intervalle dans $% \mathbb{R} %$. 
Cliquez sur les affirmations que vous pensez être correctes :
+ $%A%$ est borné
- $%{b | latex }%$ est le maximum de $%A%$
+ $%{a | latex }%$ est le minimum de $%A%$
- $%{b | latex }%$ est la borne supérieure de $%A%$
- $%{a | latex }%$ est la borne inférieure de $%A%$
"""
==