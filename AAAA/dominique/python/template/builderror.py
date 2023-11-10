import random


def randomText():
    return random.choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

def builderror(type=None):
    if type:
        return "pas de code",">>> a=1# Test de compilation\n"
    tic = randomText()
    code = f"""def f():\n   print("{tic}"\nprint()\n"""
    letest= f""">>> f()\n{tic}\n"""
    return code,letest
