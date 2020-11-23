
extends= /model/math/math.pl
extends= simplematchlist.pl

before==

var('x')

f=[sin(x),cos(x),x**2,x**3, log(x)/log(2), exp(x)]
df=[ diff(U) for u in f]

pairs=zip(f,df)
==

