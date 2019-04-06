extends = /template/mathbasic.pl

footerbefore +=
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


for _namevar in list(locals().keys()):
    if type(locals()[_namevar]) == type(plot(symbols('x'), show=False)):
        locals()[_namevar] = render_plot(locals()[_namevar])
==

text ==

==









