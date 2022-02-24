extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl


before_scripts = ["importfunc", "initinput", "before", "process"]
eval_scripts = ["evaluator", "evalprocess"]
jinja_keys = ["question", "inputblock", "solution"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ /model/tplpage/basic.html
style.basic =@ /model/css/basic.css.html
