



#! linter:require:nb::int
#! linter:require:nbtrues::int
#! linter:require:good
#! linter:require:bad


documentation==
    
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



# this builder uses the before clause 
# and checks for good and bad
@ qcmCbuilder.py [builder.py] 


grader=@ /grader/evaluator.py

@ /utils/sandboxio.py

settings.allow_reroll=False

form=

evaluator==
right = 0
total = 0
for item in group.items:
    checked = item['checked']
    if item['_truth']:
        total += 1
        item['css'] = 'success-border animated pulse infinite'
        if checked:
            right += 1
            item['css'] = 'success-border'
            item['content']+= item['_feedback']
    elif checked:
        item['css'] = 'error-border'
        item['content']+= item['_feedback']

if total == 0:
    grade = (100, 'Right')
else:
    grade = ((right / total) * 100, f"{right} / {total}")
==










