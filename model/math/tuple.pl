# Model for a single math input field
# with an evaluation as a tuple
extends = /model/math/input.pl

# Evaluation parameters
input_type = "tuple"
checksize = False

evalparam ==
input.evalparam = {'checksize':checksize}
==