## une liste de noms de variables 
## pour produire un formulaire de saisie




def make_form(namelist): # type: (List[(str,str)]) -> str
    form = '<table style="border-spacing: 3px; border-collapse: separate;" width="100%" >'
    for name in namelist:
        title =''
        if len(name[1]) != 0:
            title=f'title="{name[1]}"'
        
        if name[0]=='description':
            form += f'<tr><td>{name[0]}</td><td> <textarea id="form_{name[0]}" width="50%"></textarea> </td></tr>'
        else:
            form += f'<tr><td>{name[0]} <div id="hoverText">&#9432;<span title="hover text">{name[1]}</span></div> </td><td> <input {title} class="drs" type=text id="form_{name[0]}" width="50%"/> </td></tr>'

    form += '</table>'
    return form

def make_dict(response, namelist):
    d={}
    for name in namelist:
        d[name] = response.get(name, "")
    return d

def streval(response, namelist):
    d = make_dict(response, namelist)
    s=""
    for name in namelist:
        s += f"{name} = {d[name]}<BR> "
    return s
