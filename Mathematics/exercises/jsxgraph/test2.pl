@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py
drawer =: MathDrawer

title==
Test 1
==

before==
==

text==
==

form==
{{ drawer|component }}
==

extracss==
<style>
.jxgbox {
    max-width:300px;
    width:80vw;
    max-height:300px;
    height:80vw;
    margin: 0 auto;
}
</style>
==

extrajs==
<script>
    function onMathDrawerReady(component) {
        const board = component.board;
        board.setBoundingBox([-1.25,1.25,1.25,-1.25]);
        let circle = board.create('circle',[[0,0],[0,1]],{strokeColor:'blue',fixed:true});
    }
</script>
==


