
import matplotlib.pyplot as plt
import numpy as np
from random import shuffle

def draw_hist(data):
    # Generate some random data

    # Obtenir les clés et les valeurs du dictionnaire
    keys = [('\n' if i % 2 else '') + f"{list(data.keys())[i]}" for i in range(len(data.keys()))]
    values = list(data.values())

    # Créer un tableau de couleurs à partir d'une colormap personnalisée
    cmap = plt.colormaps['tab20c']
    colors = [cmap(i) for i in range(len(keys))]

    # Créer l'histogramme avec les valeurs du dictionnaire et les étiquettes pour chaque barre
    plt.bar(keys, values, color=colors, tick_label=keys)

    for i, v in enumerate(values):
        plt.text(i, v+.05,  str(v), color='blue', fontweight='bold', ha="center")

    # Ajouter des étiquettes d'axe et une légende
    plt.xlabel('Choix')
    plt.ylabel('Valeurs')
    return plt.gcf()



def draw_camembert(data):
    # Obtenir les clés et les valeurs du dictionnaire
    keys = list(data.keys())
    values = list(data.values())

    cmap = plt.colormaps['tab20c']
    colors = [cmap(i) for i in range(len(keys))]

    plt.pie(values, labels=data, colors=colors, 
            autopct='%1.1f%%', shadow=True, startangle=90)

    plt.axis('equal')
    return plt.gcf()
