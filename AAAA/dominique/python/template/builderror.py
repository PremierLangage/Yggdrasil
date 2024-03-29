from random import *


def randomText():
    return  choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

ERRORLIST=["SyntaxeError","IndentationError","NameError","errortypeError","ValueError","IndexError"]


def builderror(errortype):
    tic = randomText()
    if errortype in  ERRORLIST:
        pass
    else:
        errortype = choice(ERRORLIST)

    if errortype=="SyntaxeError":
        r=randint(1,7)
        if r==1:
            code = f"""def f():\n   print("{tic}"\nprint()\n"""
            letest= f""">>> f()\n{tic}\n"""
            hint = "\nParenthèse sur la ligne au dessus."
        elif r==2:
            code = f"a = 1, b = 2"
            letest= ">>> a==1 and b==2\nTrue"
            hint = "\nUtiliser une affectation multiple"
        elif r==3:
            code = f"def f():\n   print '{tic}' \n"
            letest=f">>> f()\n{tic}\n"
            hint = "\nPrint est une fonction\n"
        elif r==4:
            code=f"""numbers = (1, 2, 3,),"""
            letest=f""">>> numbers==(1, 2, 3)\nTrue\n"""
            hint="\nLa virgule\n"
        elif r==5:
            code = f"""def f():\n   print('{tic}")\nprint()\n"""
            letest= f""">>> f()\n{tic}\n"""
            hint="\nGuillemets != apostrophe\n"
        elif r==6:
            code = f"""def f()\n   print("{tic}")\nprint()\n"""
            letest= f""">>> f()\n{tic}\n"""
            hint="\nDeux points : \n"
        elif r==7:
            code = f"""def f():\n   return  (1, 2, 3,))\nprint()\n"""
            letest= f""">>> f()== (1, 2, 3)\nTrue\n"""
            hint="\nParenthèses\n"
        
        return code,letest, hint

    if errortype=="IndentationError":
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

    if errortype=="NameError":
        p=choice("abcdeghijklmopqrstuvxyz")
        code = f"""def f(n):\n   if {p}: # parametre de la fonction\n       print("{tic}")\nprint()\n"""
        letest= f""">>> f(True)\n{tic}\n"""
        return code,letest, "Mauvais nom de variable peut être."

    fname = choice(["access","append","livi","push","pull","foo","bar","fubar","glop","pasglop"])
    if errortype=="errortypeError":
        r =randint(1,5)
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
    if errortype == "ValueError":
        code=f"""print(int("{randomText()}"))\n# peu probable de corriger cela n'a pas de sens\n"""
        hint ="\n Un programme vide fonctionnera très bien ici ! \n"
        letest = ">>> True # Je vous ai dit que l'on ne peut pas corriger \nTrue"
        return code,letest,hint

    if errortype == "IndexError" :
        if randint(1,10) <7:
            code = """
def printList(l):
    i=0
    while i <= len(l):
        print(l[i])
        i=i+1
"""
            letest= """
>>> printList([0,1])
0
1
>>> printList([17,89])
17
89
"""
            hint = "\nles listes sont indicées de 0,n-1"
            return code,letest,hint
        else:
            code = """
def addList(l,value):
    l[len(l)] = value
"""
            letest= """
>>> def printList(l):
...    i=0
...    while i <= len(l):
...        print(l[i])
...        i=i+1
...
>>> l=[0]
>>> addList(l,1)
>>> printList(l)
0
1
>>> l=[17]
>>> addList(l,89)
>>> printList(l)
17
89
"""
            hint = "\nles listes sont indicées de 0,n-1\n utilisez append pour ajouter à la fin."
            return code,letest,hint