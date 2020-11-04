# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

viewer =: GraphDrawer
viewer.graph ==
digraph BST {
    node [fontname="Arial"];
    15 -> 6;
    null0 [shape=point];
    6 -> null0;
    null1 [shape=point];
    6 -> null1;
    15 -> 18;
    18 -> 17;
    null2 [shape=point];
    17 -> null2;
    null3 [shape=point];
    17 -> null3;
    null4 [shape=point];
    18 -> null4;
}
==

before==
==

title = Graph Viewer

text==
==

form==
{{ viewer|component }}
==

evaluator==
grade = (100, "")
==

