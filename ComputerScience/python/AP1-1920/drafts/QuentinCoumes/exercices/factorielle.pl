extends = ../templates/generic/generic.pl

# author = Quentin Coumes

title = Factorielle

text==
On suppose qu'il existe une variables `n` de valeur entière strictement positive.  

Écrivez un programme qui affiche les `n` premières valeurs de la fonction factorielle
sous la forme `n! = x` (une valeur par ligne).
___
Pour `n = 5`, le programme devra par exemple afficher:
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
import math
import random

begin_test_group("0 <= n <= 9")
for i in range(10):
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output("".join(f"{j}! = {math.factorial(j)}\n" for j in range(i + 1)))
end_test_group()

begin_test_group("Valeurs aléatoires")
for i in range(5):
    i = random.randint(30, 200)
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output("".join(f"{j}! = {math.factorial(j)}\n" for j in range(i + 1)))
end_test_group()
==


soluce==
import math
print("\n".join(f"{i}! = {math.factorial(i)}" for i in range(n + 1)))
del math
==


