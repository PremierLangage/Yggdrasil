extends = /AAAA/Antonin/modules/Statistics/activities/MatchListSurvey.pl

title= MatchList Probleme Etudiants

text==
Relier chaque problème "vos étudiants" à sa solution 
==

matches==
ont besoin d’entraînement, exercice répétable aléatoires
n'apprennent pas le cours, Quizz pré-cours
s'ennuient, Activité hors programme 
se perdent, Ontologies support
sont très hétérogènes en niveaux, Etayage
apprennent mal, analyse de parcours
ne sont pas critiques, Evaluation par les pairs
ne sont pas engagés, ludification et réussite
==

multiple = True

evaluator==#|py|
score = max(0, (8 - nombre_erreurs)) * 100 / 8
==

# options
include_stats_score = True
include_stats_participation = True




# FORM PLAYER
form==#|html|
{% if user == "drevuz2" %}
<style>
    .graph {
        display:flex;
        flex-direction:column;
    }
</style>
    <div class="graph">
        {{graphContent|safe}}
    </div>
    <br>
    {{ corrections }}
    <br>
    <div class="exercise__actions text-center">
        <div class="btn btn-primary c_btn" id="dwn-btn"> 
            <i class="fas fa-download"></i>
            <span class="ion-hide-md-down">Téléchargement des choix des élèves</span>
        </div>
    </div>
    <script>
        function download(filename, text) {
            var element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);

            element.click();
            document.body.removeChild(element);
        }

        // Start file download.
        document.getElementById("dwn-btn").addEventListener("click", function(){
            // Generate download of hello.txt file with some content
            var text = "{{answers_csv}}";
            var filename = "answers.csv";
            
            download(filename, text);
        }, false);
    </script>
    {{formstudent|safe}}
{% endif %}
==