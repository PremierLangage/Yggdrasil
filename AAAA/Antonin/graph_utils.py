import json

# Globals
script = '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>'
# ---

def count_occurences(votes : list) -> dict:
    occurrences = {}
    for vote in votes:
        if vote in occurrences:
            occurrences[vote] += 1
        else:
            occurrences[vote] = 1
    return occurrences

def generate_histogram_data(votes : list) -> tuple(list, list):
    occurrences = count_occurences(votes)
    return list(occurrences.keys()), list(occurrences.values())

def generer_histogramme(votes : list, question = str) -> str:
    # Extraire les valeurs
    valeurs, frequences = generate_histogram_data(votes)

    # Créer le dictionnaire de données pour Chart.js
    donnees = {
        'labels': valeurs,
        'datasets': [{
            'label': 'Fréquence des votes',
            'data': frequences,
            'backgroundColor': 'rgba(75, 192, 192, 0.2)',
            'borderColor': 'rgba(75, 192, 192, 1)',
            'borderWidth': 1
        }]
    }
    
    # Convertir les données en JSON
    donnees_json = json.dumps(donnees)

    # Générer le code HTML et JavaScript correspondant à l'histogramme
    html = f'''
        <canvas id="histogramme-{hash(question)}"></canvas>
        <script>
            document.addEventListener('DOMContentLoaded', function() {{
                var donnees = {donnees_json};
                var ctx = document.getElementById('histogramme-{hash(question)}').getContext('2d');
                new Chart(ctx, {{
                    type: 'bar',
                    data: donnees,
                    options: {{
                        responsive: true,
                        scales: {{
                            y: {{
                                beginAtZero: true
                            }}
                        }}
                    }}
                }});
            }});
        </script>
    '''
    return html