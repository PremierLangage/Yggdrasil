extends = /Mathematics/template/mathbasic.pl

html_jsxgraph_tag =@ /Mathematics/inclusion_tags/jsxgraph_tag.html

footerbefore ==
from jinja2 import Template
import json

_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])


def render_jsxgraph_tag(dic):
	context = {}
	if 'style' in dic:
	    context['style'] = dic['style']
	else: 
		context['style'] = 'width:400px; height:400px; margin: 0 auto;'
	if 'capture' in dic:
	    context['capture'] = dic['capture']
	else: 
		pass
	if 'script' in dic:
	    context['script'] = dic['script']
	else: 
		context['script'] = ''

    context['script'] = Template(context['script']).render(globals()) # the jsxgraph script may itself be a template
    return Template(html_jsxgraph_tag).render(context)

try:
	jsxgraph_script
except NameError:
	pass
else:
	jsxgraph_tag = {'script':jsxgraph_script}
	try:
		jsxgraph_capture
	except NameError:
		pass
	else:
		jsxgraph_tag['capture'] = json.loads(jsxgraph_capture)
	try:
		jsxgraph_style
	except NameError:
		pass
	else:
		jsxgraph_tag['style'] = jsxgraph_style
	locals()['jsxgraph'] = render_jsxgraph_tag(jsxgraph_tag)
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



# extract from jsx boards data the variables of interest
try:
    jsxgraph_tag
except NameError:
    pass
else:
	if 'capture' in jsxgraph_tag:
		data = json.loads(answer['jsxgraph'])
		for name in data:
			answer['jsxgraph_'+name] =  data[name]			
==


text ==

==





