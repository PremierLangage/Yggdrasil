extends = /model/basic/input.pl

@ pays_europe.csv [data.csv]

title ==
Exemple 3
==

text ==
{{ pays }}
{{sol}}
Quel pays a pour capitale {{ capitale }} ?
==

sol ==
{{ pays }}

{{ article }} {{ pays }}
==

