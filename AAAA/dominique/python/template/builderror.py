from random import *


def randomText():
    return  choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

ERRORLIST=["SyntaxeError","IndentationError","NameError",]

def randomError():
    return  choice(ERRORLIST)

def builderror(type=None):
    tic = randomText()
    if type in range(len(ERRORLIST)):
        type = ERRORLIST[type]
    else:
        type = randomError()
    if type=="SyntaxeError":
        code = f"""def f():\n   print("{tic}"\nprint()\n"""
        letest= f""">>> f()\n{tic}\n"""
        return code,letest, "Parenthèse sur la ligne au dessus."
    if type=="IndentationError":
        if randint(1,10) <7:
            code = f"""def f():\nprint("{tic}"\nprint()\n"""
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
        code = f"""def f(n):\n   if p: # p parametre de la fonction\n   print("{tic}"\nprint()\n"""
        letest= f""">>> f(True)\n{tic}\n"""
        return code,letest, "PROBLÈME D'INDENTATION IL MANQUE UNE TAB."