import random


def randomText():
    random.choice(["Hello World","Hello World!","Bienvenu !","Salut","Welcome !","Vitaj !","Üdvözöljük","Καλώς ορίσατε"])

def builderror(type=None):
    if not type:
        return "pas de code",">>> a=1\n"
    tic = randomText()
    code = f"""def f():\n   print("{tic}"\nprint()\n"""
    letest= f""">>> f()\n{tic}\n"""
    return code,letest