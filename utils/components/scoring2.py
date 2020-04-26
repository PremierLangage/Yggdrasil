from scipy.stats import kendalltau

_doc_="""
right_select : bonnes réponses cochées
wrong_select : mauvaises réponses cochées
right_blank : nombre de bonnes réponses (à cocher) dans l'exercice
wrong_blank : nombre d'items potentiellement cochables dans l'exercice
"""


def all_or_nothing(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return 100 if nbright== nbsol else 0

def right_minus_wrong(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return int(round(max([(nbright - nbwrong)/nbsol*100,0])))

def correct_items(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return int(round(max([(nbitems - 2*(nbsol - nbright + nbwrong))/nbitems*100,0])))

def exact_order(order):
    n = len(order)
    return 100 if order == list(range(n)) else 0

def kendall_tau(order):
    n = len(order)
    tau,_ = kendalltau(order, list(range(n)))
    return int(round(max([0,tau])*100))
