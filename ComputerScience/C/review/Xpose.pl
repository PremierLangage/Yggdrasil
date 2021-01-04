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

author=The ESIPE Dream Team !

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group1 =: RadioGroup
group3 =: RadioGroup
group4 =: RadioGroup
group5 =: RadioGroup
group6 =: RadioGroup
group7 =: RadioGroup

before==#|python|




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
    <li data-target="#myCarousel" data-slide-to="7"></li>
</ol>
<div class="carousel-inner">


<div class="item active">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Présentation : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">list_questions[indices_questions[0]]["text"]</div>
  <div style="margin-left:15%; margin-right:15%;"><{radio0.selector} cid='{radio0.cid}'></{radio0.selector}></div>
  <br><br><br><br>
</div>

<div class="item">
  <p style="margin-left:15%; margin-right:15%;"><b><u>Critère 1 : </u></b></p>
  <br>
  <div style="margin-left:15%; margin-right:15%;">list_questions[indices_questions[1]]["text"]</div>
  <div style="margin-left:15%; margin-right:15%;"> {{ group1|component }} </div>
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