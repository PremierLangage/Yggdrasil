
import re

def splitenonce(enonce="nothing"): # 
    """
    >>> getenonce(enonce="nothing")
    
    """
    lines = enonce.split('\n')
    choices = []
    
    #pattern = re.compile(r
    # '.*{(?:=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))}?)')
    # =(?P<value>
    #    (?:
    #        (?:\\\#)|[^\#]
    #    )+
    #  )
    #  (?:\#(?P<feedback>
    #       .*
    #  )
    #           )
    #           ?
    # )

    pattern = re.compile(r'(?:\{(?:=(?P<value>(?:(?:\\\#)|[^\#])+))(?:\#(?P<feedback>.*))?\})')
    pattern = re.compile(r'(?:\{=(?P<value>(?:[\,\s,\w]+?)) (?:\#(?P<feedb>[a-z,\,].+?))?\})')
    pattern = re.compile(r'(?:\{=(?P<value>(?:[\,\s,\w]+?)) (?:\#(?P<feedback>[\w,\,].+?))?\})')
    
    for line in lines:
        match = pattern.match(line)
        if not match:
            continue
        choice = {
            "value": match.group('value').strip(),
            "feedback": match.group('feedback') or ''
        }
        choices.append(choice)
    
    choices=re.findall(pattern,enonce)
    enoncetroux=re.sub(r'\{.+?\}', 'TT', enonce)

    return enoncetroux,choices

def defhtmlmenu(indice,dico):
    """
    >>> defhtmlmenu(enonce,dico)
    
    """
    menu= dico[indice]
    menu=list(menu)
    
    unMenu='<select name="gab"{{indice}} id="gab-select"><option value="">--Choisir une réponse--</option>'
    for it in menu:
        unMenu=unMenu+"<option value="">" + it +"</option>"
    unMenu=unMenu+'</select>'
    return unMenu

def gethtmlmenu(enonce,dico):
    """
    >>> gethtmlmenu(enonce,dico)
    
    """
    strtemp=""
    flg=False
    lst=0
    lines = enonce.split('\n')
    for line in lines:
        for itemmenu in re.finditer(r'TT',line):
            strtemp=strtemp+line[lst:itemmenu.start()+lst]+ " =="+str(lst)+"-"+str(itemmenu.start()+lst)+"-"+str(itemmenu.span())+line+" EOL<br/>"
            #strtemp=strtemp+line+" EOL<br/>"
            lst=itemmenu.end()+lst
            flg=True
        
        if not flg:
            strtemp=strtemp+line+"<br/>"
        #else:
            #strtemp=strtemp+" oups"+str(lst)
        flg=False
        #        strtemp=strtemp+enonce[:itemmenu.start()]
        #strtemp=enonce[:itemmenu.start()]
        #strtemp=itemmenu.start()
        #enonce=enonce[item.end():]
    
    return strtemp
