
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ before.py

group =: RadioGroup

before ==#|py|
import os
import sys

os.environ["MPLCONFIGDIR"] = "/tmp/matplotlib-ogs20b_w"

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import mpld3
from mpld3 import plugins
import jsonpickle
np.random.seed(9615)

# generate df
N = 100
df = pd.DataFrame((.1 * (np.random.random((N, 5)) - .5)).cumsum(0),
                  columns=['a', 'b', 'c', 'd', 'e'],)

# plot line + confidence interval
fig, ax = plt.subplots()
ax.grid(True, alpha=0.3)

for key, val in df.items():
    l, = ax.plot(val.index, val.values, label=key)
    ax.fill_between(val.index,
                    val.values * .5, val.values * 1.5,
                    color=l.get_color(), alpha=.4)

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_title('Interactive legend', size=20)

d = {"form", mpld3.fig_to_html(fig)}
with open('form.html', 'w') as f:
    print(jsonpickle.encode(d, unpicklable=False), file=f)

del d



==

title = Radio Group Component

text==
Select the result of **{{ A }}** x **{{ B }}**.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
Coucou les copains
==

# EVALUATE THE STUDENT ANSWER
evaluator==
==

