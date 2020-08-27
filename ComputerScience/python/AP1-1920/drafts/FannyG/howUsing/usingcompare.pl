
extends=compare.pl

data.question= Quel âge avez-vous ?
data.answer1= J'ai 20 ans.
data.answer2= g 20 ten.

criteria =[
    {
        "id":0,
        "description":"Age donné",
        "levels":[
            {"id":0, "description":"Inférieur à 20 ans", "points":0},
            {"id":1, "description":"20 ans", "points":1},
            {"id":2, "description":"Supérieur à 20 ans", "points":2}
        ]
   },
   {
        "id":1,
        "description":"Orthographe",
        "levels":[
            {"id":0, "description":"Plusieurs fautes", "points":0},
            {"id":1, "description":"1 faute", "points":1},
            {"id":2, "description":"Aucune faute", "points":2}
        ]
   },
   {
        "id":2,
        "description":"Syntaxe",
        "levels":[
            {"id":0, "description":"La phrase ne possède ni une majuscule, ni un point.", "points":0},
            {"id":1, "description":"La phrase possède soit une majuscule, soit un point.", "points":1},
            {"id":2, "description":"La phrase possède une majuscule et un point.", "points":2}
      ] 
   }
]

