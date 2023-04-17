

def raiseifabsent(name, comment=" variable obligatoire"):
    if name not in globals():
        raise(" Missing variable :"+name+comment)


def buildform(formfill):

    theform=''' {{ group|component }} \n<br />\nPrécisions le cas échéant (en particulier si vous avez des suggestions d\'amélioration) : <br /> 
       '<textarea id="form_comcrit{level}" rows="6" cols="80" ></textarea>'''
    