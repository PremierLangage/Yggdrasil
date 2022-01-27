extends = /model/math/set.pl

title = Ecrire en extension un ensemble donné en compréhension

before ==
# S,cond=randitem(param['sets'])

cond = "square"
S = "N"

n = 20
if S == "N":
    S_tex=r"\mathbb{N}"
    lstS=list(range(n))
elif S == "N*":
    S_tex=r"\mathbb{N}^*"
    lstS=list(range(1,n))
elif S == "Z":
    S_tex=r"\mathbb{Z}"
    lstS=list(range(-n+1,n))
elif S == "Z*":
    S_tex=r"\mathbb{Z}^*"
    lstS=list(range(-n+1,0))+list(range(1,n))

symb=["<","\leq"]

setlength=9
while (setlength>8 or setlength<1):
    if cond=="square":
        a = choice([4,6,9,15,16,19,21,25,27])
        ka=randint(0,1)
        aa = a+ka
        lstA = [x for x in lstS if x**2 < aa]
        cond_tex=r"n^2 %s %d" % (symb[ka],a)
    elif cond=="square2":
        ka=randint(0,1)
        kb=randint(0,1)
        a,b=sorted(list_randitem_norep(2,[1,4,6,9,15,16,19,21,27,36,49,50,64,70,81,90,100,110]))
        globals()['aa']=a-ka
        globals()['bb']=b+kb
        lstA=[x for x in lstS if aa < x**2 < bb]
        cond_tex=r" %d %s n^2 %s %d" % (a,symb[ka],symb[kb],b)
    setlength=len(lstA)


sol=FiniteSet(*lstA)
sol_tex=latex(sol)
==

question == 
Ecrire en extension l'ensemble $!\left \{ n \in {{S_tex}} \:|\: {{cond_tex}} \right \}!$.
==