# author oce
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Conversion de température

text==  

Écrire une fonction "conv()" qui reçoit deux paramètres, une température "t" et un entier "n", et qui retourne la conversion 
Celsius -> Fahrenheit (n= 1), ou Fahrenheit -> Celsius(n= 2).<br>
Rappel : 
$%
Tf = 32 +1.8 * Tc\\\
%$
==

#correction==
#def conv(t,n):
#    """Renvoie la conversion Celsius->Fahrenheit ou inversement suivant<n>."""
#    if n==1: #Celsius->Fahrenheit
#        return(32.0+1.8*t)
#    elif n==2: #Fahrenheit->Celsius
#        return((t-32.0)/1.8)
#==

pltest0==
>>> conv(20,1)
68.0
==
pltest1==
>>> conv(20,2)
-6.666666666666666
==
pltest2==
>>> conv(50,1)
122.0
==
pltest3==
>>> conv(50,1)
122.0
==
pltest4==
>>> conv(-58,2)
-50.0
==




