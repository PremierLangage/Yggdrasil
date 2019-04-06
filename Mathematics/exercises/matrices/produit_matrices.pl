extends = /template/mathresizablematrix.pl

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
    'max_rows':5,
    'max_cols':5,
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

product = A*B
matrice = answer['resizable_matrix_matrice']

score = 100
numerror = 0
feedback = ''
solution = ''



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
            # 'produit' is a sympy matrix, its entries are accessed with a different syntax then the array 'matrice' containing the inputs.
            try:
              coeff = sp.sympify(matrice[i][j])
            except:
              score = 10
              numerror=-1
              feedback += '<br> Le coefficient ('+str(i)+str(j)+') a été mal saisi'
            else:
              if is_equal(coeff, product[i,j]): 
                pass
              else: 
                feedback = 'Raté'
                score = 0
                numerror = 1
==




