#!/usr/bin/python3
import random

#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    General Public License for more details.
#
#  The full text of the GPL is available at:
#
#                  http://www.gnu.org/licenses/
#*****************************************************************************

r"""
This programme can generate unreal people with the following information

id(big int) : 
first_name(string) : 
last_name(string) : 
age(int 0 <--> 100 uniform) :               
activity_monday , activity thuesday , ... , activity sunday(empty string for no activity) :
number_day(int 0 <--> 28 uniform) : 
mounth(3letters string french values) : 
year(2019 - (0 <--> 19 square fonction of repartition))

All these generated with "french" values.
"""

prenom = ['Martin', 'Pierre', 'Jean', 'Jacob', 'Nicolas', 'Arthur', 'Remi', 
          'Vincent', 'Alain', 'Alex', 'Marie', 'Jessica', 'Jeremy', 'Anne', 
          'Olivier', 'Marc', 'Chloe', 'Claire', 'Josette', 'Claude', 'Sam', 
          'Sophie', 'Marise', 'Georgette', 'Denis', 'Marinette', 'Simone', 
          'Gedeon', 'Gerard', 'Robert', 'Gertrude', 'Goudroun', 'Kate', 
          'Katia', 'Fredric', 'Sylvain', 'Sylvie', 'Nathalie', 'Clara', 
          'John', 'Charles', 'Gilles', 'Martine', 'Nicole', 'Paul', 'Fati', 
          'Line', 'Heloise', 'Penelope', 'Gauthier', 'Leon', 'Jules', 'Oscar',
          'Lucien', 'Abdel', 'Helene', 'Appoline', 'Pauline', 'Lucie',
          'Manon', 'Jade', 'Louise', 'Louis', 'Alice', 'Camille', 'Lea',
          'Emma', 'Charlotte', 'Hugo', 'Tom', 'Sacha', 'Baltazar', 'Gabriel', 
          'Didier', 'Emilie', 'Adel', 'Adrien', 'Adam', 'Bernard', 'Bastien',
          'Beatrice', 'Babette', 'Capucine', 'Carlos', 'Carole', 'Coralie',
          'Cassandre', 'Daniel', 'Derek', 'Emile', 'Elena', 'Eleonore',
          'Elga', 'Emmie', 'Emanuel', 'Emanuelle', 'Emeric', 'Eudeline', 
          'Erwan', 'Eugene', 'Ernest', 'Basile', 'Eve', 'Farid', 'Felicie',
          'Felix', 'Ferdinand', 'Fiona', 'Fabio', 'Firmin', 'Florine',
          'Francesco', 'Florie', 'Fleur', 'Flavia', 'Fritz', 'Frida',
          'Gaby', 'Gary', 'Germain', 'Germaine', 'Gervais', 'Gervaise',
          'Greg', 'Gui', 'Guilain', 'Aziz', 'Amir', 'Hanz', 'Pedro',
	  'Yvan', 'Ruan', 'Mohamed', 'Medhi', 'Rayane', 'Fatima', 'Yasmine',
	  'Assia', 'Lina', 'Noor', 'Maryam', 'Juan', 'Lionel', 'Natasha',
	  'Agata', 'Akim', 'Anastasia', 'Viktor', 'Feodor', 'Eva', 'Boris',
	  'Lana', 'Veronika', 'Masha']

nom = ['Terrieur', 'Teusemanie', 'Macape', 'Durand', 'Perichon',
       'Dupont', 'Faure', 'Goku', 'Suffit', 'Fonsec', 'Toulmonde', 'Fine', 
       'Fourrier', 'Kramer', 'Muller', 'Smith', 'Roussel', 'Jeanmasson', 
       'Kerry', 'Chakri', 'Vandel', 'Marques', 'Citonio', 'Paoli', 'Ait', 
       'Benafia', 'Kamouche', 'Cruz', 'Ricard', 'Pernot', 'Martini',
       'Ricci', 'Fernandez', 'Damiens', 'Pilaud', 'Tartenpion', 'Dubois', 
       'Petit', 'Leroy', 'Moreau', 'Mercier', 'Roux', 'Fournier', 'Guerrin',
       'Blanc', 'Rousseau', 'Perrin', 'Chevalier', 'Robin', 'Legrand', 
       'Duval', 'Boyer', 'Lemaire', 'Dumas', 'Perez', 'Leroux', 'Brun',
       'Caron', 'Auber', 'Leclerc', 'Vidal', 'Dupuis', 'Moulin', 'Lecomte',
       'Aichoun', 'Lavigne', 'Blondel', 'Masson', 'Sanchez', 'Fleury',
       'Carpentier', 'Fabre', 'Rodriguez', 'Boulanger', 'Pasquier', 'Huet', 
       'Breton', 'Bouvier', 'Leduc', 'Leveque', 'Klein', 'Mallet', 'Barre',
       'Gomez', 'Weber', 'Marechal', 'Millet', 'Maury', 'Leger', 'Pichon',
       'Besson', 'Rossi', 'Chauvin', 'Hernandez', 'Delattre', 'Lejeune', 
       'Verdier', 'Coste', 'Guillon', 'Bousquet', 'Perret', 'Lamy', 'Dos', 
       'Sacomano', 'Angelie', 'Afonso', 'Roche', 'Schmitt', 'Barbier', 
       'Perrot', 'Guichard', 'Carlier', 'Joly', 'Spatoulatshi', 'Brunet',
       'Peltier', 'Hamel', 'Navarro', 'Keller', 'Dos Santos', 'Schwartz',
       'Ben Salmane', 'Bakri', 'Khoury', 'Bouazizi', 'Malhi', 'Zenati']

clubs = ['Poterie', 'Pate a sel', 'Piano', 'Histoire', 'Cinema', 'Theatre',
         'Danse', 'Art plastique', 'Yoga', 'Sport', 'Chorale', 'Sophrologie',
         'Anglais', 'Cirque', 'Cuisine', 'Couture']

def gen_id():
    return str(random.randint(1, 999999999))

def gen_first_name():
    return random.choice(prenom)

def gen_last_name():
    return random.choice(nom)

def gen_age():
    return str(random.randint(1,100))

def make_clubs():
    L = []
    for i in range(7):
        if random.randint(1,100) < 20:
            L.append(random.choice(clubs[((len(clubs)-1) // 6) * ((i+1)%3) : len(clubs) // ((i%3)+1)]))
        else:
            L.append("")
    return ",".join(L)

def make_date():
    mois = ['Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jun', 'Jui', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec']
    annee = 2019 - int(20*(random.random()**2))
    return ":".join([str(random.randint(1,28)), random.choice(mois), str(annee)])

def gen_line():
    print(":".join([gen_id(), gen_first_name(), gen_last_name(), gen_age(), make_clubs(), make_date()]))

for i in range(2247):
    gen_line()



