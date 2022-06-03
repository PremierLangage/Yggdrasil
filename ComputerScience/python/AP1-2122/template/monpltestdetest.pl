






extends = pltest2022.pl 

title= Test de pltest2022 
text==

le test utilise le code suivant :

    def f(n):
        return 2*n
    
    k = f(6)
    def g(p):
        return f(p-1)+f(p+1)
    
    s='chaine'

==

testname0=Tests de base sans commentaires
pltest0==
>>> f(10) == 20
True
>>> f(12)
24
>>> 'k' in globals()
True
>>> 'g' in globals() and type(g)=='function'
True
==