const INITIAL_STATE = 'automaton-state--initial';
const FINAL_STATE = 'automaton-state--final';
const EPSILON = '$';
const editors = document.querySelectorAll('c-automaton-editor');
editors.forEach((editor) => {
    const component = editor.ngElementStrategy.componentRef.instance;
    component.focus = function (node, connection) {
        console.log(this.node);

        this.debug = true;
        this.unfocus();

        this.node = node;
        this.connection = connection;
        const actions = [];


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

