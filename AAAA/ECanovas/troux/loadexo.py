
import re

def splitenonce(enonce="nothing"): # 
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
    flg=False
    lst=0
    lines = enonce.split('\n')
    for line in lines:
        for itemmenu in re.finditer("\?\?",line):
            strtemp=strtemp+line[lst:itemmenu.start()]+ " =="+itemmenu.group(0)+str(itemmenu.start())+"-"+str(itemmenu.end())+" EOL<br/>"
            lst=itemmenu.start()+lst
            flg=True
        if not flg:
            strtemp=strtemp+line+" EOL<br/>"
        flg=False
        #        strtemp=strtemp+enonce[:itemmenu.start()]
        #strtemp=enonce[:itemmenu.start()]
        #strtemp=itemmenu.start()
        #enonce=enonce[item.end():]
    
    return strtemp
