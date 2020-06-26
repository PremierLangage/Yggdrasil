#!/usr/bin/python3
import random

#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

"""
This programme can generate unreal products with the following information

id : a primary key as an integer 
name : a type of product
color : a color
weight : a weight either in kg or in gr
quantity : an integer for the availlable quantity
date : number of the day thus month thus year (the date that the product is entered in catalog)

All these generated with "french" values.
"""

colors = ['noir', 'noir', 'noir', 'noir', 'noir', 'noir', 'noir',
          'blanc', 'blanc', 'blanc', 'blanc', 'blanc', 'blanc', 'blanc', 'blanc', 'blanc',
          'rouge', 'rouge', 'rouge', 'rouge',
          'bleu', 'bleu', 'bleu', 'bleu',
          'vert', 'vert', 'vert',
          'jaune', 'jaune', 'jaune',
          'violet', 'violet',
          'rose', 'rose',
          'pourpre',
          'turquoise',
          'rouge carmin',
          'gris', 'gris', 'gris', 'gris', 'gris', 'gris', 'gris',
          'marron','marron','marron',
          'chocolat',
          'parme',
          'saumon',
          'cyan',
          'magenta',
          'orange', 'orange', 'orange', 'orange',
          'beige', 'beige',
          'taupe',
          'argent',
          'or']

products = ['Lampe', 'Vase', 'Porte manteau', 'Tableau', 'Bougie',
            'Porte serviette', 'Dessous de plat', 'Rond de serviette', 'Main courrante',
            'Cache pot', 'Nappe', 'Toile cirée', 'Rideaux', 'Serviette', 'Assiette',
            'Coussin', 'Chemin de table', 'Coquetier', 'Horloge', 'Étagère',
            'Serre livre', 'Paillasson', 'Guirlande', 'Figurine', 'Lanterne', 'Cadre photo',
            'Jardinière', 'Statuette', 'Plante artificielle', 'Miroir', 'Plateau',
            'Fleurs sechées', 'Coupe', 'Porte journaux', 'Arrosoir']


def make_weight():
    if random.randint(0,1):
        return str(random.randint(10, 400)*10)+'gr'
    return str(random.randint(4, 200)/10.0)+'kg'

def gen_id(forbiden=[]):
    """
    Return a key as a string representing an integer not in the
    `forbiden` list.
    """
    pk = str(random.randint(100000000, 999999999))
    if pk not in forbiden:
        return pk
    else:
        return gen_id(forbiden=forbiden)

def gen_prod_name():
    return random.choice(products)

def gen_prod_color():
    return random.choice(colors)

def gen_quantity():
    if random.randint(0,2) != 0:
        if random.randint(0,1):
            return 2*gen_quantity()
        return gen_quantity()+1
    return 0

def make_date():
    mois = ['Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jun', 'Jui', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec']
    annee = 2019 - int(20*(random.random()**2))
    return ";".join([str(random.randint(1,28)), random.choice(mois), str(annee)])

def gen_line(forbiden=[]):
    id_line = gen_id(forbiden)
    name = gen_prod_name()
    color = gen_prod_color()
    while ((ord(name[0]) + ord(color[0])) % 3 == 0) and ((len(name) + len(color)) % 4 == 0):
        name = gen_prod_name()
        color = gen_prod_color()
    weight = make_weight()
    return ";".join([id_line, name, color, weight, str(gen_quantity()), make_date()])

keys_list = []
for i in range(7247):
    line = gen_line(forbiden=keys_list)
    print(line)
    keys_list.append(line.split(';')[0])


