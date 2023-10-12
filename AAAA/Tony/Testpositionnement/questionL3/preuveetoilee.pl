extends= /model/basic/checkbox_rw.pl

title = Décortiquer une preuve

question==
On montre que si une famille $!(e_1,\ldots,e_n)!$ d'un ev $!E!$ est libre et que $!f:E\rightarrow F!$ (où $!F!$ est un autre ev) est une application linéaire injective alors $!(f(e_1),\ldots,f(e_n))!$ est libre.
 Parmi les arguments ci-dessous, lesquels permettent de justifier un des points numérotés.
 Soient $!(\lambda_1,\ldots,\lambda_n)!$ des réels tels que 
 $!\sum_{i=1}^n\lambda_if(e_i)=0_F!$  $!\underset{(1)}{alors}!$
 $!f\left(\sum_{i=1}^n\lambda_i e_i\right)=0_F!$
  $!\underset{(2)}{donc}!$ $!\sum_{i=1}^n\lambda_i e_i=0_E!$
   $!\underset{(3)}{donc}!$ $!\forall i\in\{1,\ldots,n\}, \lambda_i=0!$
   donc $!(f(e_1),\ldots,f(e_n))!$ est libre.
==
 

nbitems=5
minright = 2
maxright = 2

right== 
car $!f!$ est injective
par linéarité de $!f!$ 
==

wrong==   
car $!f(0_E)=0_F!$
car $!(f(e_1),\ldots,f(e_n))!$ est libre
car $!(e_1,\ldots,e_n)!$ est une base de $!E!$
==

scoring = CorrectItems

reroll = False