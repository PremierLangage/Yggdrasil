
import re

def getenonce(enonce="nothing"): # 
    """
    >>> getenonce(categorie=1)
    
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


