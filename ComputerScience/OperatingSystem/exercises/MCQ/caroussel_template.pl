#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Fork me please, do not modify me please !
==

questions=@ /ComputerScience/OperatingSystem/exercises/MCQ/notion_de_fichier.txt

before==

==


text==#|markdown|

<meta name="viewport" content="width=device-width, initial-scale=1">
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


<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      Parmi les commandes suivantes, lesquelles permettent de visualiser un flux ou un fichier ?<br>
      <ul>
        <li>pwd</li>
        <li>chmod</li>
        <li>chgrp</li>
        <li>mkdir</li>
        <li>less</li>
        <li>more</li>
        <li>cat</li>
        <li>head</li>
        <li>tail</li>
      </ul>
    </div>

    <div class="item">
      Parmi les commandes suivantes, lesquelles permettent de visualiser un flux ou un fichier ?<br>
      <ul>
        <li>pwd</li>
        <li>chmod</li>
        <li>chgrp</li>
        <li>mkdir</li>
        <li>less</li>
        <li>more</li>
        <li>cat</li>
        <li>head</li>
        <li>tail</li>
      </ul>
    </div>

    <div class="item">
      Parmi les commandes suivantes, lesquelles permettent de visualiser un flux ou un fichier ?<br>
      <ul>
        <li>pwd</li>
        <li>chmod</li>
        <li>chgrp</li>
        <li>mkdir</li>
        <li>less</li>
        <li>more</li>
        <li>cat</li>
        <li>head</li>
        <li>tail</li>
      </ul>
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

form==#|markdown|

==

evaluator==#|python|

note_finale = 100

grade = (note_finale, "Vous avez obtenur la note de "+str(note_finale)+"%<br>")
==

