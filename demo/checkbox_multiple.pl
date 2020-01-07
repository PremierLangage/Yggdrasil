extends = /template/checkbox.pl

title = Multiples de 3

before ==
import random as rd
mult3 = [str(n) for n in range(50,100) if n % 3 == 0]
other = [str(n) for n in range(50,100) if n % 3 != 0]
checkbox.loadRightWrong(mult3,other,5,rd.randint(1,4))
checkbox.grading="RightMinusWrong"
==

text = Parmi les nombres suivants, lesquels sont des multiples de 3 ?
