
@ /demo/data/pays_europe.csv

before ==
n = 4
f = open('pays_europe.csv')
datasample = csv_sample(f, n)

capitale = datasample[0]['capitale']
items = [row['pays'] for row in datasample]
capitale = row['capitale']
sol = row['pays']
==

extends = /model/basic/inputgroup.pl

question ==
Quelles sont les capitales des pays suivants ?
==

before ==
n = 4
inputs = [TextInput() for _ in range(n)]
datasample = csv_sample(f, n)

pays = []
f = open('pays_europe.csv')
for i in range(n):
    input[i].sol = datasample[0]['capitale']
    pays.append(datasample[i]['pays'])
==

inputblock ==
<div class="container">
  <div class="row py-2 align-items-center">
    <div class="col-md-auto">
        France :
    </div>
    <div class="col">
      {{ inputs[0]|component }}
    </div>
  </div>
  <div class="row py-2 align-items-center">
    <div class="col-md-auto">
      Italie :
    </div>
    <div class="col">
      {{ inputs[1]|component }}
    </div>
  </div>
</div>
==