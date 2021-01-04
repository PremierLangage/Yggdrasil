#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

author=ESIPE's BG

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group1 =: RadioGroup
group2 =: RadioGroup
group3 =: RadioGroup
group4 =: RadioGroup
group5 =: RadioGroup
group6 =: RadioGroup

before==#|python|

group1.items = []
group1.items.append({"id": "0", "content": "La présentation n'apporte que des éléments superficiels <br> ou non pertinents au regard du sujet."})
group1.items.append({"id": "1", "content": "La présentation rassemble les informations pressenties <br> venant de sources classiques."})
group1.items.append({"id": "2", "content": "La présentation contient quelques informations illustrant <br> un travail de recherche approfondie."})
group1.items.append({"id": "3", "content": "La présentation contient de nombreuses informations subtiles <br> issues de sources peu connues."})

group2.items = []
group2.items.append({"id": "0", "content": "La présentation ne contient que des faits, aucune opinion."})
group2.items.append({"id": "1", "content": "La présentation contient quelques jugements personnels."})
group2.items.append({"id": "2", "content": "L'opinion de l'orateur est régulièrement donné pour estimer <br> ou qualifier des éléments de la présentation."})
group2.items.append({"id": "3", "content": "Toute la présentation est construite dans l'objectif de soutenir <br> un avis explicite défendu par l'auteur."})

group3.items = []
group3.items.append({"id": "0", "content": "Au moins un des arguments est fallacieux ou bien un problème éthique <br> notable n'est pas identifié."})
group3.items.append({"id": "1", "content": "La présentation dissocie correctement les éléments factuels des <br> éléments d’opinion. Les problèmes éthiques majeurs sont identifiés."})
group3.items.append({"id": "2", "content": "Les principaux arguments de la présentation sont estimés à leur <br> juste valeur, les problèmes éthiques potentiels sont explicités."})
group3.items.append({"id": "3", "content": "Tous les arguments sont judicieusement estimés (faits, ouï-dire, <br> opinions personnelles, propagande, etc...). La présentation <br> identifie les problèmes déontologiques et éthiques subtils."})

group4.items = []
group4.items.append({"id": "0", "content": "Aucun des éléments de la présentation ne vous a paru convaincant."})
group4.items.append({"id": "1", "content": "La présentation utilise les arguments standards et connus associés <br> à la problématique."})
group4.items.append({"id": "2", "content": "Outre les arguments standards attendus, la présentation en propose <br> certains plus subtils et utilisés de manière pertinente."})
group4.items.append({"id": "3", "content": "La présentation, judicieusement structurée, met en scène des <br> arguments de qualité pour convaincre son auditoire."})

group5.items = []
group5.items.append({"id": "0", "content": "La présentation est très confuse, ou fait un contre-sens ou un <br> non-sens à propos d'un concept ou d'une expression."})
group5.items.append({"id": "1", "content": "Les concepts et objets sont fidèlement définis dans la présentation."})
group5.items.append({"id": "2", "content": "La présentation est claire et contient des efforts pédagogiques manifestes."})
group5.items.append({"id": "3", "content": "L’intégralité de la présentation est accessible et compréhensible <br> malgré la complexité des notions manipulées."})

group6.items = []
group6.items.append({"id": "0", "content": "Les supports sont de mauvaise qualité (notamment l'orthographe) ou le temps imparti n'est pas respecté."})
group6.items.append({"id": "1", "content": "Les supports sont cohérents avec la présentation orale qui est correcte; le temps est globalement respecté."})
group6.items.append({"id": "2", "content": "Les supports illustrés et pertinents soutiennent une présentation <br> orale de qualité dans le temps imparti."})
group6.items.append({"id": "3", "content": "Les supports sont de grande qualité et adaptés une présentation <br> orale captivante, optimale pour servir l’argumentation."})


students = [ ("AGULLO", "Vincent"),
             ("BATICLE", "Nicolas"),
             ("BESSODES", "Julien"),
             ("BOHL", "Kylian"),
             ("BOURJOT", "Raphaël"),
             ("CAU", "Guillaume"),
             ("CRETE", "Jonathan"),
             ("DA COSTA", "Mélissa"),
             ("DESCOMBES", "Anaïs"),
             ("DINDANE", "Chahinaz"),
             ("DURAND", "Axel"),
             ("FALL", "Abdou"),
             ("FAU", "Nicolas"),
             ("JOLIVET", "Dylan"),
             ("JOLIVET", "Yohann"),
             ("KHEROUA", "Karim"),
             ("KOFFI", "Judicaël"),
             ("LEMOINE", "Nathan"),
             ("MARSZAL", "Rémi"),
             ("MARTI", "Emilie"),
             ("MARTIN", "Kevin"),
             ("MATHECOWITSCH", "Guillaume"),
             ("MECHOUK", "Lisa"),
             ("MERCHERMEK", "Salim"),
             ("NGUYEN", "Christelle"),
             ("OUCH", "Léo"),
             ("OUZIEL", "Sacha"),
             ("PERNET", "Nils"),
             ("QUANTIN", "Benoît"),
             ("SICOT", "Yoann"),
             ("SORAN", "Altan"),
             ("SOUSTRE", "Ludovic"),
             ("TRAINA", "Tanguy"),
             ("WINCKLER", "Jean-Philippe") ]

==

title=Grille évaluation Exposés Techniques Avancés

text==#|html|

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    margin: auto;
    width: 70%;
  }
  #myCarousel{
    min-height: 300px;
  }
.carousel-indicators li {
    display: inline-block;
    width: 24px;
    height: 24px;
    margin: 5px;
    text-indent: 0;
    cursor: pointer;
    border: none;
    border-radius: 50%;
    background-color: #0000ff;
    box-shadow: inset 1px 1px 1px 1px rgba(0,0,0,0.5);    
}
.carousel-indicators .active {
    width: 24px;
    height: 24px;
    margin: 5px;
    background-color: #ffff99;
}
.item{
    padding-top: 10px;
}
  </style>


Pas de papier cette année! Nous allons économiser (34 + 6)*3 feuilles A4 pour
les évaluations. En contrepartie, vous devrez chacun, et chaque semaine, envoyer 
un mail à **nicolas.borie@univ-eiffel.fr** avec les 4 lignes CSV générés par cet utilitaire 
après chaque présentation et assemblées par vos soins.



Remplissez bien correctement les **7 volets** avant de valider!

==

form==#|html|

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >
<!-- Indicators -->
<ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
    <li data-target="#myCarousel" data-slide-to="5"></li>
    <li data-target="#myCarousel" data-slide-to="6"></li>
</ol>
<div class="carousel-inner">


<div class="item active">
  <p style="margin-left:15%; margin-right:15%;"><b><u>L'exposé : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">L'évaluateur (Vous) : </div>
  <div style="margin-left:15%; margin-right:15%;">L'orateur : </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 1 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La présentation assemble des informations pertinentes.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group1|component }} </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 2 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La présentation contient des prises de position explicites.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group2|component }} </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 3 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La présentation est professionnelle et éthique.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group3|component }} </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 4 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La présentation est convaincante.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group4|component }} </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 5 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La présentation assure un haut degré d'intelligibilité.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group5|component }} </div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 6 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">La forme et les supports de la présentation sont de qualité.</div>
  <br>
  <div style="margin-left:15%; margin-right:15%;"> {{ group6|component }} </div>
  <br><br><br><br>
</div>

</div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

==

evaluator==#|python|

note_finale = 100
feedback = "Voici la ligne de CSV pour votre évaluation"

grade = (note_finale, feedback)
==