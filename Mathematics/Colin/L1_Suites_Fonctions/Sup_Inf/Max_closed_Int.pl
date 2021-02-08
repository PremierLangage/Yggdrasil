

title= Majorant-Minorant/Sup-Inf/Max-Min
tag= Majorant|Minorant|Borne supérieure|Borne inférieure 


# ce code permet d'ajouter des qestions 
buildquestions==
import random
# questions=""
b=random.randint(1,10)
a=random.randint(-10,0)

questions += """
** Soit $%A=[{a | latex } , {b | latex }[%$ un intervalle dans $% \mathbb{R} %$. Cliquez sur les affirmations que vous pensez être correctes :
+ $%A%$ est borné
- $%{b | latex }%$ est le maximum de $%A%$
+ $%{a | latex }%$ est le minimum de $%A%$
- $%{b | latex }%$ est la borne supérieure de $%A%$
- $%{a | latex }%$ est la borne inférieure de $%A%$
"""

questions+="""