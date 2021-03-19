
import re

def getenonce(enonce="nothing"): # 
    """
    >>> getenonce(enonce="nothing")
    
    """
    lines = enonce.split('\n')
    choices = []
    pattern = re.compile(r'.*{(?:=(?P<value>(?:(?:\\\#)|[^\#])+)(?:\#(?P<feedback>.*))?)}')
    for line in lines:
        match = pattern.match(line)
        if not match:
            continue
        choice = {
            "value": match.group('value').strip(),
            "feedback": match.group('feedback') or ''
        }
        choices.append(choice)

    #choices=re.findall(pattern,enonce)
    enoncetroux=re.sub(r'{.*}', '??', enonce)

    return enoncetroux,choices

def gethtmlmenu(enonce,dico):
    """
    >>> gethtmlmenu(enonce,dico)
    
    """
    strtemp=""
    lines = enonce.split('\n')
    for line in lines:
        iter=re.finditer("^\?\?",line,re.MULTILINE)
        strtemp=strtemp+line

        #strtemp=enonce[:itemmenu.start()]
        #strtemp=itemmenu.start()
        #enonce=enonce[item.end():]
    
    return strtemp
