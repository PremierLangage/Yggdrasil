extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

S=randitem([r"\mathbb{N}",r"\mathbb{Z}"])
cond=randitem(["square","square2"])

if S==r"\mathbb{N}":
    lstS=list(range(20))
elif S==r"\mathbb{Z}":
    lstS=list(range(-20,20))

if cond=="square":
    globals()['a']=randint([4,6,9,15,16,19,21,25,27])
    lstA=[x for x in lstS if x**2 <= a]
    cond=r"n^2 \leq %d" % a
elif cond=="square2":
    globals()['a']=randint([1,4,6,9,15,16,19,21])
    globals()['b']=randint([27,36,49,50,64,70,81,90,100,110])
    lstA=[x for x in lstS if a <= x**2 <= b]
    cond=r" %d \leq n^2 \leq %d" % (a,b)


sol=FiniteSet(*lstA)
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $!\\left \\{ n \in {{S}} \:|\: {{cond}} \\right \\}!$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==



