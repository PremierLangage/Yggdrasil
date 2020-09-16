
extends = /template/mathresizablematrix.pl

title = Produit de matrices

lang = fr

before==
def randnotnull(a,b):
    n=0
    while n==0:
        n=randint(a,b)
    return n

etape=1
m = 3
n = 3
p = 3
U = Matrix(m,n,lambda i,j: 0  if (i>j) else randnotnull(-3,3))
L = Matrix(n,p,lambda i,j: 0  if (i<j) else 1 if (i==j) else randnotnull(-3,3))
latexU = latex(U)
latexL = latex(L)
A=U*L
latexA = latex(A)
A1= A
import sys
print(A1, file=sys.stderr)
A1[1,0]=A[1,0]/A[0,0]
A1[1,1]=A[1,1] - A[1,0]*A[0,1]
A1[1,2]=A[1,2] - A[1,0]*A[0,2]
A1[2,0]=A[2,0]/A[0,0]
A1[2,1]=A[2,1] - A[2,0]*A[0,1]
A1[2,2]=A[2,2] - A[2,0]*A[0,2]

A2=Matrix(A1)
latexA1 = latex(A1)
latexA2 = latex(A2)
A2[2,1]=A[2,1]/A[1,1]
A1[2,2]=A[2,2] - A[2,1]*A[1,2]

resizable_matrix_tags = [{
    'name':'matrice',
    'max_rows':5, # maximum number of rows of extensible matrix
    'max_cols':5, # maximum number of columns of extensible matrix
    'cell_width':'3em',
    'cell_height':'2em',
    'input_style':'width:2em'}]


==

text==
Soit la Matrice :
A = {{ latexA }}
Entrez dans la matrice ci dessous la matrice A1 provenant de la première étapde de la factorisation LU de Gauss sans pivot.
Ou L est tri-inférieur avec une diagonale unité et a une matrice tri supérieur inversible.
A1 =  {{ latexA1 }}
et
A2 =  {{ latexA2 }}

== 

form==
A1 
<div style="text-align:center">
$% AB =%$  {{ input_resizable_matrix_matrice | safe }}
</div>

==

evaluator == #|python|


import json
from jinja2 import Template

def matricecheck(matrice, name):
    if len(matrice) != m:
        feedback = 'Votre matrice '+name +' n\'a pas le bon nombre de lignes. '+'Elle a '+str(len(matrice))+ ' lignes.'
        score = 0
        numerror = 1
        exit(0)
    if len(matrice[0]) != p:
        feedback += 'Votre matrice '+name +' n\'a pas le bon nombre de colonnes.'+'Elle a '+str(len(matrice[0]))+ ' colonnes.'
        score = 0
        numerror = 1
        exit(0)


matrice = answer['resizable_matrix_matrice']
matricecheck(matrice,"A1")

matrice2 = answer['resizable_matrix_matrice2']
matricecheck(matrice2,"A2")

# returned matrix is a double array of strings
# entries. entries will need to be sympified

score = 100
numerror = 0
feedback = ''
solution = ''

ok_answer = []


A1=Matrix(A)


if len(matrice) == m and len(matrice[0]) == p : 
    for i in range(m):
        for j in range(p):
            try:
              coeff = sp.sympify(matrice[i,j])
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


if etape ==1 and A1==matrice :
        score = 50
        numerror=-1
        feedback= " Super etape suivante "
        etape=2
if etape == 2 and A2==matrice :
        score = 100
        numerror= 0
        feedback= " Super "
        etape=2
ok_answer = json.dumps(ok_answer)
input_resizable_matrix_matrice = ok_answer = json.dumps(ok_answer)
form += '<input type="hidden" id="okanswer" value="{{ ok_answer }}" /> '
==







