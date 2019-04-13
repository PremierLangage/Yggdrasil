extends = /Mathematics/template/mathbasic.pl

html_drop_tag =@ /Mathematics/inclusion_tags/drop_tag.html
html_drag_tag =@ /Mathematics/inclusion_tags/drag_tag.html


headbefore==
from jinja2 import Template
from plrandom import rd
rd.seed(seed)
from sympy import sqrt,ln,log,exp,sin,cos,tan
from sympy import isprime,factorint
from sympy import Intersection
from sympy import symbols
from sympy import conjugate
from sympy import Basic, Matrix
from sympy import Rational
from sympy import trace
from utilsmath import *

if 'latexparam' in locals():
    LatexPrinter._settings.update(eval(latexparam))

def render_drop_tag(dic):
	context = {'name':dic['name']}
	if 'style' in dic:
	    context['style'] = dic['style']
	else: 
		context['style'] = ''
	if 'display' in dic:
	    context['display'] = dic['display']
	else: 
		context['display'] = ''
    return Template(html_drop_tag).render(context)

def render_drag_tag(dic):
	context = {'name':dic['name']}
	if 'style' in dic:
	    context['style'] = dic['style']
	else: 
		context['style'] = ''
	if 'display' in dic:
	    context['display'] = dic['display']
	else: 
		context['display'] = ''
    return Template(html_drag_tag).render(context)

==

footerbefore ==
from jinja2 import Template

_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])


try:
  drop_tags
except NameError:
	pass
else:
	for tag in drop_tags:
    	locals()['input_drop_'+tag['name']] = render_drop_tag(tag)

try:
  drag_tags
except NameError:
	pass
else:
	for tag in drag_tags:
    	locals()['input_drag_'+tag['name']] = render_drag_tag(tag)
==

text==

==



















