
@ test.html

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ before.py

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
df = pd.DataFrame({
    'length': [1.5, 0.5, 1.2, 0.9, 3],
    'width': [0.7, 0.2, 0.15, 0.2, 1.1]
    }, index=['pig', 'rabbit', 'duck', 'chicken', 'horse'])
hist = df.hist(bins=3)
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

form = mpld3.fig_to_html(fig)
d = {"form" : form}
with open('test.html', 'w') as f:
    print(d, file=f)

"""
with open('form.html', 'w') as f:
    print(jsonpickle.encode(d, unpicklable=False), file=f)
"""
del df
del hist
del ax
del fig
del key
del val
del l


orhan = "orhan est un bg"
del orhan
del __warningregistry__
del f 

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

