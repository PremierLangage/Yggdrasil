extends = ../templates/generic/generic.pl

author = Quentin Coumes

title = Factorielle

text==
On suppose qu'il existe une variables $%n%$ de valeur strictement positive.  
Ecrire un programme qui affiche les $%n%$ premières valeurs de la fonction factorielle (une valeur par ligne).
==

grader== #|python|
import random

def fact(n):
    if n == 1:
        return n
    return n*fact(n-1)

begin_test_group("1 <= n <= 10")
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

