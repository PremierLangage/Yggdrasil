
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

# author = Zip

title = Valeur absolue

text==
On suppose qu'il existe une variable `n` de valeur entière.

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
import math
print("\n".join(f"{i}! = {math.factorial(i)}" for i in range(n + 1)))
del math
==
# A priori la solutions que les étudiants vont prendre est celle là :
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé
# f = 1
# for i in range(n+1):
#    print(str(i) + "!" + " = " + str(f))
#    f*=i+1


