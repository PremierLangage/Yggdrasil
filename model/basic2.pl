@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Basic player

before =

text =

form =

evaluator ==
grade=(100,"")
==

extrajs==
<style>
.btn {
    border-radius: 4px !important;
    margin: 0px 4px !important;
}
</style>
<script> 
document.body.onload = addElement;

function addElement () {
  // crée un nouvel élément div
  var newDiv = document.createElement("div");
  // et lui donne un peu de contenu
  var newContent = document.createTextNode('Hi there and greetings!');
  // ajoute le nœud texte au nouveau div créé
  newDiv.appendChild(newContent);
  
  // ajoute le nouvel élément créé et son contenu dans le DOM
  var currentDiv = document.getElementById('div1');
  document.body.insertBefore(newDiv, currentDiv);
}

    function onReadyPL(nodes) {
        const actions = nodes.actions;
        actions.find('.action-save').hide();
        actions.find('.action-reset').hide();
        actions.find('.action-next').hide();



        const { origin, pathname }  = document.location;
        const link = origin + pathname;

        const buttons = actions.find('.btn-group');
        buttons.append(`
            <a type="button" class="btn btn-warning action-reroll" href="`+link+`?action=reroll">
                <i class="fas fa-dice"></i> Nouveau tirage
            </a>
        `);
        var elemDiv = document.createElement('div');
        elemDiv.innerHTML = 'coucou';
        buttons.append("coucou"); 
  
}
</script>
==

