extends = /template/sortlist.pl

title = Premiers ministres (SortList)


@ codefile.py

before ==
import random as rd
import csv

with open('codefile.py', newline='') as file:
    l=file.readlines()

sortlist.setdata_from_list([ "<code>"+x.strip()+"</code>" for x in l])
==

text ==
Classer ces premiers ministres de la Ve République du plus ancien au plus récent (selon la date d'entrée en fonction).
==




evaluator ==
score = sortlist.eval()
==

settings.feedback = lightscore

sortlist.css==
background: #f4f4f4;
    border: 1px solid #ddd;
    border-left: 3px solid #f36d33;
    color: #666;
    page-break-inside: avoid;
    font-family: monospace;
    font-size: 15px;
    line-height: 1.6;
    margin-bottom: 1.6em;
    max-width: 100%;
    overflow: auto;
    padding: 1em 1.5em;
    display: block;
    word-wrap: break-word;
==
