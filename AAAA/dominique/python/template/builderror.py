import random


def randomText():
    return random.choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

def randomError():
    return random.choice(["SyntaxeError","IndentationError",])

def builderror(type=None):
    tic = randomText()
    type = randomError()
    if type=="SyntaxeError":
        code = f"""def f():\n   print("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "Parenthèse sur la ligne au dessus."
    if type=="IndentationError":
        code = f"""def f():\nprint("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "PROBLÈME D'INDENTATION IL MANQUE UNE TAB."
    