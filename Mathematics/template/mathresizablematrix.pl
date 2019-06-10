extends = /Mathematics/template/mathbasic.pl

html_resizable_matrix_tag =@ /Mathematics/inclusion_tags/resizable_matrix_tag.html

footerbefore ==
from jinja2 import Template

_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])

def render_resizable_matrix_tag(dic):
	context = {'name':dic['name']}

	if 'input_style' in dic:
	    context['input_style'] = dic['input_style']
	else: 
		context['input_style'] = 'width: 2em'

	if 'max_rows' in dic:
	    context['max_rows'] = dic['max_rows']
	else: 
		context['max_rows'] = 5

	if 'max_cols' in dic:
	    context['max_cols'] = dic['max_cols']
	else: 
		context['max_cols'] = 5

	if 'cell_width' in dic:
	    context['cell_width'] = dic['cell_width']
	else: 
		context['cell_width'] = '3em'

	if 'cell_height' in dic:
	    context['cell_height'] = dic['cell_height']
	else: 
		context['cell_height'] = '2em'
        
    # initial dimensions of the matrix
    context['num_rows'] = 2
    context['num_cols'] = 2

    matrix = []
    for i in range(context['max_rows']):
        matrix.append([])
        # each matrix entry is a couple, the first item is a string describing the position of the entry
        # the second item is the value displayed in the form, equal to '' if input field is initially blank
        for j in range(context['max_cols']): matrix[i].append([str(i)+str(j), ''])
    context['matrix']=matrix

    return Template(html_resizable_matrix_tag).render(context)

try:
    resizable_matrix_tags
except NameError:
	pass
else:
	for tag in resizable_matrix_tags:
    	locals()['input_resizable_matrix_'+tag['name']] = render_resizable_matrix_tag(tag)
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
for _namevar in list(_strsympyvar.keys()):
    with evaluate(False):
        locals()[_namevar]=sympify(_strsympyvar[_namevar])



# Construct a matrix from the form data, ie resizable_matrix_name_rows, resizable_matrix_name_cols 
# and the entries resizable_matrix_name_ij

try:
    resizable_matrix_tags
except NameError:
    pass
else:
    for tag in resizable_matrix_tags:
        matrix_name = 'resizable_matrix_'+tag['name']
        num_rows = int(answer[matrix_name+'_rows'])
        num_cols = int(answer[matrix_name+'_cols'])
        temp_matrix = []
        for i in range(num_rows):
            temp_matrix.append([])
            for j in range(num_cols):
                temp_matrix[i].append(answer[matrix_name+'_'+str(i)+str(j)])
        answer[matrix_name] = temp_matrix
==


style==
.matrix-input {
	border : none;
	border-radius:4px;
	text-align: center;
	font-style: italic;
	font-size: 12pt;
	color:black;
	background-color: LightGrey;
	z-index:10;
}

.absolute-center{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.matrix{
    display:inline-block;
    position: relative;
    margin: 5px;
    vertical-align: middle;
}
.matrix:before, .matrix:after {
    content: "";
    position: absolute;
    top: 0;
    border: 2px solid #000;
    width: 6px;
    height: 100%;
}
.matrix:before {
    left: -6px;
    border-right: 0;
}
.matrix:after {
    right: -6px;
    border-left: 0;
}
    
.matrix-container {
    display: inline-block;
    overflow: hidden;
}
.matrix-table {
    table-layout:fixed;
}
.matrix-cell {
    margin:0;
    position:relative;
}
==

text==

==























