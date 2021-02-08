extends=/model/AMC_TXT.pl

title= Majorant-Minorant/Sup-Inf/Max-Min
tag= Majorant|Minorant|Borne supérieure|Borne inférieure 


# ce code permet d'ajouter des qestions 
questions==
    b=random.randint(1,10)
    a=random.randint(-10,0)

** Soit $%A=[{a} , {b}[%$ un intervalle dans $% \mathbb{R} %$. 
Cliquez sur les affirmations que vous pensez être correctes :
+ $%A%$ est borné
- $%{b | latex }%$ est le maximum de $%A%$
+ $%{a | latex }%$ est le minimum de $%A%$
- $%{b | latex }%$ est la borne supérieure de $%A%$
- $%{a | latex }%$ est la borne inférieure de $%A%$
==

questions==
    d=random.randint(1,10)
    c=random.randint(-10,0)
    e=c+1

** Soit $%B=]{c} , {d}]%$ un intervalle dans $% \mathbb{R} %$. 
Cliquez sur les affirmations que vous pensez être correctes :
+ $%B%$ est majoré 
- $%B%$ est minoré par {e}
- $%{c | latex }%$ est le minimum de $%B%$
+ $%{d | latex }%$ est le maximum de $%B%$
- $%{c | latex }%$ est la borne supérieure de $%B%$
- $%{d | latex }%$ est la borne inférieure de $%B%$
==