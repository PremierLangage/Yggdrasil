extends = /Mathematics/template/mathresizablematrix.pl

title = Produit de matrices

lang = fr

before==
m = randint(1,4)
n = randint(2,3)
p = randint(1,4)
A = Matrix(m,n,lambda i,j: randint(-1,1))
B = Matrix(n,p,lambda i,j: randint(-1,1))
latexA = latex(A)
latexB = latex(B)


resizable_matrix_tags = [{
    'name':'matrice',
    'max_rows':5, # maximum number of rows of extensible matrix
    'max_cols':5, # maximum number of columns of extensible matrix
    'cell_width':'3em',
    'cell_height':'2em',
    'input_style':'width:2em'}]

==

text== 
Calculez le produit des matrices suivantes:
$$ A = {{ latexA }},\quad B = {{ latexB }}.$$
Entrez le résultat ci-dessous
== 

form==
<div style="text-align:center">
$% AB =%$  {{ input_resizable_matrix_matrice | safe }}
</div>
==

evaluator ==
import json
from jinja2 import Template

product = A*B
matrice = answer['resizable_matrix_matrice']
# returned matrix is a double array of strings
# entries. entries will need to be sympified

score = 100
numerror = 0
feedback = ''
solution = ''

ok_answer = []

if len(matrice) != m:
    feedback = 'Votre matrice n\'a pas le bon nombre de lignes. '+'Elle a '+str(len(matrice))+ ' lignes.'
    score = 0
    numerror = 1
if len(matrice[0]) != p:
    feedback += 'Votre matrice n\'a pas le bon nombre de colonnes.'+'Elle a '+str(len(matrice[0]))+ ' colonnes.'
    score = 0
    numerror = 1
if len(matrice) == m and len(matrice[0]) == p : 
    for i in range(m):
        for j in range(p):
            try:
              coeff = sp.sympify(matrice[i][j])
            except:
              score = 10
              numerror=-1
              ok_answer.append( ['form_resizable_matrix_matrice_'+str(i)+str(j), 'bad_input'])
            else:
              if is_equal(coeff, product[i,j]): 
                ok_answer.append( ['form_resizable_matrix_matrice_'+str(i)+str(j), 'good_answer'])
              else: 
                feedback = 'Raté'
                score = 0
                numerror = 1
                ok_answer.append( ['form_resizable_matrix_matrice_'+str(i)+str(j), 'wrong_answer'])

ok_answer = json.dumps(ok_answer)
form += '<input type="hidden" id="okanswer" value="{{ ok_answer }}" /> '
==

