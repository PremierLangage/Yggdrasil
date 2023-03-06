"""
Anthony Labarre © 2021

Outils de génération d'exercices en vrac. Le découpage en modules sera effectué
ultérieurement.
"""
# Imports ---------------------------------------------------------------------
from itertools import zip_longest
from random import choice, randint, shuffle
from string import ascii_letters


# Fonctions -------------------------------------------------------------------
# ----- Exercices sur les booléens --------------------------------------------
def expression_booleenne(variables):
    """Renvoie une expression booléenne aléatoire sur les variables données.
    Chaque variable apparaîtra exactement une fois.

    :rtype: tuple de chaînes
    :type variables: itérable de chaînes
    """
    operateurs = ["and", "or"]
    variables = list(variables)
    shuffle(variables)

    # on applique une négation aléatoire à chaque variable
    expr_vars = [
        ["", "not "][randint(0, 1)] + var for var in variables
    ]
    expr_ops = [choice(operateurs) for _ in range(len(variables)-1)]

    return sum(list(zip_longest(expr_vars, expr_ops, fillvalue="")), ())[:-1]

def expression_booleenne_with_errors(variables):
    """Renvoie une expression booléenne aléatoire sur les variables données.
    Chaque variable apparaîtra exactement une fois.
    Plus la variable X qui n'est pas définie
    :rtype: tuple de chaînes
    :type variables: itérable de chaînes
    """
    operateurs = ["and", "or"]
    variables = list(variables)+["X"]
    shuffle(variables)
    # on applique une négation aléatoire à chaque variable
    expr_vars = [["", "not "][randint(0, 1)] + var for var in variables]
    expr_ops = [choice(operateurs) for _ in range(len(variables)-1)]
    return sum(list(zip_longest(expr_vars, expr_ops, fillvalue="")), ())[:-1]





def evaluer_expression_booleenne(pexpression, affectations):
    """Renvoie la valeur de l'expression booléenne étant données les
    affectations choisies.
    
    :type expression: un itérable ordonné de chaînes, dont chaque élément est 
    un littéral ("x", "not x", ...) ou un opérateur ("and" ou "or")
    :type affectations: un dictionnaire contenant pour chaque variable positive
    sa valeur booléenne associée.
    """
    expression = list(pexpression)
    # remplacer les valeurs
    for i in range(len(expression)):
        if expression[i] in affectations:  # remplacer une variable positive
            expression[i] = str(affectations[expression[i]])
        else:
            terme_sans_not = expression[i].replace("not ", "")
            if terme_sans_not in affectations:  # remplacer une variable négative
                expression[i] = str(not affectations[terme_sans_not])
    # renvoyer l'évaluation
    try:
        return pexpression,str(eval(" ".join(expression)))
    except NameError as e:
        return "Error"
    except Exception as e:
        import sys
        printf("Expression incalculable ??? bizare", file=sys.stderr)
        sys.exit(1)

# ----- Exercices sur les noms de variable ------------------------------------
def mot_aleatoire(longueur):
    """Renvoie un mot aléatoire (lettres minuscules et majuscules) de la 
    longueur demandée."""
    return "".join(choice(ascii_letters) for _ in range(longueur))


def chaine_nombres_aleatoire(longueur):
    """Renvoie un nombre aléatoire à longueur chiffres sous la forme d'une
    chaîne. On s'interdit de démarrer par un 0 ou un 1, ces valeurs étant 
    faciles à confondre avec un O ou un l."""
    return str(randint(2, 9)) + "".join(
        str(randint(0, 9)) for _ in range(longueur)
    )

