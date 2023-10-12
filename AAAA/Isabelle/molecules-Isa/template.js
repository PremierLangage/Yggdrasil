var editor;
var submit = $('#submit_button');
var answers = [];
var dimension = 0;

function update_form() {
    $('#form_answer').val(JSON.stringify(answers.map(e => e.editor.smiles())));
    editor.clear();
    editor.repaint();
    submit.prop('disabled', answers.length == 0);
}

function push_editor(id, mol) {
    document[id] = new JSApplet.JSME(id, `${dimension}}px`, `${dimension}px`, {
        "options" : "query,hydrogens,newlook,depict,noshowdraganddropsymbolindepictmode,nozoom",
    });
    document[id].readMolecule(mol);
    document[id].deferredRepaint();
    return document[id];
}

function push_answer() {
    const mol = editor.jmeFile();
    if (!mol) {
        alert('Vous devez dessiner une molécule !')
        return;
    }
    const count = answers.length;
    const id = 'JME' + (count + 2);
    const node = $('#answers')
    node.append(`
        <div id='${id}-btn--plus' class='answer-btn--plus'>+</div>
        <div class='answer' onclick='remove_answer("${id}")'>
            <div id='${id}'></div>
        </div>
    `);
    answers.push({ id: id, editor: push_editor(id, mol) });
    update_form();
}

function remove_answer(id) {
    $(`#${id}`).parent().remove();
    const button = $(`#${id}-btn--plus`);
    if (button) {
        button.remove();
    }
    delete document[id];
    answers = answers.filter(e => e.id !== id);
    update_form();
}










