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

def generer_histogramme(
        votes : list, 
        id : str, 
        labels : list, 
        title : str             = "Statistiques",
        backgroundColor : str   = 'rgba(75, 192, 250, 0.2)',
        borderColor : str       = 'rgba(75, 192, 250, 1)',
        borderWidth : int       = 1) -> str:
    # Extraire les valeurs
    valeurs, frequences = generate_histogram_data(votes, labels)
    # Créer le dictionnaire de données pour Chart.js
    donnees = {
        'labels': valeurs,
        'datasets': [{
            'label': 'Fréquence des valeurs',
            'data': frequences,
            'backgroundColor': backgroundColor,
            'borderColor': borderColor,
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