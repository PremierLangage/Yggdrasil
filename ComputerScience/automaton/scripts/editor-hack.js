// TODO HACK TO REMOVE AFTER V1 RELEASE

const editors = document.querySelectorAll('c-automaton-editor');

const addKeyboardListenersToPromptInput = () => {
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

const addProperty = (component, property) => {
    if (!component.properties.find(e => e.name === property.name)) {
        component.properties.push(property);
    }
}

const createGetterSetter = (component, name) => {
    Object.defineProperty(component, name, {
        get: () => {
            return component.automaton[name];
        },
        set: (value) => {
            component.automaton[name] = value;
        }
    });
};

editors.forEach((editor) => {
    const component = editor.ngElementStrategy.componentRef.instance;

    addProperty(component, { name: 'textSetInitial', default: 'Initiale' });
    addProperty(component, { name: 'textSetNonInitial', default: 'Non initiale' });
    addProperty(component, { name: 'textSetFinal', default: 'Finale' });
    addProperty(component, { name: 'textSetNonFinal', default: 'Non finale' });
    addProperty(component, { name: 'textRenameState', default: 'Renommer' });
    addProperty(component, { name: 'textDeleteState', default: 'Supprimer' });
    addProperty(component, { name: 'textRenameSymbol', default: 'Changer étiquette' });
    addProperty(component, { name: 'textDeleteSymbol', default: 'Supprimer étiquette' });

    createGetterSetter(component, 'initialStates');
    createGetterSetter(component, 'acceptingStates');
    createGetterSetter(component, 'states');

    component.removeState =  (state) => {
         component.states =  component.states.filter(
            e => {
                return e !== state;
            }
        );
    };

    component.removeFinal = (state) => {
         component.acceptingStates =  component.acceptingStates.filter(
            e => {
                return e !== state;
            }
        );
    };
 
    component.removeInitial = (state) => {
         component.initialStates =  component.initialStates.filter(
            e => {
                return e !== state;
            }
        );
    };

    component.focus = function (node, connection) {
        const FINAL_STATE = 'automaton-state--final';
        const INITIAL_STATE = 'automaton-state--initial';
        const actions = [];
        this.debug = true;
        this.unfocus();
        this.node = node;
        this.connection = connection;
        // CLICK ON STATE
        if (this.node) {
            this.node.classList.remove('focused');
            this.node.classList.add('focused');
            const isFinal = this.node.classList.contains(FINAL_STATE);
            const isInitial = this.node.classList.contains(INITIAL_STATE);
            const stateName = this.node.id;
            // INITIAL
            if (isInitial) {
                actions.push({
                    name: this.textSetNonInitial,
                    action: () => {
                        this.removeInitial(stateName);
                        this.node.classList.remove(INITIAL_STATE);
                        this.focus(this.node);
                    }
                });
            } else {
                actions.push({
                    name: this.textSetInitial,
                    action: () => {
                        this.initialStates.push(stateName);
                        this.node.classList.add(INITIAL_STATE);
                        this.focus(this.node);
                    }
                });
            }
            if (isFinal) {
                actions.push({
                    name: this.textSetNonFinal,
                    action: () => {
                        this.removeFinal(stateName);
                        this.node.classList.remove(FINAL_STATE);
                        this.focus(this.node);
                    }
                });
            } else {
                    actions.push({
                    name: this.textSetFinal,
                    action: () => {
                        this.acceptingStates.push(stateName);
                        this.node.classList.add(FINAL_STATE);
                        this.focus(this.node);
                    }
                });
            }
            actions.push({
                name: this.textRenameState,
                action: async () => {
                    const title = 'État';
                    const hint = 'Entrez un nouveau nom';
                    addKeyboardListenersToPromptInput();    
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
                            this.node.innerHTML = node.id = newState;
                            this.node.innerHTML += '<div class="endpoint"></div>'
                        }
                    }
                    this.updateAlphabet();
                    this.detectChanges();
                }
            });
            actions.push({
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
            });
        }
        // CLICK ON TRANSITION
        if (this.connection) {
            const canvas = (connection).canvas;
            canvas.classList.add('focused');
            actions.push({
                name: this.textRenameSymbol,
                action: async () => {
                    const s = this.connection.endpoints[0];
                    const t = this.connection.endpoints[1];
                    const transition = this.automaton.transitions.find(e => {
                        return (
                            e.fromState === s.elementId &&
                            e.toState === t.elementId
                        );
                    });
                    addKeyboardListenersToPromptInput();
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
                            .map((symbol) => {
                                return symbol.trim();
                            })
                            .filter((symbol) => !!symbol);

                        if (symbols.length === 0) {
                            alert('Vous devez saisir les symboles en les séparant par une virgule');
                        } else {
                            this.connection.getOverlay('transition').setLabel(symbols.join(','));
                            transition.symbols = symbols;
                        }
                        this.updateAlphabet();
                    }
                }
            });
            actions.push({
                name: this.textDeleteSymbol,
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

                    this.updateAlphabet();
                }
            });
        }

        this.actions = actions;
        this.detectChanges();
    } 
});




