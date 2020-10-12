
extends= /ComputerScience/python/AP1-1920/templates/plsoluce.pl


soluce=@app2dr.py 

@ input0.txt
@ input1.txt 

text=" . . "

before==

tests=["Prompt : quelle invite de commande ?","Quelle version ?","Version2"]

for i,t in enumerate(tests): 
    filename=f"input{i}.txt"
    mpl=t+"\n"
    with open(filename,"r") as f:
        mpl+= f.read()
    globals()[f"mplsoluce{i}"]= mpl
    text+= mpl

==



