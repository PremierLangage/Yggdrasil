
extends= /ComputerScience/python/AP1-1920/templates/plsoluce.pl

title= Test pour le mini projet 2 AP1 2020/2021 

soluce=@app2dr.py 

@ input0.txt
@ input1.txt 
@ input2.txt
@ input3.txt

text=" . . "

before==

tests=["Prompt : quelle invite de commande ?","Quelle version ?","Version2", "version1" ]

for i,t in enumerate(tests): 
    filename=f"input{i}.txt"
    mpl=t+"\n"
    with open(filename,"r") as f:
        mpl+= f.read()
    globals()[f"mplsoluce{i}"]= mpl


==




