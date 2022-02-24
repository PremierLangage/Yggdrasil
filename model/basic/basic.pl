extends = /model/basic/hackpage.pl
extends = /model/basic/utils.pl


before_scripts = ["importfunc", "initinput", "before", "process", "render"]
eval_scripts = ["evaluator", "evalprocess"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==


render == #|py|
from jinja_env import Env
for key in jinja_keys:
    if key in globals():
        key = Env.from_string(macros + key).render(globals())
==

title =
form = 
text = 

tplpage =@ /model/tplpage/basic.html
style.basic =@ /model/css/basic.css.html
