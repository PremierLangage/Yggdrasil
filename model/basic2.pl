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
    function onReadyPL(nodes) {

        var elemDiv = document.createElement('div');
        elemDiv.innerHTML = 'coucou';
        nodes.append(elemDiv); 
  
}
</script>
==

