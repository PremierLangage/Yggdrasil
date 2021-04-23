
import re

REPLACESTRING="ZZ"
TYPESTRING="MATHINPUT"
input_prefix = ""

def splitenonce(enonce="nothing"): # 
    """
    >>> getenonce(enonce="nothing")
    
    """
    lines = enonce.split('\n')
    choices = "bulle"
    mathtypes="bulle"

    # FORMAT Menu HTML {=x,y,z #a}
    #pattern = re.compile(r
    # '.*{(?:=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))}?)')

    #pattern = re.compile(r'(?:{=(?P<value>(?:[\,,\s,\w,-]+?))(?:\#(?P<feedback>[\w,\,].+?))?})')

    # FORMAT {:MATHINPUT par ex:=bonne réponse1,bonne réponse2 ~ mauvaise réponse1,...}
    #patterntype = re.compile(r'(?:{\:(?P<type>[\w]+?)\:(?:=(?P<mathivalue>[\,,\(,\),\s,\w,-]+?))*?(?:~(?P<mathibadvalue>[\,,\s,\w,-]+?))*?})')
    #patterntype = re.compile(r'(?:{\:(?P<type>[\w]+?)\:(?:=(?P<mathivalue>[\,,\s,\w,-]+?))*?(?:~(?P<mathibadvalue>[\,,\s,\w,-]+?))*?})')
    #patterntype = re.compile(r'(?://\:(?P<type>[\w]+?)\:(?:=(?P<mathivalue>.+))//)')
    
    #patterntype = re.compile(r'(?://\:[\w]+?\:=.+?//)')
    patterntype = re.compile(r'//(?:\:(?P<type>[\w]+?)\:=(?P<val>.+?))//')
    
    #for line in lines:
    #    match = pattern.match(line,re.MULTILINE)
    #    if not match:
    #        continue
    #    choice = {
    #        "value": match.group('value').strip(),
    #        "feedback": match.group('feedback') or ''
    #    }
    #    choices.append(choice)
    
    #choices=re.findall(pattern,enonce)
    
    mathtypes=re.findall(patterntype,enonce)

    enoncetroux=re.sub(r'//:.+?:.+?//', REPLACESTRING, enonce)
    if mathtypes=='':
        mathtypes='?'
    return enoncetroux,"?",mathtypes

def defFormMathinput(indice,dico):
    #input_prefix=str(dico[indice])
    if indice==0:
        #unInput='<p>'+input_prefix+'<span id="math-field" style="font-size:14pt;padding: 0.2em;"></span></p> <input type="text" id="form_math" hidden=true> <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">'
        unInput='<span id="math-field1" style="font-size:14pt;padding: 0.2em;">1</span> <input type="text" id="form_math1" hidden=true> <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">'
    else:
        unInput='<span id="math-field2" style="font-size:14pt;padding: 0.2em;">2</span> <input type="text" id="form_math2" hidden=true> <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mathquill/0.10.1/mathquill.min.css">'
    return unInput

def getFormMathinput(enonce,dico):
    indice=0
    maForm=""
    lines = enonce.split('\n')
    for line in lines:
        l = line
        for itemmenu in re.finditer(REPLACESTRING,line):
            m = defFormMathinput(indice,dico)
            l = re.sub(REPLACESTRING,m ,l,1)
            indice += 1
        maForm=maForm+l
    return maForm

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
