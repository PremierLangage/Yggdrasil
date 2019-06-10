extends = /Mathematics/template/mathbasic.pl

html_fixed_matrix_tag =@ /Mathematics/inclusion_tags/fixed_matrix_tag.html

footerbefore ==
from jinja2 import Template

def _sympy_to_str(arg):
# returns arg with sympy items converted to strings, otherwise they don't go through 
# to the evaluator tag.
# applies recursively to items if arg is a list, dict, tuple
	if isinstance(arg,(Basic,Matrix)):
		return '_converted_'+str(arg)
    elif isinstance(arg, dict):
        return {k: _sympy_to_str(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(_sympy_to_str,arg))
    elif isinstance(arg, tuple):
        return tuple(map(_sympy_to_str,arg))
    else : 
        return arg

_strsympyvar={}
_k = None
_v = None
for _k,_v in locals().items():
    if isinstance(_v,(Basic,Matrix, list, tuple, dict)):
        _strsympyvar[_k]=_sympy_to_str(_v)


def render_fixed_matrix_tag(dic):
	context = {'name':dic['name']}

	if 'input_style' in dic:
	    context['input_style'] = dic['input_style']
	else: 
		context['input_style'] = 'width: 2em'

	if 'num_rows' in dic:
	    context['num_rows'] = dic['num_rows']
	else: 
		context['num_rows'] = 2

	if 'num_cols' in dic:
	    context['num_cols'] = dic['num_cols']
	else: 
		context['num_cols'] = context['num_rows']

    if 'cell_width' in dic:
	    context['cell_width'] = dic['cell_width']
	else: 
		context['cell_width'] = '3em'

	if 'cell_height' in dic:
	    context['cell_height'] = dic['cell_height']
	else: 
		context['cell_height'] = '2em'

    matrix = []

    for i in range(context['num_rows']):
        matrix.append([])
        for j in range(context['num_cols']): 
            # each matrix entry is a triple, the first item is a string describing the position of the entry
            # the second item is the value displayed in the form, or '', the third item is True if it is an input field, False 
            # if it isn't.
            if 'matrix' in dic:
                entry_value = dic['matrix'][i][j]
            else:
                entry_value = ''
            if 'mask' in dic:
	            entry_mask = dic['mask'][i][j]
	        else: 
                entry_mask = True
		    matrix[i].append([str(i)+str(j), entry_value, entry_mask])
    context['matrix']=matrix

    return Template(html_fixed_matrix_tag).render(context)

try:
    fixed_matrix_tags
except NameError:
	pass
else:
	for tag in fixed_matrix_tags:
    	locals()['input_fixed_matrix_'+tag['name']] = render_fixed_matrix_tag(tag)
==

headevaluator==
from sympy import Basic, Matrix
from sympy import sympify
from sympy import ln, sqrt
from sympy import trace
from sympy import evaluate
from utilsmath import *
if 'latexparam' in locals():
    LatexPrinter._settings.update(eval(latexparam))


def _str_to_sympy(arg):
# inverse of _sympy_to_str in footerbefore.
	if isinstance(arg,str):
        if arg[:11] == '_converted_':
            with evaluate(False):
		        return sympify(arg[11:])
        else:
            return arg
    elif isinstance(arg, dict):
        return {k: _str_to_sympy(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(_str_to_sympy,arg))
    elif isinstance(arg, tuple):
        return tuple(map(_str_to_sympy,arg))
    else : return arg

for _k,_v in _strsympyvar.items():
    locals()[_k]=_str_to_sympy(_v)

# Construct a matrix from the form data, ie the entries fixed_matrix_name_ij

try:
    fixed_matrix_tags
except NameError:
    pass
else:
    for tag in fixed_matrix_tags:
    	if 'num_rows' in tag:
	        num_rows = tag['num_rows']
	    else: 
		    num_rows = 2
	    if 'num_cols' in tag:
	        num_cols = tag['num_cols']
	    else: 
	        num_cols = num_rows

        matrix_name = 'fixed_matrix_'+tag['name']
        temp_matrix = []
        for i in range(num_rows):
            temp_matrix.append([])
            for j in range(num_cols):
                temp_matrix[i].append(answer[matrix_name+'_'+str(i)+str(j)])
        answer[matrix_name] = temp_matrix
==

text==

==






