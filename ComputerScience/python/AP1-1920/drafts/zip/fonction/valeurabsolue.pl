
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

# author = Zip

title = Valeur absolue

text==
On suppose qu'il existe une variable `n` de valeur numérique.

Écrivez une fonction  qui renvoie la valeur absolue de son paramètre

___
==

grader== #|python|


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
def abs(x):
    if x<0:
        x=-x
    return x
