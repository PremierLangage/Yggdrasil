extends= /model/basic/checkbox_rw.pl


title = Savoir trouver les fonctions pour faire une IPP

text==
Lesquelles de ces intégrales se traitent par une ou plusieurs IPP?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\int_0^1 2x\sin(3x)dx!$ 
$!\int_0^1 x\cos(x)dx!$ 
$!\int_0^1 x^2\sin(4x)dx!$ 
$!\int_0^1 x^2\cos(3x)dx!$ 
$!\int_0^1 x\exp(-5x)dx!$ 
$!\int_0^1 x^3\exp(-5x)dx!$ 
$!\int_1^e \ln(5x)dx!$ 
$!\int_1^e x\ln(4x)dx!$ 
$!\int_1^e \ln(12x)dx!$  
$!\int_0^1 \ln(x^2+1)dx!$  
==

wrong== 
 $!\int_0^1 x\exp(x^2)dx!$ 
 $!\int_0^1 x\cos(3x^2)dx!$ 
 $!\int_0^1 x\sin(4x^2)dx!$ 
 $!\int_0^1 \exp(3x)dx!$ 
 $!\int_0^1 \sin(2x)dx!$ 
 $!\int_0^1 \cos(4x)dx!$ 
==





