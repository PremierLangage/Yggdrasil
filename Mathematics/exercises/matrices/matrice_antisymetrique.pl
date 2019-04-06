extends = /template/mathfixedmatrix.pl

title = Matrice antisymétrique

lang = fr

before==
size = randint(2,3)

A = Matrix(size, size, lambda i,j : randint(-1,1))
B = Matrix(size, size, lambda i,j : True if i<=j  else False)

fixed_matrix_tags = [{
    'name':'matrice',
    'num_rows': size,  # will be a square matrix if num_cols not specified
    'cell_width':'3em',
    'cell_height':'2em',
    'input_style':'width:2em',
    # Matrices need to be converted to python lists for use in template
    'matrix': A.tolist(), # 'matrix' field contains the initial values of the input field.
    'mask' : B.tolist()
    # 'mask' is a matrix of booleans 'True' for an active input field, False for a disabled one.
    }] 
==

text== 
Modifiez le moins de coefficients possibles de la matrice suivante afin de la rendre antisymétrique.

== 

form==
<script>
function onAfterSubmitPL() {
    console.log("coucou"); 
}
</script>
<div style="text-align:center">
{{ input_fixed_matrix_matrice | safe }}
</div>
==

evaluator ==
from jinja2 import Template

matrice = Matrix(answer['fixed_matrix_matrice'])
# the value returned is a matrix of strings, entries will need to be sympified. 

score = 100
feedback = 'OK'
numerror = 0
solution = ''

# the minimal number of coefficients that need to be modified to make A antisymmetric
min_modifs = 0
# the actual number of modifications
modifs = 0


# compute modifs
for i in range(size):
    for j in range(size): 
        matrice[i,j] = sympify(matrice[i,j])
        if not is_equal(A[i,j], matrice[i,j])  : 
            modifs += 1

ok_answer = []

# compute min_modifs, check if result is antisymmetric     
for i in range(size):
    for j in range(i+1):
        if A[i,j] != -A[j,i] : min_modifs += 1
               
        if not is_equal(matrice[i,j] + matrice[j,i], 0) : 
            ok_answer.append(["form_fixed_matrix_matrice_"+str(i)+str(j), 'wrong_answer'])
            if i != j:
                ok_answer.append(["form_fixed_matrix_matrice_"+str(j)+str(i), 'wrong_answer'])
            feedback = 'Raté, la matrice n\'est pas antisymétrique'
            score = 0
        else : 
            ok_answer.append(["form_fixed_matrix_matrice_"+str(i)+str(j), 'good_answer'])
            if i != j:
                ok_answer.append(["form_fixed_matrix_matrice_"+str(j)+str(i), 'good_answer'])


if feedback == 'OK' :
    if modifs == min_modifs: 
        feedback = 'Parfait !'
    else: 
        feedback = 'Vous avez fait trop de modifications: {0} modification(s) suffisaient, vous en avez fait {1}'.format(min_modifs, modifs)


==




