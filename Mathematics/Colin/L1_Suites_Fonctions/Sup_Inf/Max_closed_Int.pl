extends=/model/AMC_TXT.pl

title= Majorant-Minorant/Sup-Inf/Max-Min
tag= Majorant|Minorant|Borne supérieure|Borne inférieure 


# ce code permet d'ajouter des qestions 
questions==
    b=random.randint(1,10)
    a=random.randint(-10,0)

    d=random.randint(1,10)
    c=random.randint(-10,0)
    e=c+1

** Soit $%A=[{a} , {b}[%$ un intervalle dans $% \mathbb{R} %$. 
Cliquez sur les affirmations que vous pensez être correctes :
+ $%A%$ est borné
- $%{b}%$ est le maximum de $%A%$
+ $%{a}%$ est le minimum de $%A%$
- $%{b}%$ est la borne supérieure de $%A%$
- $%{a}%$ est la borne inférieure de $%A%$



** Soit $%B=]{c} , {d}]%$ un intervalle dans $% \mathbb{R} %$. 
Cliquez sur les affirmations que vous pensez être correctes :
+ $%B%$ est majoré 
- $%B%$ est minoré par {e}
- $%{c}%$ est le minimum de $%B%$
+ $%{d}%$ est le maximum de $%B%$
- $%{c}%$ est la borne supérieure de $%B%$
- $%{d}%$ est la borne inférieure de $%B%$
==