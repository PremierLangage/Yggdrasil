#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
import random


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
        print(f" Not enough True answers {nbtrues} > {len(tr)} ", file=sys.stderr)
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


def doqcmbuild(dic):
    good=dic['good']

    if good.endswith("\n\n"):
        good=good[0:-1]
        print(" trailing \n",file=sys.stderr)

    bad=dic['bad']
    if bad.endswith("\n\n"):
        bad=bad[0:-1]
        print(" trailing \n",file=sys.stderr)

    lg= good.split("\n")
    lb= bad.split("\n")

    goodpairs=[]
    badpairs=[]
    for x in lg:
        if x:
            goodpairs.append((x,True))
    for x in lb:
        if x:
            badpairs.append((x,False))


    if "nb" not in dic:
        # si on dit rien on prend tout
        pairs=goodpairs + badpairs
    else:
        if "nbtrues" not in dic:
            pairs  = randomNfromlist(int(dic['nb']), goodpairs, badpairs, 0)
        else:
            pairs = randomNfromlist(int(dic['nb']), goodpairs, badpairs, int(dic['nbtrues']))


    form = """<div class="input-group"><table>"""
    for i,(x,b) in enumerate(pairs):
        form += """<TR><td><input id="form_answer_"""+str(i)+"""\"  type="checkbox"  placeholder="" required>"""+x+"</td></TR>"
    form += "</table></div>"
    dic['form']=form
    dic['pairs']=pairs

    return dic








if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               + "Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]

    with open(input_json, "r") as f:
        dic = json.load(f)

    if 'before' in dic:
        glob = {}
        exec (dic['before'], dic)
        exec ("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

    dic = doqcmbuild(dic)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))

    sys.exit(0)

