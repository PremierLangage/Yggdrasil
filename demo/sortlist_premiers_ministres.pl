extends = /model/basic.pl

title = Classement : Premiers ministres

@ premiers_ministres.csv

before ==
import random as rd
import csv

with open('premiers_ministres.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

lst = rd.sample(range(len(rows)),5)
lst.sort()
sortlist.load_items([rows[i]["nom"] for i in lst])
==

text ==
  <a href="" data-toggle="tooltip" title="Hooray!">Hover over me</a>

Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==

sortlist =: SortList

@ /utils/sortlist.py [customsortlist.py]
sortlist.decorator = CustomSortList

form ==
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
==

settings.feedback = lightscore

extrajs ==
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
</script>
==
