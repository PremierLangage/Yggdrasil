"""
Author : Antonin JEAN
Date : 15/05/2023

-*-
Handles the graph generation using chart.js
Currently only being able to generate histograms

Contact: ofghanirre@gmail.com
"""

import json,sys
from typing import Tuple

# Globals
SCRIPT = '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>'
# ---

def count_occurences(votes : list, labels : list) -> dict:
    occurrences = {l : 0 for l in labels}
    for vote in votes:
        print(vote, occurrences, file=sys.stderr)
        if vote in occurrences:
            occurrences[vote] += 1
        else:
            occurrences[vote] = 1
    return occurrences

def generate_histogram_data(votes : list, labels : list) -> Tuple[list, list]:
    occurrences = count_occurences(votes, labels)
    return list(occurrences.keys()), list(occurrences.values())

import random
import colorsys

def generate_color_palette(n, alpha, _seed):
    palette = []
    random.seed(_seed)
    # Générer une couleur de départ aléatoire
    initial_hue = random.random()  # Valeur de teinte aléatoire entre 0 et 1
    initial_rgb = colorsys.hsv_to_rgb(initial_hue, 1, 1)
    palette.append(initial_rgb)

    # Générer les couleurs harmonieuses
    for _ in range(n - 1):
        previous_hue = colorsys.rgb_to_hsv(*palette[-1])[0]
        new_hue = (previous_hue + random.uniform(0.1, 0.4)) % 1.0
        new_rgb = colorsys.hsv_to_rgb(new_hue, 1, 1)
        palette.append(new_rgb)

    # Convertir les couleurs en format rgba(r, g, b, a)
    palette = [f"rgba({int(r * 255)}, {int(g * 255)}, {int(b * 255)}, {alpha})" for r, g, b in palette]
    return palette

def generer_histogramme(
        votes : list, 
        id : str, 
        labels : list, 
        title : str             = "Statistiques",
        backgroundColor : str   = 'rgba(75, 192, 250, 0.42)',
        borderColor : str       = 'rgba(75, 192, 250, 1)',
        borderWidth : int       = 1,
        horizontale = False) -> str:
    # Extraire les valeurs
    seed = random.randint(1, 42000)
    valeurs, frequences = generate_histogram_data(votes, labels)
    # Créer le dictionnaire de données pour Chart.js
    donnees = {
        'labels': valeurs,
        'datasets': [{
            'label': 'Fréquence des valeurs',
            'data': frequences,
            'backgroundColor': generate_color_palette(len(valeurs), 0.8, seed),
            'borderColor':  generate_color_palette(len(valeurs), 1.0, seed),
            'borderWidth': borderWidth
        }],
        'title': title
    }
    
    # Convertir les données en JSON
    donnees_json = json.dumps(donnees)

    # Générer le code HTML et JavaScript correspondant à l'histogramme
    html = f'''
        <hr>
        <canvas id="histogramme-{id}"></canvas>
        <script>
            document.addEventListener('DOMContentLoaded', function() {{
                var donnees = {donnees_json};
                var ctx = document.getElementById('histogramme-{id}').getContext('2d');
                new Chart(ctx, {{
                    type: 'bar',
                    data: donnees,
                    options: {{
                        indexAxis: {"'y'" if horizontale else "'x'"},
                        responsive: true,
                        scales: {{
                            y: {{
                                beginAtZero: true
                            }}
                        }},
                        plugins: {{
                            title: {{
                                display: true,
                                text: donnees.title
                            }}
                        }}
                    }}
                }});
            }});
        </script>
    '''
    return html