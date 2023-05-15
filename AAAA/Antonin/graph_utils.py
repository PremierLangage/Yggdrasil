import json

def count_occurences(votes : list):
    occurrences = {}
    for vote in votes:
        if vote in occurrences:
            occurrences[vote] += 1
        else:
            occurrences[vote] = 1
    return occurrences

def generer_histogramme(votes):
    # Compter les occurrences de chaque vote
    occurrences = {}
    for vote in votes:
        if vote in occurrences:
            occurrences[vote] += 1
        else:
            occurrences[vote] = 1

    # Extraire les valeurs et les fréquences des votes
    valeurs = list(occurrences.keys())
    frequences = list(occurrences.values())

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
    <html>
    <head>
        <title>Histogramme des votes</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Histogramme des votes</h1>
        <canvas id="histogramme"></canvas>

        <script>
            document.addEventListener('DOMContentLoaded', function() {{
                var donnees = {donnees_json};
                var ctx = document.getElementById('histogramme').getContext('2d');
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
    </body>
    </html>
    '''

    return html