extends= /model/basic/checkbox_rw.pl


title = Savoir utiliser la positivité et croissance de l'intégrale

text==
Lesquelles de ces intégrales sont positives?
==

nbitems = 4
minright = 0
maxright = 4

right== 
$!\int_0^1 x\exp(x^2)dx!$ 
$!\int_0^{\pi} 2x\sin(3x)dx!$ 
$!\int_0^{\frac{\pi}{2}} x\cos(x)dx!$ 
$!\int_{-12}^{-1} 3x^2+x^4dx!$  
$!\int_{-1}^2 x^3 dx!$ 
$!\int_1^e \ln(5x)dx!$ 
$!\int_1^e x\ln(4x)dx!$ 
 $!\int_0^{\pi} \sin(x)^5dx!$  
 $!\int_1^e \frac{3x+125x^3}{x^2}dx!$    
==

wrong== 
$!\int_0.5^1 \ln(x)dx!$ 
 $!\int_{\frac{\pi}{2}}^{\pi} \cos(x)dx!$ 
 $!\int_0^1 1-e^x dx!$  
 $!\int_0^1 cos(4x)-1 dx!$  
  $!\int_0^1 sin(x)-2 dx!$  
 $!\int_{-1}^0 \frac{x}{x^2+4}dx!$ 
    $!\int_-1^1 -\sqrt{x+2} dx!$  
==






