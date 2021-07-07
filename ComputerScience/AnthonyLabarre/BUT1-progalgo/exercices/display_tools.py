

_dico_rmk={
    ';' : 'le point-virgule est inutile',
    '(' : 'les parenth&#232;ses sont inutiles',
    '++' : 'un seul + suffit',
    '\n' : "le code peut s'écrire sur une seule ligne"
}


def good(msg):
    return u'<span class="success-state"> ' + msg + ' </span>'

def wrong(msg):
    return u'<span class="error-state"> ' + msg + ' </span>'

def rmk(msg):
    return u'<span style="color:blue;"></br></br> Remarque : ' + msg + ' :) </span>'

def remarks(lst,code):
    for p in lst:
        if(p in code):
            return rmk(_dico_rmk[p])

def grade_wrong(msg):
    return (0, wrong(msg))