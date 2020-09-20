extends = /model/basic/input.pl

@ pays_europe.csv [data.csv]

title ==
Exemple 3
==

text ==
{{lstsol}}
Quel pays a pour capitale {{ capitale[rand] }} ?
==

sol ==
{{ pays[rand] }}
{{ article[rand] }}
==

feedback ==
{{pays[rand]}}
==

