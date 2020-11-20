


extends= /gift/templates/qtruefalse.pl




qselectbuild== #|python|
if answer.lower() in ["false","faux","non","no"]:
    answer="F"
elif answer.lower() in ["true","vrai","oui","yes"]:
    answer='T'
else:
    raise Exception('you must define a variable answer = T,True,Vraie or F,False,Faux ')

if answer != 'T' and answer != 'F':
    raise Exception('you must define a variable "answer = T or F"')

radio.horizontal = horizontal
radio.items = [
    { "id": "choice1", "content": "<i class='fas fa-check'></i>" },
    { "id": "choice2", "content": "<i class='fas fa-times'></i>" }
]
==
