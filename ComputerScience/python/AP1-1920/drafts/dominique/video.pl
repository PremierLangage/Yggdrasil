@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title= 
text= 

link =$ video.mov

before==
==

evaluator==
==

form==
<h2>Video Tag</h2>
 <video width="320" height="240" controls>
  <source src="{{ link }}">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
</video> 

<h2>IFrame</h2>
<iframe width="560" height="315" src="https://www.youtube.com/embed/JJfn6dmEcTw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
==







