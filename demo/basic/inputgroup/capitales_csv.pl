
extends = /model/basic/inputgroup.pl

@ /demo/data/pays_europe.csv

question ==
Quelles sont les capitales des pays suivants ?
==

before == #|py|
n = 4

inputs = [TextInput() for _ in range(n)]
pays = []

f = open('pays_europe.csv')
datasample = csv_sample(f, n)

for i in range(n):
    input[i].sol = datasample[0]['capitale']
    pays.append(datasample[i]['pays'])
==

inputblock ==
<div class="container">
{% for i in range(n) %}
  <div class="row py-2 align-items-center">
    <div class="col-md-auto">
        {{ pays[i] }}
    </div>
    <div class="col">
      {{ inputs[i]|component }}
    </div>
  </div>
{% endfor %}
</div>
==