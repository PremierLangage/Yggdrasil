    from customradio import CustomRadio
    from customcheckbox import CustomCheckbox
    from customtextselect import CustomTextSelect
    radio = CustomRadio() 
    check = CustomCheckbox()
    ztext = CustomTextSelect()
    import random
    random.seed(42) # DEBUG FIXME
    from AMC import parse_AMC_TXT

    from aleaq import buildquestion, onefromeachgroup,getmultioption

    # Parsing du fichier format AMC
    list_questions = parse_AMC_TXT(questions)

    # Traitement des options de gestion de l'aléa 
    # getmultioption -> possibilité d'utiliser une question plusieurs fois 

    l2=[]
    for q in list_questions:
        n=getmultioption(q) # default value 1 
        for _ in range(n):
            l2.append(buildquestion(q))
    list_questions=l2
    # onepergroup -> possibilité de faire une tirage aléatoire dans un groupe de questions

    title= str(l2)
    onepergroup = 1

    if "onepergroup" in globals() and onepergroup > 0 :
        list_questions=onefromeachgroup(list_questions,onepergroup)
    # nbstep réduire la complexité 
    if 'nbstep' in globals():
        list_questions = random.sample(list_questions, nbstep)



    nb_quest = len(list_questions)
    random.shuffle(list_questions)

    comp = []
    import sys # DEBUG
    for i, q in enumerate(list_questions):
        if type(q)== list :
            exit()
        if q['type'] == "Radio":
            newcomp = CustomRadio()
            
            newcomp.setStatement(q['text'])
            newcomp.setitems(q['items'])
            newcomp.setsol_from_index(q['index'])
            if 'ordered' not in q['options']:
                newcomp.shuffle()
            comp.append(newcomp)
        elif q['type'] == "Checkbox":
            newcomp = CustomCheckbox()
            newcomp.setStatement(q['text'])
            newcomp.setitems(q['items'])
            newcomp.setsol_from_index(q['index'])
            if 'ordered' not in q['options']:
                newcomp.shuffle()
            comp.append(newcomp)
        elif  q['type'] == 'TextSelect':
            newcomp = CustomTextSelect()
            newcomp.setStatement(q['text'])
            newcomp.setdata_from_textDR(q['items'][0])
            comp.append(newcomp)


    def make_rotation_str(nb_quest):
        pass


    def makeonglet(comp):
        pass


    # entêtes du mnaège
    text +=  """
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>\n"""
    text += "\n".join(['      <li data-target="#myCarousel" data-slide-to="'+str(i)+'"></li>' for i in range(1, len(list_questions))])
    text +=   """</ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">"""

    for indice in range(len(list_questions)):
           text += f"""
                    <div class="item active">
                    <p style="margin-left:15%; margin-right:15%;"><b><u>Question {indice+1} : </u></b></p><br>
                    <div style="margin-left:15%; margin-right:15%;">{list_questions[indice]["text"]}</div>
                    <div style="margin-left:15%; margin-right:15%;">\n<{comp[indice].selector} cid='{comp[indice].cid}'></{comp[indice].selector}></div>
                    <br><br><br><br></div>"""

    # footer du manège
    text += """
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
            </a>
            </div>
    """
