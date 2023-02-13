
# from scipy.stats import kendalltau

_doc_="""
right : number of items filled in with a right answer
wrong : number of items filled in with a wrong answer
items_to_fill : number of items to be filled in
items_total : total number of items
"""


def all_or_nothing(right, wrong, items_to_fill, items_total=None):
    return 100 if right == items_to_fill and wrong == 0 else 0

def right_minus_wrong(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    if nbsol == 0:
        return 100*int(nbwrong == 0)
    else:
        return int(round(max([(nbright - nbwrong)/nbsol*100,0])))

def correct_items(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    return int(round(max([(nbitems - 2*(nbsol - nbright + nbwrong))/nbitems*100,0])))

def exact_order(order):
    n = len(order)
    return 100 if order == list(range(n)) else 0

def kendall_tau(order):
    # FIXME i don't whant to install scipy here
    return all_or_nothing(order)
#    n = len(order)
#    tau,_ = kendalltau(order, list(range(n)))
#    return int(round(max([0,tau])*100))



