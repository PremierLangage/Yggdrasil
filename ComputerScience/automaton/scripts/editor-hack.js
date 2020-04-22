// TODO HACK TO REMOVE AFTER V1 RELEASE

const editors = document.querySelectorAll('c-automaton-editor');
/**
 * Hack to submit prompt dialog when user press Enter key 
 * and cancel when he press Escape key.
 */
const submitOnEnter = () => {
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
    
editors.forEach((editor) => {
    const component = editor.ngElementStrategy.componentRef.instance;
    component.focus = function (node, connection) {
        const FINAL_STATE = 'automaton-state--final';
        const INITIAL_STATE = 'automaton-state--initial';
        const actions = [];

        this.unfocus();
        this.node = node;
        this.connection = connection;


        if (this.node) {
            this.node.classList.remove('focused');
            this.node.classList.add('focused');

            const isInitial = this.node.classList.contains(INITIAL_STATE);
            const isFinal = this.node.classList.contains(FINAL_STATE);

            // INITIAL
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
                    submitOnEnter();    
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
                            this.node.innerHTML += '<div class="endpoint"></div>'
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
            const canvas = (connection).canvas;
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

                    submitOnEnter();
    
                    const title = 'Transition';
                    const hint =
                        'Entrez les symboles en les séparant par une virgule';
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



