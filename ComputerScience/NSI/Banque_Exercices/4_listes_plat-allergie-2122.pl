# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title=Plat en tenant compte de l'allergie

text==
Après la pandémie du COVID-19, vous invitez votre meilleur ami chez vous pour finalement manger ensemble sans souci, et vous comptez préparer le meilleur plat.

Mais hélas, votre ami est allergique à pas mal de choses... Donc il faut éviter ces choses-là dans votre plat !

Tout ce que vous pouvez faire, c'est de comparer la liste des ingrédients de votre plat et la liste des aliments auxquels votre ami est allergique, 
et de supprimer les ingrédients présents sur la liste d'allergies.

Écrire une fonction ``eviter_allergie(ingredient, allergie)`` qui retourne une nouvelle liste d'ingrédients de votre plat qui ne provoquent pas l'allergie de votre ami.

**Les paramètres ne doivent pas être modifiés à la sortie de la fonction.**
==

editor.code==
==

tag=elementAccess|in|append

samplesol==
def eviter_allergie(l1, l2):
    res = []
    for e in l1:
        if e not in l2:
            res.append(e)
    return res

# Alternative
def eviter_allergie2(l1, l2):
    return [e for e in l1 if e not in l2]
==

pltest0==
>>> eviter_allergie([], [])
[]
>>> eviter_allergie(['oeuf', 'oignon', 'poivron', 'pomme de terre', 'sel', 'poivre'], ['poivron'])
['oeuf', 'oignon', 'pomme de terre', 'sel', 'poivre']
>>> eviter_allergie(['fromage', 'vin blanc', 'jambon', 'pomme de terre', 'salade'], ['poivron', 'poulet'])
['fromage', 'vin blanc', 'jambon', 'pomme de terre', 'salade']
>>> eviter_allergie(['lait', 'oeuf'], ['porc', 'boeuf', 'salade', 'orange'])
['lait', 'oeuf']
>>> eviter_allergie([], ['lait'])
[]
>>> eviter_allergie(['oeuf', 'oignon', 'poivron', 'pomme de terre', 'sel', 'poivre'], [])
['oeuf', 'oignon', 'poivron', 'pomme de terre', 'sel', 'poivre']
==

pltest1==
>>> plat = ['oeuf', 'oignon', 'poivron', 'pomme de terre', 'sel', 'poivre'] #
>>> allergie = ['poivron', 'poulet'] #
>>> eviter_allergie(plat, allergie)
['oeuf', 'oignon', 'pomme de terre', 'sel', 'poivre']
>>> plat
['oeuf', 'oignon', 'poivron', 'pomme de terre', 'sel', 'poivre']
>>> allergie
['poivron', 'poulet']
==


