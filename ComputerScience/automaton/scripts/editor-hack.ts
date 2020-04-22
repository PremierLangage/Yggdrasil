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


  
        this.actions = actions;
        this.detectChanges();
    } 
});

