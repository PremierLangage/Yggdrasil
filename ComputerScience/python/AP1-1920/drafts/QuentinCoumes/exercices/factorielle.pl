extends = ../templates/generic/generic.pl

author = Quentin Coumes

title = Factorielle

text==
On suppose qu'il existe une variables `n` de valeur entière strictement positive.  

Écrivez un programme qui affiche les `n` premières valeurs de la fonction factorielle
sous la forme `n! = x` (une valeur par ligne).

Pour `n = 4`, le programme devra par exemple afficher:
<pre><code>
0! = 1
1! = 1
2! = 2
3! = 6
4! = 24
</code></pre>

___
==

grader== #|python|
import random

def fact(n, current=1, s=""):
    if n == 0:
        return "0! = 1\n" + s
    return fa

begin_test_group("1 <= n <= 9")
for i in range(1, 10):
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output(f"{fact(i)}\n")
end_test_group()

begin_test_group("Valeurs aléatoires")
for i in range(3):
    i = random.randint(30, 200)
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output(f"{fact(i)}\n")
end_test_group()
==


