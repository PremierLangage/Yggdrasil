extends = /template/mathbasic.pl

footerbefore ==
from jinja2 import Template
import json
import matplotlib
matplotlib.use('agg')
matplotlib.rcParams['savefig.dpi'] = 80
matplotlib.rcParams['figure.figsize'] = (4,3)
matplotlib.rcParams['savefig.transparent'] = True
from io import BytesIO
import base64

def render_plot(arg):# arg must be a matplotlib plot
    figfile = BytesIO()
    arg.save(figfile)
    figfile.seek(0)  # rewind to beginning of file
    figdata_png = base64.b64encode(figfile.getvalue()).decode('ascii')
    figfile.close()
    arg._backend.close()

    return  Template('<img src="data:image/png;base64,{{ plot_data }}" \
        style="pointer-events:none; width:inherit; height:inherit">').\
        render({'plot_data': figdata_png})


_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])
    elif type(locals()[_namevar]) == type(plot(symbols('x'), show=False)):
        locals()[_namevar] = render_plot(locals()[_namevar])
==

headevaluator==
from sympy import Basic, Matrix
from sympy import sympify
from sympy import ln, sqrt
from sympy import trace
from sympy import evaluate
import json
from utilsmath import *
if 'latexparam' in locals():
    LatexPrinter._settings.update(eval(latexparam))
for _namevar in list(_strsympyvar.keys()):
    with evaluate(False):
        locals()[_namevar]=sympify(_strsympyvar[_namevar])
==


text ==

==








