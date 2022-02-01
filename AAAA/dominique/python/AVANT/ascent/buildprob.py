

"""
Ce code permet de fabriquer le fichier de data et de produire les deux solutions.

et le pltest 
"""

import random

def doit(filename):
    s="(()()((()()"
    level=3
    step= len(s)
    ssol = -1
    for i in range(7000):
        step += 1
        if random.randint(1,2)== 1:
            s+="("
            level +=1 
        else:
            s+=")"               
            level -= 1
        if level == -1 and ssol == -1:
            ssol = step

    with open(filename,"w") as f:
        f.write(s)

    pltest= f"""
    >>> question1() == {level} # Question 1 étage 
    True
    """
    pltest2= f"""
    >>> question2() == {ssol} # Question 2 position 
    True
    """

    return pltest,pltest2