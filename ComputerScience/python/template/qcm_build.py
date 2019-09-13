
import random
import sys

def testdef(balise):
    # type: (str) ->
    if balise  not in globals():
        print("Pas de balise "+balise+" dans la définition de l'exercice ", file=sys.stderr)
        sys.exit(1)

def randomNfromlist(n,tr,fl, nbtrues):
    if not nbtrues:
        nbtrues=min(n,random.randint(1,len(tr)-1)) # at  least one good answer ???
    random.shuffle(tr)
    if nbtrues > len(tr):
        print(" Not enough True answers nbtrues= ", nbtrues, file=sys.stderr)
        sys.exit(1)
    tr=tr[0:nbtrues]
    n=max(n-nbtrues,0)
    if n>len(fl):
        print(" Not enough false answers to complete the question ", n,"needed", file=sys.stderr)
        sys.exit(1)
    random.shuffle(fl)
    r=tr+fl[0:n]
    random.shuffle(r) # randomize order of affirmation
    return r

if "mybuild" in globals():
    try:
        exec(mybuild,globals())
    except Exception as ee:
        print("Problem dans mybuild",str(ee),file=sys.stderr)
if "delimiter" not in globals():
    delimiter="\n"

if good.endswith("\n\n"):
    good=good[0:-1]
    print(" trailing \n",file=sys.stderr)

if bad.endswith("\n\n"):
    bad=bad[0:-1]
    print(" trailing \n",file=sys.stderr)

if "separator" not in globals():
    separator='|'
lg= good.split(delimiter)
lb= bad.split(delimiter)

goodpairs=[]
badpairs=[]
for x in lg:
    if x:
        if separator in x:
            k=x.split(separator)
            goodpairs.append((k[0],True,k[1]))
        else:
            goodpairs.append((x,True," "))
for x in lb:
    if x:
        if separator in x:
            x=x.split(separator)
            badpairs.append((x[0],True,x[1]))
        else:
            badpairs.append((x,False," "))


if "nb" not in globals():
    # si on dit rien on prend tout
    pairs=goodpairs + badpairs
else:
    if "nbtrues" not in globals():
        pairs  = randomNfromlist(int(nb), goodpairs, badpairs, 0)
    else:
        pairs = randomNfromlist(int(nb), goodpairs, badpairs, int(nbtrues))


form = """<div class="input-group"><table>"""
for i,p in enumerate(pairs):
    form += """<TR><td><input id="form_answer_"""+str(i)+"""\"  type="checkbox"  placeholder="" required>"""+p[0]+"</td></TR>"
form += "</table></div>"





