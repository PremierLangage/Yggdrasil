
extends= javaerror.pl 

@ java.py [builder.py]


title = this is an exemple 
text=
pregrader=
code=
before==

text = """
Il faut corriger le code dans l'editeur pour que le test puisse avoir lieux.
Voici ce qu'a répondu la compilation.
"""

code="""
publique Class Main{
System.out.println("Bravo!");
}
"""
editor['code']=code


==


stdout_tests==
"No argument" Bravo!
==
