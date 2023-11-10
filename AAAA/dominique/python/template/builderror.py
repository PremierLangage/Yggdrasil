from random import *


def randomText():
    return  choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

ERRORLIST=["SyntaxeError","IndentationError","NameError","TypeError"]

def randomError():
    return  choice(ERRORLIST)

def builderror(type=None):
    tic = randomText()
    if type in  ERRORLIST:
        pass
    elif type in range(len(ERRORLIST)):
        type = ERRORLIST[type]
    else:
        type = randomError()
    if type=="SyntaxeError":
        code = f"""def f():\n   print("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "Parenthèse sur la ligne au dessus."
    if type=="IndentationError":
        if randint(1,10) <7:
            code = f"""def f():\nprint("{tic}")\nprint()\n"""
            letest= f""">>> f()\n{tic}\n"""
            return code,letest, "PROBLÈME D'INDENTATION IL MANQUE UNE TAB."
        else:
            code = f"""
    def f(n):
    if n%2==0:
    print("{tic}")
    else:
    print("{randomText()}")
print()
            """
            letest= f""">>> f(0)\n{tic}\n"""
            return code,letest, "trop et pas asser de TABs."

    if type=="NameError":
        p=choice("abcdeghijklmopqrstuvxyz")
        code = f"""def f(n):\n   if {p}: # parametre de la fonction\n       print("{tic}")\nprint()\n"""
        letest= f""">>> f(True)\n{tic}\n"""
        return code,letest, "Mauvais nom de variable peut être."

    fname = choice(["access","append","livi","push","pull","foo","bar","fubar","glop","pasglop"])
    if type=="TypeError":
        r =randint(1,10)
        r=1
        if r==1:
            name, value = choice([("quatre",2),("cinq",3),("Sept",5)])
            op = choice("+/-")
            if value %2 :
                code = f"""def {name}():\n   return "2"{op}{value}\n """
            else:
                code = f"""def {name}():\n   return {value}{op}"2"\n """
            letest = f""">>> {name}()\n{value}\n"""
            hint="\nChaines et entiers ne font pas bon ménage."
            return code,letest,hint
        elif r== 2:
            value = randint(3,18)
            code = f"""
#pas de solution a l'erreur suivante 
# Faite que la fonction retourne un entier 
def {fname}():\n   return "{randomText()}"+{value}\n """
            letest = f""">>> type({fname}()) == type(3)\nTrue\n"""
            hint="\nChaines et entiers ne font pas bon ménage."
            return code,letest,hint
        elif r==3:
            if randint(1,10) <7:
                code = f"""def {fname}(l):\n   return l["index 0"] """
                letest = f""">>> {fname}([3,17,567]) == 3 \nTrue\n"""
                hint="\nLes indices dans les listes sont des entiers."
                return code,letest,hint
            else:
                code = f"""def {fname}(l):\n   return l["{fname}"] """
                letest = f""">>> {fname}([3,17,567]) == 3 \nTrue\n"""
                hint="\nLes indices dans les listes sont des entiers.\nUtilisez l'indice 0."
                return code,letest,hint
        elif r==4:
                tic = randomText()
                toc = randomText()
                code = f"""def {fname}(l):\n   return "{tic}"*" "*"" "{toc}" """
                letest = f""">>> {fname}()\n>>> {tic} {toc}\n"""
                hint="\nLes chaines s'additionnent mais ne se multiplient pas\n"
                return code,letest,hint
        elif r==5:
            # Concaténation de listes avec pas une liste 
            value = randint(3,88)
            code = f"""# L est une liste \ndef {fname}(l):\n   return l + {value}\n"""
            letest = f""">>> {fname}([0,1,2])\n[0, 1, 2, {value}]\n"""
            hint="\nIl est possible de concatener des listes.\n"
            return code,letest,hint
        elif r==6:
            #Division entre types incompatibles
            value = randint(3,88)
__doc__="""

    ```python
    result = 10 / "2"
    ```

7. **Utilisation d'une chaîne de caractères comme index dans une liste :**
    ```python
    my_list = [1, 2, 3]
    result = my_list["index"]
    ```

8. **Utilisation de `range` avec des chaînes de caractères :**
    ```python
    result = list(range("abc"))
    ```

9. **Soustraction entre types incompatibles :**
    ```python
    result = 5 - "2"
    ```

10. **Utilisation d'un dictionnaire comme index (nécessite un type hashable) :**
    ```python
    my_dict = {"key": "value"}
    result = my_dict["key", "another_key"]
    ```

Ces exemples illustrent différents scénarios où une `TypeError` peut se produire en raison d'opérations entre types de données incompatibles en Python."""
