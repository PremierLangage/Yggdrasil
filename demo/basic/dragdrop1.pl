extends = /model/basic/dragdrop.pl

title ==
Exemple 1
==

labelcontents ==
$! > !$
$! > !$
==

solutions ==
>
=
=
>
==

text==
Comparer les expressions suivants avec les symboles {{ labels[0] | component }} et {{ labels[1] | component }}.
==

form==
<ul>
<li> 1 {{ drops[0]|component }}3 </li>
<li> 1 {{ drops[1]|component }}3 </li>
<li> 1 {{ drops[2]|component }}3 </li>
<li> I n'{{ drops[3]|component }} plus faim. </li>
</ul>
==

style.dragdrop ==
.drag-drop-component.droppable {
    position: relative;
    cursor: move;
    display: inline-flex;
    padding: 8px;
    box-sizing: border-box;
    min-width: 3em;
    min-height: 2em;
    vertical-align: middle;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 0px solid transparent;
    border-radius: 0px;
    margin: 0px;
}
.drag-drop-component {
    position: relative;
    cursor: move;
    display: inline-flex;
    padding: 8px;
    box-sizing: border-box;
    min-width: 3em;
    min-height: 2em;
    vertical-align: middle;
    text-align: center;
    justify-content: center;
    align-items: center;
    border: 0px solid transparent;
    border-radius: 0px;
    margin: 0px;

    &.dnd-drag {
      opacity: .6;
    }

    &.draggable {
      background-color: AntiqueWhite;
    }

    &.droppable {
        cursor: pointer;
        border: 0px solid black;
        &:hover,
        &.dnd-over
        {
            border: 0px solid black;
        }
    }

    &.disabled {
        border: 1px dashed;
        pointer-events: none;
        cursor: not-allowed;
    }

    nge-markdown {
      pointer-events: none;
    }
}

.btn-clear {
  font-size: 1.5em;
  cursor: pointer;
}
==
