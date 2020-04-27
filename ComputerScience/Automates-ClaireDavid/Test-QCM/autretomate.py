#fichier pour creer un autre automate pour venir remplacer tomate.py dans un exo spécifique
def createauto ():
    return """
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    #initials
    S0
    #accepting
    S0
    S2
    #alphabet
    a
    b
    #transitions
    S0:a>S4
    S0:b>S1
    S1:a>S0
    S1:b>S2
    S2:a>S5
    S2:b>S1
    S3:a>S0
    S3:b>S4
    S4:a>S2
    S4:b>S5
    S5:a>S2
    S5:b>S3
"""


