# Model for single math input field
# with evaluation as a complex number

extends = /model/math/input2.pl

# Evaluation parameters
input_type = "complex"
input_prefix = Réponse :
imaginary_unit = i
complex_form = 
checkratsimp = True
symbol_dict = {'e': E}
unauthorized_func = ['sin', 'cos', 'tan']

# Latex settings
latexsettings.imaginary_unit = i