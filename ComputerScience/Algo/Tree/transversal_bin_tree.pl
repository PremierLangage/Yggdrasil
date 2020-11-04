#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

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

