extends = /Mathematics/template/mathbasic.pl

title = QCM

lang = fr

@ /Mathematics/exercises/MCQ/donnees_binaire.txt
data_from_file=donnees_binaire.txt


before ==
number_question=4
min_option=3
max_option=6



def ParseQuestion(opened_file):
    """
    Parse a Python open file of formated questions in AMC style and return a 
    list of parsed questions together with theirs answers.
    """
    text = None
    goods = []
    bads = []
    current = None
    MCQ_lst = []
    # We manually add a last "*" in the parsing to register the last question 
    for line in opened_file.readlines()+["*"]:
        if line[0] in "*+-":
            # We did read a new item
            # First, we register the last item
            if current is not None:
                if current[0] == "*":
                    text = current[1:]
                elif current[0] == "+":
                    goods.append(current[1:])
                elif current[0] == "-":
                    bads.append(current[1:])
                else:
                    raise ValueError("Error during parsing the questions file.")
            
            if line[0] == "*":
                # In this case, the new item is a new question
                # It is time to insert a potential question
                if text is not None:
                    MCQ_lst.append([text, goods, bads])
                    text = None
                    goods = []
                    bads = []
            
            # the new item overwrite the current one
            current = line 
        else:
            # If this is not a new item, we concat to the previous item.
            current = current.replace("\n", " ")
            current += line
    return MCQ_lst

file_question_name = data_from_file
        
if file_question_name == "None":
    text = ("Cet exercise n'utilise pas le template qcm "
    "correctement. L'entrée 'data_from_file' de l'exercice doit spécifier "
    "le chemin d'un fichier accessible contenant les questions.")
    sys.exit(1)

# The parsing is done here
with open(file_question_name, "r") as file_question :
    mcq = ParseQuestion(file_question)

number_of_mcq = int(number_question)

# Selection of the indices of the questions
indices_questions = [i for i in range(len(mcq))]
rd.shuffle(indices_questions)
indices_questions = indices_questions [:number_of_mcq]

# Selection of the indices of the answers, and subset of questions
questions = []
for i in indices_questions:
    num_good = len(mcq[i][1])
    num_bad = len(mcq[i][2])
    num_ans = rd.randint(min([min_option, num_good+num_bad]), min([max_option, num_good+num_bad]))
    indices_ans = [i for i in range(num_good+num_bad)]
    rd.shuffle(indices_ans)
    indices_ans = indices_ans [:num_ans]
    options = []
    for j in indices_ans:
        if j < num_good :
            options.append({'ans':mcq[i][1][j], 'type':'good'})
        else:
            options.append({'ans':mcq[i][2][j-num_good], 'type':'bad'})
    questions.append({'text':mcq[i][0], 'options':options})


==

text== 
<p><em>Répondez aux questions, puis validez. Naviguez entre les questions en utilisant les flèches.</em></p>
==

form ==

<style>
.carousel-control-prev, carousel-control-next {
  width:40px;
}
.vert .carousel-item-next.carousel-item-left,
.vert .carousel-item-prev.carousel-item-right {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.vert .carousel-item-next,
.vert .active.carousel-item-right {
    -webkit-transform: translate3d(0, 100%, 0);
            transform: translate3d(0, 100% 0);
}

.vert .carousel-item-prev,
.vert .active.carousel-item-left {
-webkit-transform: translate3d(0,-100%, 0);
        transform: translate3d(0,-100%, 0);
}

 /* Make the image fully responsive 
  .carousel-item{
  border:1px solid black;
  } */


</style>

<div id="carouselExampleIndicators" class="vert carousel slide" data-interval="false">
    <div class="carousel-inner">
    {% for question in questions %}
        <div class="carousel-item {% if forloop.first %} active {% endif %}">
            <div class=" d-block w-75 mx-auto" style = "height:300px">
                <h3>  
                    Question {{forloop.counter}}/{{questions|length}}:&nbsp 
                    {{question.text}} 
                </h3>
                
                <div class="form-group">
                {% for item in question.options %}
                    <div class="form-check">
                        <label class="form-check-label">
                        <input 
                            class="form-check-input" 
                            type="checkbox" 
                            id="form_ans_{{forloop.parentloop.counter0}}" 
                            value="{{ forloop.counter0 }}"
                        >
                        {{ item.ans }}
                       </label>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    {% endfor %}
    </div>
  
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="btn btn-primary my-butt">
        <span class="fas fa-chevron-up"></span>
        </span>
    </a>

    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="btn btn-primary my-butt">
        <span class="fas fa-chevron-down"></span>
        </span>
    </a>
</div>

==

evaluator==
q_scores = 0
output = ""
for i in range(len(questions)):
    if ('ans_'+str(i)) in answer:
        checked = answer['ans_'+str(i)]
    else:
        checked = []
        
    output += '\n Question '+str(i)+'\n'+str(checked)+'\n'+str(questions[i]['options'])

    question_score = 0;
    for j in range(len(questions[i]['options'])):
        if str(j) in checked:
            res = 'good'
        else: 
            res =  'bad'
        if res == questions[i]['options'][j]['type'] :
            question_score += 1
    q_scores += 100 * question_score // len(questions[i]['options'])

final_score = q_scores // len(questions)
feedback = output+'\n'+'Votre score est de ' + str(final_score) +'/100'
score=100
==














