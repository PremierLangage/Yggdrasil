import random


def randomText():
    return random.choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

def randomError():
    return random.choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

def builderror(type=None):
    if type:
        return "pas de code",">>> a=1# Test de compilation\n","Pas d'aide"
    tic = randomText()

    if type=="SyntaxeError":
        code = f"""def f():\n   print("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "Parenthèse sur la ligne au dessus."
    if type=="IndentationError":
        code = f"""def f():\nprint("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "PROBLÈME D'INDENTATION IL MANQUE UNE TAB."
    