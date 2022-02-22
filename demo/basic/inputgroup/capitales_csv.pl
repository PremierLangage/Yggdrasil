extends = /model/basic/inputgroup.pl

@ /demo/data/pays_europe.csv

question ==
Quelles sont les capitales des pays suivants ?
==

before == #|py|
n = 4

inputs = [TextInput() for _ in range(n)]
pays, capitales = [], []

f = open('pays_europe.csv')
datasample = csv_sample(f, n)

for i in range(n):
    inputs[i].sol = datasample[i]['capitale']
    capitales.append(datasample[i]['capitale'])
    pays.append(datasample[i]['pays'])
==

inputblock == #|html|
{% for i in range(n) %}
<div style="display:flex; align-items: center; margin-bottom: 1em;">
  <div> {{ pays[i] }} : </div>
  <div style="margin-left: 1em;"> {{ inputs[i]|component }}</div>
</div>
{% endfor %}
==

solution == #|html|
<div style="margin-top: 0.5em;">
{% for i in range(n) %}
<div style="display:flex; align-items: center; margin-bottom: 0.5em;">
  <div> {{ pays[i] }} : </div>
  <div style="margin-left: 1em;"> {{ capitales[i] }}</div>
</div>
{% endfor %}
</div>
==