
import matplotlib.pyplot as plt
import numpy as np
from random import shuffle
import mpld3
from mpld3 import plugins

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


def draw_graphs(data):
    # Size are multiplied by 100 pixels to state the final static const size of the graph
    WIDTH = 10
    HEIGHT = 4
    # ---

    keys = list(data.keys())
    values = list(data.values())

    # Colors initialisation (20 differents colors)
    cmap = plt.colormaps['tab20c']
    colors = [cmap(i) for i in range(len(keys))]

    fig, axs = plt.subplots(nrows=1, ncols=3, figsize=(WIDTH, HEIGHT), gridspec_kw={'width_ratios': [4, 5, 1], 'wspace': 0.5})

    # Sous-graphe 1 : Camembert
    axs[0].pie(values, colors=colors, 
            autopct='%1.1f%%', startangle=90)
    axs[0].axis('equal')
    axs[0].set_title('Proportions')


    # Sous-graphe 2 : Histogramme
    # je redéfinis un set de clés pour intégrer un affichage 1 ligne sur 2
    bars = axs[1].bar(keys, values, color=colors, tick_label=keys)
    axs[1].set_title('Histogramme')
    for i, v in enumerate(values):
        axs[1].text(i, v+.05,  str(v), color='blue', fontweight='bold', ha="center")
    
    labels = [f'{k}' for k in keys]
    axs[2].legend(axs[2].bar(keys, [0 for i in keys], color=colors, tick_label=keys), labels, loc='upper center')
    axs[2].set_title('Légendes')

    return mpld3.fig_to_html(fig, no_extras=False, template_type='simple')
