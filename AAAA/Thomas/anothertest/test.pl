
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

before ==#|py|
import os
import sys

os.environ["MPLCONFIGDIR"] = "/tmp/matplotlib-ogs20b_w"
print("AHHHHHHHHHHHHH1" ,  file=sys.stderr)

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import mpld3
from mpld3 import plugins
np.random.seed(9615)
print("AHHHHHHHHHHHHH2" ,  file=sys.stderr)

# generate df
N = 100
df = pd.DataFrame((.1 * (np.random.random((N, 5)) - .5)).cumsum(0),
                  columns=['a', 'b', 'c', 'd', 'e'],)
print("AHHHHHHHHHHHHH3" ,  file=sys.stderr)
sys.exit(69)

# plot line + confidence interval
fig, ax = plt.subplots()
ax.grid(True, alpha=0.3)
print("AHHHHHHHHHHHHH4" ,  file=sys.stderr)

for key, val in df.items():
    l, = ax.plot(val.index, val.values, label=key)
    ax.fill_between(val.index,
                    val.values * .5, val.values * 1.5,
                    color=l.get_color(), alpha=.4)
print("AHHHHHHHHHHHHH5" ,  file=sys.stderr)

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_title('Interactive legend', size=20)
print("AHHHHHHHHHHHHH" ,  file=sys.stderr)

with open('test3.html', 'w') as f:
    print(mpld3.fig_to_html(fig), file=f)


with open("test3.html", "r") as f:
    form = f.read()

==

title = Radio Group Component

text==
Select the result of **{{ A }}** x **{{ B }}**.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
==

# EVALUATE THE STUDENT ANSWER
evaluator==
==

