extends = /model/math/multinput.pl

title = Calcul de limites



before == #|python|
n = 3
inputs = [MathInput() for _ in range(n)]
prefixes = []
var('x')

n1,n2=sampleint(1, 5, 2)   
lstf=[[x**n1,exp(x)],[x**n2,ln(x)],[exp(x),ln(x)]]
rd.shuffle(lstf)

for f in lstf:
    shuffle(f)
    sol.append()
    lim=Limit(f[0]/f[1], x, oo)
    s = latex(lim)
    prefixes.append(f"$! {s} = !$")
    inputs[i].sol = lim.doit()
    inputs[i].type = "expr"
    inputs[i].evalparam = {}
==