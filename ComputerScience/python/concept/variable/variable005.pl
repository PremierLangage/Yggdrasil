


author=DR
title= Je sais iniitaliser une variable de type {{ts}}
tag=variable|str
text==


Intialisez la  variable *{{ name }}* avec une valeur de type {{ts}}  


==

@ /builder/before.py [builder.py]


seed=3



before==
import random
if seed:
    random.seed(seed)

lt=[bool,str,int,float,type(None)]
ls=['bool','str','int','float','None']
names=['truc','machin','isola','varname','x','y','spqr','add','aku','akira','buzz','roméo','juliette','montague','capulet','upem','uge','AP1','python','python3']

name= random.choice(names)
tt,ts=random.choice(list(zip(lt,ls)))

pltest0=f'''#Déclaration
>>> "vous n'avez pas déclaré de variable {name} !" if "{name}" not in locals() or "{name}" not in globals() else "OK." # Déclaration de la variable {name}
'OK.'
'''


pltest1= f"""
>>> type({name}) == {ts} # la variable est du bon type 
True
""" 
==

code==

==



extends=/ComputerScience/python/template/pltest.pl







