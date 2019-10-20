
doc==
    
    title= template qcm
    
    text= Cochez les affirmations correctes.
    
    # Nombre de lignes total 
    #nb=8
    # Nombre minimal de lignes "vraies"
    #nbtrues=2
    # if nbtrues==0 then a random number 
    # with at least one good answer ...
    
    good==
    La lune tourne
    0 est plus petit que 1 
    Mars est dite: la planète rouge 
    le sucre est blanc
    le cheval blanc de Henri VI est blanc
    ==
    
    
    
    bad==
    La terre est plate 
    Le soleil tourtne autour de la terre 
    Les satellites de la lune sont rouges.
    1 est plus petit que 0
    
    ==
    
    
    # uncrosedfalse= True uniquement les affirmations 
    # vraies sont comptées
    # sinon les cases non cochées et fausses sont comptabilisées 
    uncrosedfalse= True 


    Vous pouvez modifier ces valeur dans la balise 
    mybuild qui sera executer avec le before
    

==
title = changer le titre 
text = changer le text

form=dummy for the pl grammar the builder is making the form

feedback.success=<div class="btn-success"> Voila votre resultat : {{  evaluation }} </div>

feedback.failure=<div class="btn-danger"> Voila votre resultat : {{  evaluation }} </div>


builder=@ qcm_builder.py # the one in python 
before=@ qcm_build.py
grader=@qcm_evaluator.py
@ /utils/sandboxio.py

settings.allow_reroll=doit






