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

 
    if type=="TypeError"





Bien sûr, voici plusieurs exemples différents de `TypeError` :

1. **Addition entre types incompatibles :**
    ```python
    result = "2" + 2
    ```

2. **Concaténation de types incompatibles :**
    ```python
    result = "Hello, " + 42
    ```

3. **Utilisation d'une liste comme index (nécessite un nombre entier) :**
    ```python
    my_list = [1, 2, 3]
    result = my_list["index"]
    ```

4. **Utilisation d'une chaîne de caractères comme opérande dans une multiplication :**
    ```python
    result = "abc" * "def"
    ```

5. **Concaténation de listes avec un entier :**
    ```python
    list1 = [1, 2, 3]
    list2 = list1 + 4
    ```

6. **Division entre types incompatibles :**
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

Ces exemples illustrent différents scénarios où une `TypeError` peut se produire en raison d'opérations entre types de données incompatibles en Python.