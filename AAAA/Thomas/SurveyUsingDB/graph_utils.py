
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
    keys = list(data.keys())
    values = list(data.values())

    # Colors initialisation (20 differents colors)
    cmap = plt.colormaps['tab20c']
    colors = [cmap(i) for i in range(len(keys))]

    fig, axs = plt.subplots(nrows=1, ncols=3, figsize=(15, 5), gridspec_kw={'width_ratios': [14, 20, 1], 'wspace': 0.3})

    # Sous-graphe 1 : Camembert
    axs[0].pie(values, labels=data, colors=colors, 
            autopct='%1.1f%%', startangle=90)
    axs[0].axis('equal')

    # Sous-graphe 2 : Histogramme
    # je redéfinis un set de clés pour intégrer un affichage 1 ligne sur 2
    _keys = [('|\n' if i % 2 else '') + f"{list(data.keys())[i]}" for i in range(len(data.keys()))]

    axs[1].bar(_keys, values, color=colors, tick_label=_keys)
    axs[1].set_title('Histogramme')
    for i, v in enumerate(values):
        axs[1].text(i, v+.05,  str(v), color='blue', fontweight='bold', ha="center")
    
    # Sous-graphe 3 : Légende personnalisée
    legend_handles = []
    axs[2].axis('off')
    for i in range(len(keys)):
        legend_handles.append(axs[2].bar(0, 0, color=colors[i % len(colors)]))
    axs[2].legend(legend_handles, keys, loc='center')
    axs[2].axis('off')

    for i in range(3): axs[i].patch.set_alpha(0)

    """
    legend_plugin = plugins.InteractiveLegendPlugin(axs[2], [axs[2].bar(range(len(data)), values, align='center', alpha=0)], keys)
    plugins.connect(fig, legend_plugin)
    """
    return mpld3.fig_to_html(fig)
