from scipy.stats import kendalltau

_doc_="""
fill_right : bonnes réponses cochées
fill_wrong : mauvaises réponses cochées
blank_right : 
blank_wrong : 
"""


def all_or_nothing(fill_right, fill_wrong, blank_right, blank_wrong):
    return 100 if fill_wrong + blank_right == 0 else 0

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
