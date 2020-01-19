extends = basic.pl

@ /utils/matchlist.py [custommatchlist.py]

match =: MatchList
match.decorator = CustomMatchList

form==
{{ match|component }}
==

evaluator==
grade=match.eval()
==

