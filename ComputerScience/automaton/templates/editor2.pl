
# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE

#! linter:require:generate::str

extends = base.pl

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#*
#*  This script must define the following variables:
#*   
#*  **viewer** => an automaton in one of the accepted formats (string, regex, object...)
#*               This automaton is considered as the answer and it will be presented to the student at the end. 
#*
#*  **alphabet** => the alphabet of the automaton. e.g. ["a", "b"]
#*
#*  Example
#*```python
#*  generate==
#*  alphabet = ['a', 'b']
#*  viewer = '''
#*      #states
#*       S0
#*       S1
#*       #initials
#*       S0
#*       #accepting
#*       S1
#*       #alphabet
#*       a
#*       b
#*       #transitions
#*       S0:a>S1
#*       S1:a>S1
#*       S1:b>S0
#*  '''
#*  ==
#*  ```
#*
generate % null


#* feedback shown after a good answer.
feedback_match = 
#* feedback shown after a bad answer.
feedback_nomatch = <p class="error-state">L\'automate que vous avez construit ne correspond pas à une réponse attendue.</p>
#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">L\'automate déterministe suivant était une réponse possible à cette question.</p>
#* feedback shown for a syntax error. {0} is replaced by the occured error
feedback_syntax_error = <p class="warning-state">{0}</p>


#* override this key to change the text shown after a good answer.
form_success== #|html|
<p class="success-state">Bravo l'automate que vous avez construit est une bonne réponse.</p>
{% if not deterministic %}
    <p class="success-state">L'automate déterministe suivant était aussi une bonne réponse :</p>
    {{ viewer|component }}
{% endif %}
== 

#* override this key to change the instructions at the bottom of the editor.
form_instructions== #|html|
<p>
    <ul>
        <li> Pour créer un nouvel état, double clic gauche. Utilisez les boutons pour changer le type de votre état.<br>
            <i> Ne pas renommer les états - il y a un bug</i>
        </li>
        <li>
        Pour ajouter une transition cliquer sur le point orange de l'état de départ
        et tirer votre transition jusqu'à l'état d'arrivée.
        Pour ajuster la lettre étiquettant de la transition, cliquer sur l'étiquette et choisir "changer transition".
        </li>
    </ul>
</p>
==

# HTML FORM

title= PLEASE OVERRIDE THE KEY **title=** TO CHANGE THIS TEXT
text= PLEASE OVERRIDE THE KEY **text=** TO CHANGE THIS TEXT
form== #|html|
<!-- TIMEOUT VIEW -->
{% if attempt >= maxattempt %}
{{ viewer|component }}
{% endif %}

<!-- SUCCESS VIEW -->
{% if score == 100  %}
{{ form_success }}
{% endif %}

<!-- EDITOR VIEW -->
{{ editor|component }}

<br>

<!-- INSTRUCTIONS VIEW -->
{{ form_instructions }}

<script>

    $(function() {
        
    });
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button
        // hide submit button if needed.
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);
        const editors = document.querySelectorAll('c-automaton-editor');
        editors.forEach(editor => {
            const component = editor.ngElementStrategy.componentRef.instance;
            component.focus = function (node, connection) {
                this.debug = true;
                this.unfocus();

                this.node = node;
                this.connection = connection;
                const actions = [];

                if (this.node) {
                    this.node.classList.remove('focused');
                    this.node.classList.add('focused');

                    const isInitial = this.node.classList.contains(INITIAL_STATE);
                    const isFinal = this.node.classList.contains(FINAL_STATE);

                    if (isInitial) {
                        actions.push({
                            name: 'Non Initial',
                            action: () => {
                                this.node.classList.remove(INITIAL_STATE);
                                this.automaton.initialStates = this.automaton.initialStates.filter(
                                    state => {
                                        return state !== this.node.id;
                                    }
                                );
                                this.focus(this.node);
                            }
                        });
                    } else {
                        actions.push({
                            name: 'Initial',
                            action: () => {
                                this.node.classList.add(INITIAL_STATE);
                                this.automaton.initialStates.push(this.node.id);
                                this.focus(this.node);
                            }
                        });
                    }

                    if (isFinal) {
                        actions.push({
                            name: 'Non Final',
                            action: () => {
                                this.node.classList.remove(FINAL_STATE);
                                this.automaton.acceptingStates = this.automaton.acceptingStates.filter(
                                    state => {
                                        return state !== this.node.id;
                                    }
                                );
                                this.focus(this.node);
                            }
                        });
                    } else {
                          actions.push({
                            name: 'Final',
                            action: () => {
                                this.node.classList.add(FINAL_STATE);
                                this.automaton.acceptingStates.push(this.node.id);
                                this.focus(this.node);
                            }
                        });
                    }



                    actions.push({
                        name: 'Renommer',
                        action: async () => {
                            const title = 'État';
                            const hint = 'Entrez un nouveau nom';
                            let newState = await this.prompt(title, hint, this.node.id);

                            if (newState !== false) {
                                newState = newState.trim();
                                if (this.automaton.states.includes(newState)) {
                                    alert('État déjà présent');
                                } else {
                                    this.automaton.states = [
                                        newState,
                                        ...this.automaton.states.filter(state => {
                                            return state !== this.node.id;
                                        })
                                    ];

                                    this.automaton.acceptingStates = this.automaton.acceptingStates.map(
                                        state => {
                                            if (state === this.node.id) {
                                                return newState;
                                            }
                                            return state;
                                        }
                                    );

                                    this.automaton.initialStates = this.automaton.initialStates.map(
                                        state => {
                                            if (state === this.node.id) {
                                                return newState;
                                            }
                                            return state;
                                        }
                                    );

                                    this.automaton.transitions.forEach(transition => {
                                        if (transition.fromState === this.node.id) {
                                            transition.fromState = newState;
                                        }
                                        if (transition.toState === this.node.id) {
                                            transition.toState = newState;
                                        }
                                    });
                                    this.node.innerHTML = this.node.id = newState;
                                }
                            }
                            this.updateAlphabet();
                            this.detectChanges();
                        }
                    });

                    actions.push({
                        name: 'Supprimer',
                        action: () => {
                            // remove initial state
                            this.automaton.initialStates = this.automaton.initialStates.filter(
                                state => {
                                    return state !== this.node.id;
                                }
                            );

                            // remove acceptingStates
                            this.automaton.acceptingStates = this.automaton.acceptingStates.filter(
                                state => {
                                    return state !== this.node.id;
                                }
                            );

                            // remove state
                            this.automaton.states = this.automaton.states.filter(
                                state => {
                                    return state !== this.node.id;
                                }
                            );

                            // remove transition
                            this.automaton.transitions = this.automaton.transitions.filter(
                                transition => {
                                    return (
                                        transition.fromState !== this.node.id &&
                                        transition.toState !== this.node.id
                                    );
                                }
                            );
                            delete this.automaton.position[node.id];
                            // remove node from the dom
                            this.instance.remove(this.node);
                            this.focus();
                            this.updateAlphabet();
                        }
                    });
                }

                if (this.connection) {
                    const canvas = (connection as any).canvas as HTMLElement;
                    canvas.classList.add('focused');
                    actions.push({
                        name: 'Changer Étiquette',
                        action: async () => {
                            const s = this.connection.endpoints[0];
                            const t = this.connection.endpoints[1];
                            const transition = this.automaton.transitions.find(e => {
                                return (
                                    e.fromState === s.elementId &&
                                    e.toState === t.elementId
                                );
                            });

                            const title = 'Transition';
                            const hint =
                                'Entrez les symboles en les séparant par une virgule';
                            const input = await this.prompt(
                                title,
                                hint,
                                transition.symbols.join(',')
                            );

                            if (input !== false) {
                                const symbols: string[] = input
                                    .split(',')
                                    .map((symbol: string) => {
                                        return symbol.trim();
                                    })
                                    .filter((symbol: string) => !!symbol);

                                if (symbols.length === 0) {
                                    alert(
                                        'Vous devez saisir les symboles en les séparant par une virgule'
                                    );
                                } else {
                                    this.connection
                                        .getOverlay('transition')
                                        .setLabel(symbols.join(','));
                                    transition.symbols = symbols;
                                }

                                this.updateAlphabet();
                            }
                        }
                    });

                    actions.push({
                        name: 'Supprimer Transition',
                        action: async () => {
                            const s = this.connection.endpoints[0];
                            const t = this.connection.endpoints[1];
                            this.automaton.transitions = this.automaton.transitions.filter(
                                e => {
                                    return !(
                                        e.fromState === s.elementId &&
                                        e.toState === t.elementId
                                    );
                                }
                            );
                            this.instance.deleteConnection(this.connection);
                            this.focus(null, null);
                        }
                    });
                }

                this.actions = actions;
                this.detectChanges();
            }  
        });
    }
</script>
==




before== #|py|
import random

from automaton import Automaton
from generator import Generator

debug = False
if 'generate' not in globals():
    raise Exception('You must define a script "generate"')
exec(generate)

if 'viewer' not in globals():
    raise Exception('The script "generate" must define a variable "viewer" which is an automaton')

score = -1
attempt = 0
maxattempt = int(maxattempt)
deterministic = True
editor = Automaton.editor()
editor.debug = debug
viewer = Automaton.viewer(viewer)
==

evaluator== #|py|
from automaton import Automaton

if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, editor)
    if  attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match is True:
        score = 100
        infos, _ = Automaton.editor_properties(editor)
        deterministic = infos['deterministic']
        grade = (score, feedback_match)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==






