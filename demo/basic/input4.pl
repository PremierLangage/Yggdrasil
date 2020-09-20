extends = /model/basic/input.pl

@ pays_europe.csv [data.csv]

title ==
Exemple 3
==

text ==
Quel pays a pour capitale {{ capitale[id] }} ?
==

sol ==
{{ pays[id] }}
{{ article[id] }}
==

feedback ==
{{ pays[id] }}
==

autocomplete ==
{{ pays }}
==

