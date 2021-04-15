
import re

REPLACESTRING="ZZ"

def splitenonce(enonce="nothing"): # 
    """
    >>> getenonce(enonce="nothing")
    
    """
    lines = enonce.split('\n')
    choices = []
    
    #pattern = re.compile(r
    # '.*{(?:=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))}?)')

    pattern = re.compile(r'(?:{=(?P<value>(?:[\,,\s,\w,-]+?))(?:\#(?P<feedback>[\w,\,].+?))?})')

    #patterntype = re.compile(r'(?:{:(?P<type>(?:[\W]+?)):(?:=(?P<value>(?:[\,,\s,\w,-]+?)))+?})')
    patterntype = re.compile(r'(?:{\:(?P<type>[\W]+?)\:})')

    #for line in lines:
    #    match = pattern.match(line,re.MULTILINE)
    #    if not match:
    #        continue
    #    choice = {
    #        "value": match.group('value').strip(),
    #        "feedback": match.group('feedback') or ''
    #    }
    #    choices.append(choice)
    
    choices=re.findall(pattern,enonce)
    types=re.findall(patterntype,enonce)

    enoncetroux=re.sub(r'\{.+?\}', REPLACESTRING, enonce)
    
    
    return enoncetroux,choices,types

def defhtmlmenu(indice,dico):
    """
    >>> defhtmlmenu(enonce,dico)
    
    """
    menu= dico[indice] # tuple de value,feedback
    m=menu[0].split(",") # champ value
    strind=str(indice)
    unMenu='<select name="gab'+strind+'" id="gab-select"><option value="">--Choisir une réponse--</option>'
    for it in m:
        unMenu=unMenu+"<option value="">" + it +"</option>"

    unMenu=unMenu+'</select>'
    return unMenu

def gethtmlmenu(enonce,dico):
    """
    >>> gethtmlmenu(enonce,dico)
    
    """
    indice=0
    monHtml=""
    lines = enonce.split('\n')
    for line in lines:
        l = line
        for itemmenu in re.finditer(REPLACESTRING,line):
            m = defhtmlmenu(indice,dico)
            l = re.sub(REPLACESTRING,m , l, 1)
            indice += 1
        monHtml=monHtml+l
    
    return monHtml
