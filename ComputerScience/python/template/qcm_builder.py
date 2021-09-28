

#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle, random
from sandboxio import get_context

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")

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






if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()

    if "seed" in dic:
        random.seed(int(dic['seed']))

    if "mybuild" in dic:
        try:
            exec(dic['mybuild'],dic)
        except Exception as ee:
            print("Problem dans mybuild",str(ee),file=sys.stderr)

    if 'before' in dic:
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        print(add_try_clause(dic['before'], StopBeforeExec), file=sys.stderr)
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    # else:
    #     print(("Builder 'before' need a script declared in the key 'before'. "
    #            + "See documentation related to this builder."),
    #           file = sys.stderr)
    #     sys.exit(1)



    if "delimiter" not in dic:
        delimiter="\n"
    else:
        delimiter=dic['delimiter']

    if "good" not in dic:
        print("QCM Exercise needs a **good** key with the list of correct answers.",file = sys.stderr) 
        sys.exit(1)
    good=dic['good']
    if "bad" not in dic:
        print("QCM Exercise needs a **bad** key with the list of incorrect answers.",file = sys.stderr) 
        sys.exit(1)
    bad=dic['bad']

    if good.endswith("\n\n"):
        good=good[0:-1]
        print(" trailing linefeeds in good ",file=sys.stderr)

    if bad.endswith("\n\n"):
        bad=bad[0:-1]
        print(" trailing linefeeds in bad\n",file=sys.stderr)

    if "separator" not in dic:
        separator='|'
    else:
        separator=dic['separator']

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
                badpairs.append((x[0],False,x[1]))
            else:
                badpairs.append((x,False," "))


    if "nb" not in dic:
        # si on dit rien on prend tout
        pairs=goodpairs + badpairs
    else:
        nb=dic['nb']
        if "nbtrues" not in dic:
            pairs  = randomNfromlist(int(nb), goodpairs, badpairs, 0)
        else:
            pairs = randomNfromlist(int(nb), goodpairs, badpairs, int(dic['nbtrues']))

    dic['badpairs']=badpairs
    dic['goodpairs']=goodpairs
    dic['pairs']=pairs
    dic['form'] = """<div class="input-group"><table>"""
    for i,p in enumerate(pairs):
        dic['form'] += """<TR><td><input id="form_answer_"""+str(i)+"""\"  type="checkbox"  placeholder="" required>  """+p[0]+"</td></TR>"
    dic['form'] += "</table></div>"

    dic['basetext']=dic['text']


    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)



