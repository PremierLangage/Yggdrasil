// TODO HACK TO REMOVE AFTER V1 RELEASE

// ORIGINAL SOURCE CODE: https://github.com/PremierLangage/components/blob/master/src/app/components/automaton-editor/automaton-editor.component.ts

// GET THE INSTANCES OF AutomatonEditorComponent FROM THE PAGE
const editors = document.querySelectorAll('c-automaton-editor');
const drawers = document.querySelectorAll('c-automaton-drawer');
drawers.forEach((drawer) => {
    const component = drawer.ngElementStrategy.componentRef.instance;
    component.onRender = function() {
        let i = 0;
        const render = () => {
            try {
                this.renderer.graph = automatonToDotFormat(
                    automatonFromString(this.automaton)
                );
                this.renderer.render();
            } catch (error) {
                console.log(error);
                i++;
                if (i < 3) {
                    setTimeout(() => render(), 300);
                }
            }
        };
        render();
    }
})
// OVERRIDE EACH INSTANCE OF THE COMPONENT
editors.forEach((editor) => {
    const component = editor.ngElementStrategy.componentRef.instance;
    
    const FINAL_STATE_CLASS = 'automaton-state--final';
    const INITIAL_STATE_CLASS = 'automaton-state--initial';

    // DYNAMICALLY ADD NEW FUNCTIONS TO THE INSTANCE OF THE COMPONENT CLASS.
    
    component.addProperty = function(property) {
        if (!this.properties.find(e => e.name === property.name)) {
            this.properties.push(property);
        }
    }

    component.createGetterSetter = function(name) {
        Object.defineProperty(this, name, {
            get: () => {
                return this.automaton[name];
            },
            set: (value) => {
                this.automaton[name] = value;
            }
        });
    };
    
    /**
     * Removes `state` from the states list of the editor.
     */
    component.removeState = function (state) {
         component.states =  component.states.filter(
            e => {
                return e !== state;
            }
        );
    };

    /**
     * Removes `state` from the finals states list of the editor.
     */
    component.removeFinal = function (state) {
         this.acceptingStates =  this.acceptingStates.filter(
            e => {
                return e !== state;
            }
        );
    };
 
    /**
     * Removes `state` from the initials states list of the editor.
     */
    component.removeInitial = function(state) {
         this.initialStates =  this.initialStates.filter(
            e => {
                return e !== state;
            }
        );
    };

    // BUTTONS TO DISPLAY WHEN A STATE IS FOCUSED 
    
    /**
     * Handles click on 'set state initial' button.
     */
    component.actionSetInitial = function () {
        const stateName = this.node.id;
        return {
            name: this.textSetInitial,
            action: () => {
                this.initialStates.push(stateName);
                this.node.classList.add(INITIAL_STATE_CLASS);
                this.focus(this.node);
            }
        }
    };

    /**
     * Handles click on 'set state non initial' button.
     */
    component.actionSetNonInitial = function () {
        const stateName = this.node.id;
        return {
            name: this.textSetNonInitial,
            action: () => {
                this.removeInitial(stateName);
                this.node.classList.remove(INITIAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    };

    /**
     * Handles click on 'set state final' button.
     */
    component.actionSetFinal = function () {
        const stateName = this.node.id;
        return {
            name: this.textSetFinal,
            action: () => {
                this.acceptingStates.push(stateName);
                this.node.classList.add(FINAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    }

    /**
     * Handles click on 'set state non final' button.
     */
    component.actionSetNonFinal = function () {
        const stateName = this.node.id;
        return {
            name: this.textSetNonFinal,
            action: () => {
                this.removeFinal(stateName);
                this.node.classList.remove(FINAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    }

    /**
     * Handles click on 'rename state' button.
     */
    component.actionRenameState = function () {
        const stateName = this.node.id;
        return {
            name: this.textRenameState,
            action: async () => {
                const title = 'État';
                const hint = 'Entrez un nouveau nom';
                addKeyboardListenerToPromptInput();    
                let newState = await this.prompt(title, hint, stateName);
                if (newState && newState.trim()) {
                    newState = newState.trim();
                    if (this.automaton.states.includes(newState)) {
                        alert('Il existe déjà un état avec ce nom !');
                    } else {
                        // replace in states
                        this.states = [
                            newState,
                            ...this.states.filter(state => {
                                return state !== stateName;
                            })
                        ];
                        // replace in initials
                        this.initialStates = this.initialStates.map(
                            state => {
                                if (state === stateName) {
                                    return newState;
                                }
                                return state;
                            }
                        );
                        // replace in finals
                        this.acceptingStates = this.acceptingStates.map(
                            state => {
                                if (state === stateName) {
                                    return newState;
                                }
                                return state;
                            }
                        );
                        // replace in transitions
                        this.automaton.transitions.forEach(transition => {
                            if (transition.fromState === stateName) {
                                transition.fromState = newState;
                            }
                            if (transition.toState === stateName) {
                                transition.toState = newState;
                            }
                        });

                        // replace in position
                        this.position[newState] = this.position[stateName];
                        delete this.position[stateName];

                        // RENDER THE WHOLE VIEW
                        this.node = undefined;
                        this.actions = [];
                        this.connection = undefined;
                        
                        this.unfocus();
                        this.onRender();
                        this.detectChanges();
                    }
                }
                this.updateAlphabet();
                this.detectChanges();
            }
        };
    };

    /**
     * Handles click on 'delete state' button.
     */
    component.actionDeleteState = function () {
        const stateName = this.node.id;
        return {
            name: this.textDeleteState,
            action: () => {
                this.removeState(stateName);
                this.removeFinal(stateName);
                this.removeInitial(stateName);
                // remove transition
                this.automaton.transitions = this.automaton.transitions.filter(
                    transition => {
                        return (
                            transition.fromState !== this.node.id &&
                            transition.toState !== this.node.id
                        );
                    }
                );
                delete this.automaton.position[stateName];
                // remove node from the dom
                this.instance.remove(this.node);
                this.focus();
                this.updateAlphabet();
            }
        };
    }

    /**
     * Handles click on 'rename transition' button.
     */
    component.actionRenameTransition = function() {
        return {
            name: this.textRenameSymbol,
            action: async () => {
                const start = this.connection.endpoints[0];
                const end = this.connection.endpoints[1];

                const transition = this.automaton.transitions.find(e => {
                    return (
                        e.fromState === start.elementId &&
                        e.toState === end.elementId
                    );
                });

                addKeyboardListenerToPromptInput();
                
                const title = 'Transition';
                const hint = 'Entrez les symboles en les séparant par une virgule';
                const input = await this.prompt(
                    title,
                    hint,
                    transition.symbols.join(',')
                );

                if (input !== false) {
                    const symbols = input
                        .split(',')
                        .map((symb) => {
                            return symb.trim();
                        })
                        .filter((symb) => !!symb);

                    if (symbols.length === 0) {
                        alert('Vous devez saisir les symboles en les séparant par une virgule');
                    } else {
                        this.connection.getOverlay('transition').setLabel(symbols.join(','));
                        transition.symbols = symbols;
                    }
                    this.updateAlphabet();
                }
            }
        };
    }

    /**
     * Handles click on 'delete transition' button.
     */
    component.actionDeleteTransition = function() {
        return {
            name: this.textDeleteSymbol,
            action: async () => {
                const start = this.connection.endpoints[0];
                const end = this.connection.endpoints[1];
                this.automaton.transitions = this.automaton.transitions.filter(
                    e => {
                        return !(
                            e.fromState === start.elementId &&
                            e.toState === end.elementId
                        );
                    }
                );
            
                this.instance.deleteConnection(this.connection);
            
                this.focus(null, null);

                this.updateAlphabet();
            }
        }
    }

    // DYNAMICALLY OVERRIDE FUNCTIONS FROM THE INSTANCE OF THE COMPONENT CLASS.
    
    /**
     * Override the function that handles focus of state|connection.
     * @param node the focused node (may be null if the focused element is connection).
     * @param connection the focused connection (may be null if the focused element is a node).
    */
    component.focus = function (node, connection) {
        this.unfocus();
    
        this.node = node;
        this.connection = connection;

        const actions = [];
        
        // FOCUSED ELEMENT IS A STATE
        if (node) {
            node.classList.remove('focused');
            node.classList.add('focused');

            const isFinalState = node.classList.contains(FINAL_STATE_CLASS);
            const isInitialState = node.classList.contains(INITIAL_STATE_CLASS);

            if (isInitialState) {
                actions.push(this.actionSetNonInitial());
            } else {
                actions.push(this.actionSetInitial());
            }

            if (isFinalState) {
                actions.push(this.actionSetNonFinal());
            } else {
                actions.push(this.actionSetFinal());
            }

            actions.push(this.actionRenameState());
            actions.push(this.actionDeleteState());
        }


        // FOCUSED ELEMENT IS A TRANSITION
        if (this.connection) {
            const canvas = (connection).canvas;
            canvas.classList.remove('focused');
            canvas.classList.add('focused');
            actions.push(this.actionRenameTransition());
            actions.push(this.actionDeleteTransition());
        }

        this.actions = actions;

        this.detectChanges();
    }

    
    component.onValidate = function (instance) {
        if (typeof(instance.automaton) === 'string') {
            instance.automaton = automatonFromString(instance.automaton);
        }
    }
    // REGISTER NEW PROPERTIES (THE REGISTERED PROPERTIES ARE USABLE INSIDE THE GRADER/BUILDER)
        
    component.addProperty({ name: 'textSetInitial', default: 'Initial' });
    component.addProperty({ name: 'zoomable', default: true });
    component.addProperty({ name: 'textSetNonInitial', default: 'Non initial' });
    component.addProperty({ name: 'textSetFinal', default: 'Final' });
    component.addProperty({ name: 'textSetNonFinal', default: 'Non final' });
    component.addProperty({ name: 'textRenameState', default: 'Renommer' });
    component.addProperty({ name: 'textDeleteState', default: 'Supprimer' });
    component.addProperty({ name: 'textRenameSymbol', default: 'Changer étiquette' });
    component.addProperty({ name: 'textDeleteSymbol', default: 'Supprimer transition' });
    
    // REGISTER NEW GETTERS/SETTERS
      
    component.createGetterSetter('initialStates');
    component.createGetterSetter('acceptingStates');
    component.createGetterSetter('states');
    component.createGetterSetter('position');
    component.createGetterSetter('transitions');


    // ADD ZOOMING FEATURE

    component.setZoom = (zoom, transformOrigin) => {
        transformOrigin = transformOrigin || [ 0.5, 0.5 ];
        const instance = component.instance;
        const el = instance.getContainer();
        el.style.overflow = 'visible';
        el.style.border = '1px solid #F5F5F5';
        const prefix = [ "webkit", "moz", "ms", "o" ];
        const scale = "scale(" + zoom + ")";
        const oString = (transformOrigin[0] * 100) + "% " + (transformOrigin[1] * 100) + "%";

        for (let i = 0; i < prefix.length; i++) {
            el.style[prefix[i] + "Transform"] = scale;
            el.style[prefix[i] + "TransformOrigin"] = oString;
        }

        el.style["transform"] = scale;
        el.style["transformOrigin"] = oString;
        
        instance.setZoom(zoom);
    };

    setTimeout(() => {
        if (component.zoomable) {
            const container = editor.querySelector('.automaton-editor-component');
            const zoomButtons = document.createElement('div');
            zoomButtons.style.position = 'absolute';
            zoomButtons.style.zIndex = 10;
            zoomButtons.style.bottom = '8px';
            zoomButtons.style.right = '8px';
            zoomButtons.style.display = 'flex';
            zoomButtons.style.alignItems = 'center';

            const zoomIn = document.createElement('button');
            zoomIn.style.backgroundColor = 'transparent';
            zoomIn.style.fontSize = '1.5em';
            zoomIn.innerHTML = '<i class="fas fa-search-plus"></i>';
            zoomButtons.appendChild(zoomIn);
            
            const zoomOut = document.createElement('button');
            zoomOut.style.backgroundColor = 'transparent';
            zoomOut.style.fontSize = '1.5em';
            zoomOut.innerHTML = '<i class="fas fa-search-minus"></i>';
            zoomButtons.appendChild(zoomOut);
            
            let zoom = 1;
            zoomIn.onclick = () => {
                zoom += .1;
                if (zoom >= 1) {
                    zoom = 1;
                }
                component.setZoom(zoom);
            };

            zoomOut.onclick = () => {
                zoom -= .1;
                if (zoom <= .2) {
                    zoom = .2;
                }
                component.setZoom(zoom);
            };
            container.appendChild(zoomButtons);
        }
    }, 300); // since zoomable property is registered dynamically wait before getting the value.

});

/**
 * Helper function to add event listener to prompt dialog.
 * this function will detect 'Escape' and 'Enter' key events to cancel/submit the form.
 */
function addKeyboardListenerToPromptInput() {
    setTimeout(() => {
        const input = document.querySelector('app-prompt input');
        const buttons = document.querySelectorAll('app-prompt .mat-button')
        const handler = (e) => {
            if (e.key === 'Enter') {
                buttons[0].click(); // confirm
                input.removeEventListener('keydown', handler);
            } else if (e.key === 'Escape') {
                buttons[1].click(); // cancel
            }
        };
        const listener = input.addEventListener('keydown', handler);
    }, 1000);
};

// CHANGE STRING NOTATION PARSING
function automatonFromString(input) {
    const lines = input.split(/\r?\n/);
    const automaton = {
        alphabet: [],
        initialStates: [],
        acceptingStates: [],
        states: [],
        transitions: [],
        position: {},
    };
    let states = [];
    let initials = [];
    let accepting = [];
    let alphabet = [];
    const transitions = [];

    let parseState = null;

    const parseCounts = {
      states : 0,
      initials : 0,
      accepting : 0,
      alphabet : 0,
      transitions : 0
    };

    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].replace(/\s/g, '');
        if (line.length === 0) {
            continue;
        } else if (line[0] === '#') {
            parseState = line.substr(1);

            if (typeof parseCounts[parseState] === 'undefined') {
                throw new Error('Line ' + (i + 1).toString() + ': invalid section name ' +
                                parseState + '. Must be one of: states, initials, \
                                accepting, alphabet, transitions.');
            } else {
                parseCounts[parseState] += 1;
                if (parseCounts[parseState] > 1) {
                    throw new Error(`Line ${(i + 1)}: duplicate section name ${parseState}.`);
                }
            }
        } else {
            if (parseState == null) {
                throw new Error('Line ' + (i + 1).toString() + ': no #section declared. \
                                Add one section: states, initial, accepting, \
                                alphabet, transitions.');
            } else if (parseState === 'states') {
                states = states.concat(line.split(';'));
            } else if (parseState === 'initials') {
                initials = initials.concat(line.split(';'));
            } else if (parseState === 'accepting') {
                accepting = accepting.concat(line.split(';'));
            } else if (parseState === 'alphabet') {
                alphabet = alphabet.concat(line.split(';'));
            } else if (parseState === 'transitions') {
                const parts = line.split(';');
                for (const part of parts) {
                    const state_rest = part.split(':');
                    const fromState = state_rest[0];
                    const rest = state_rest[1].split('>');
                    const symbols = rest[0].split(',');
                    const toState = rest[1];
                    transitions.push({
                        fromState: fromState,
                        toState: toState,
                        symbols: symbols
                    });
                }
            }
        }
    }

    for (const k in parseCounts) {
        if (parseCounts[k] !== 1) {
            throw new Error('Specification missing #' + parseCounts[k] +
            ' section.');
        }
    }

    automaton.states = states;
    automaton.initialStates = initials;
    automaton.alphabet = alphabet;
    automaton.acceptingStates = accepting;
    automaton.transitions = transitions;
    return automaton;
}

function automatonToDotFormat(automaton) {
    const result = ['digraph finite_state_machine {', '  rankdir=LR;'];
    const accStates = ['  node [shape = doublecircle];'];

    let i = 0, trans = [];

    for (i = 0; i < automaton.acceptingStates.length; i++) {
        accStates.push(automaton.acceptingStates[i].toString());
    }

    accStates.push(';');
    if (accStates.length > 2) {
      result.push(accStates.join(' '));
    }
    result.push('  node [shape = circle];');
    i = 0;
    automaton.initialStates.forEach(state => {
        result.push(`  secret_node${i} [style=invis, shape=point]`);

        const arrow = [`  secret_node${i} ->`];
        arrow.push(state);
        arrow.push('[style=bold];');
        result.push(arrow.join(' '));
        i++;
    });

    automaton.transitions.forEach(transition => {
        let initTransition = false;
        automaton.initialStates.forEach(init => {
            if (init === transition.toState) {
                trans = [' '];
                trans.push(transition.toState);
                trans.push('->');
                trans.push(transition.fromState);
                trans.push('[');
                trans.push('label =');
                trans.push('"' + transition.symbols.join(',') + '"');
                trans.push(' dir = back];');
                result.push(trans.join(' '));
                initTransition = true;
                return true;
            }
        });

        if (!initTransition) {
            trans = [' '];
            trans.push(transition.fromState.toString());
            trans.push('->');
            trans.push(transition.toState.toString());
            trans.push('[');
            trans.push('label =');
            trans.push('"' + transition.symbols.join(',') + '"');
            trans.push(' ];');
            result.push(trans.join(' '));
        }
    });

    result.push('}');

    return result.join('\n').replace(/\$/g, '$');
}
