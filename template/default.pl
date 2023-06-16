
# This is the default dictionnary
# Some variables are not defined yet 
# somethings should be send to the sandbox 

# Dockerfile 
# the docker file for the exercice 
# the default docker is generous: python,c,c++,java11, mathlibs but dosen't statisfy every one 
# so it is possible to define you own docker file for your type of exercice 
#@ /docker/defaultdockerfile 

# Sandbox file those should be in the PYTHONPATH and on the sandbox 
# put here is a lesser evil 
# maibe the /lib/utils should be a copied of the sandbox utils directory 
# the /utils should be defined in the sandbox project 
@ /utils/sandboxio.py

# By default we do programming so we need and editor 
# and you can answer nearly any thing in the editor ...
form=@ /form/text_editor.html

# A default pagelayout (the standard title-author/text/form
# This doesn't exist yet see #162 
#jinja=@ /jinja/basictemplate.html

# This is bad the builder should not be mandatory 
# we are creating several process for nothing 
@ /builder/none.py [builder.py]

# tools for the number of trys 
@ essai.py [essai.py]


# A default grader (giving the 100 mark)
@ /grader/evaluator.py [grader.py]

evaluator==
grade=(100,"Passez  &agrave; la question suivante. ")
==




