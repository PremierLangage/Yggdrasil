*This document describes various so-called `template tags`  one may use in a `pl` math exercise, and the way they work from the point of view of one who writes the exercise. These `template tags` allow to insert complex `html` content in the `form` or `text` tag of the exercise in a simple way, much like a `LaTeX` macro for instance.*

`exercise.pl`refers to the file of the exercise being written.

Useful links :
 - `emojis` to copy-paste for use in `html` strings or templates : https://coolsymbol.com/emojis/emoji-for-copy-and-paste.html

 - `css` style properties : https://www.w3schools.com/cssref/
 
 - `html color` names : https://www.w3schools.com/colors/colors_names.asp

 - `JSX graph` : https://jsxgraph.uni-bayreuth.de/wp/index.html
 
 - `sympy` in general (and matrices in particular) : https://docs.sympy.org/latest/tutorial/index.html
 
 - `sympy plot` : https://docs.sympy.org/latest/modules/plotting.html
 


# Drag and drop fields

They require the template `mathdragdrop.pl` to be loaded, the first line of `exercise.pl` should thus be 

~~~~
extends = /template/mathdragdrop.pl
~~~~

The fields need to be declared in the  `before` tag of `exercise.pl` in two lists named `drag_tags` and `drop_tags` as follows:

~~~~
before==
style = 'width: 3em; height: 2em'

drag_tags = [
    {'name':'papa', 'display':'Papa', 'style': style},
    {'name':'maman', 'display':'Maman', 'style':style},
    {'name':'smiley', 'display':'😍', 'style':style}
    {'name':'integral', 'display':'$$\int_a^b f(x)\,dx$$', 'style':style}
]
drop_tags = [
  {'name':'papa', 'display':'אבא', 'style':style}, 
  {'name':'maman', 'display':'ماما', 'style':style}
]
==
~~~~

Drag elements are web page elements which can be moved around using the mouse or track pad, while drop  elements  are the page elements on which the drag elements may be dropped. 

Our implementation of the drag/drop scheme can be described as follows:
  - The information about which element was dropped where is contained in the dictionary `answer` with one field for each *drag* element. To each such element, whose name is `name` corresponds `answer['input_drag_name']` which, if it was dropped on the drop-element named `othername` holds as value the string `'drop_othername'`.
  - Drag elements can be dropped on drop elements, but can then be dragged back to their original location, or to another free drop location. 
  - Drag elements, as well as drop elements, are displayed as boxes (one color for drag  elements and another one for drop elements). Moreover they can display content which may be any html content including images, or Latex equations, etc... The boxes can be styled as in the above example by providing a list of `css` properties. These can be used to specify size, color, text style, etc...
  - The `style` and `display` fields in the description of a tag are optional, they both default to the empty string if they are not provided.
  - Drag and drop elements are inserted in the `form` or `text` tag of `exercise.pl` as in the example below.
  
~~~~
form==
Drag the appropriate symbol : {{ input_drag_smiley | safe }} {{ input_drag_maman | safe }}
{{ input_drag_papa | safe }}
<br>
On each of the following boxes : {{ input_drop_papa | safe }} {{ input_drop_maman | safe }}
==
~~~~  

The  `safe` filter for the tags is needed to prevent escaping of `html` content, as people familiar with  `jinja2` templates know.

Then an evaluator for `exercise.pl` could be as follows:

~~~~
evaluator ==
if (answer['drag_maman'] == 'drop_maman') and  (answer['drag_papa'] == 'drop_papa'): 
    score = 100
    numerror = 0
else : 
    score = 0
    numerror = 1
==
~~~~


# Fixed size matrix input fields

They require the template `mathfixedmatrix.pl` to be loaded, the first line of `exercise.pl` should thus be 

~~~~
extends = /template/mathfixedmatrix.pl
~~~~

The fixed-size fields need to be declared in the  `before` tag of `exercise.pl` in a list named `fixed_matrix_tags` as in the following example, where the list holds a single tag description:

~~~~
before==
A = [[1,1,1],[0,0,0], [2,3,4]]
B = [[True, True, True], [False,False,False], [False,False,False]]

fixed_matrix_tags = [{
    'name':'M',
    'num_rows': 3,  
    'num_cols': 3,  
    'cell_width':'3em',
    'cell_height':'2em',
    'input_style':'width:2em',
    'matrix': A,
    'mask': B
}] 
==
~~~~

Resizable matrices are web page elements  consisting  of an array of `html` input fields surrounded by brackets. 

In our implementation of resizable matrices:
  - The size of the matrix is given by the fields `num_rows` and `num_cols`. The value of `num_rows` defaults to 2, while the value of `num_cols` defaults to that of `num_rows` if the latter is specified, and 2 otherwise.
  - The fields `cell_width` and `cell_height` hold the dimensions of each cell of the matrix. They default to reasonable values if they are not specified.
  - The field `input_style` is used to provide a list of `css` properties for the input field, whose dimensions should of course be smaller than those of the cell. These properties can be used to specify size, color, text style, etc... It defaults to the empty string.
  - The field `matrix` allows to provide an array of initial values for the input fields. It defaults to initially empty input fields.
  - The field `mask` is an array of booleans, which allows to specify which input fields in the matrix are active, as one may wish the user to enter not all the entries of the matrix but only some of them. It defaults to input fields which are all active.
 - The values entered by the user in the input fields of the matrix with name `name` are returned in `answer['fixed_matrix_name']`. This is a python double list whose entries are thus accessed as `answer['resizable_matrix_name'][i][j]`, moreover indices run from 0, not 1. Each entry is a string, which therefore should be converted to be evaluated, if the expected input is an integer or sympy expression for instance. 
  - Fixed matrix elements are inserted in the `form` tag of `exercise.pl` as in the example below.
  
~~~~
text==
Modify the first line of the matrix $% M %$ below so that its determinant is equal to one.
==

form==
<div style="text-align:center">
$% M =%$  {{ input_fixed_matrix_M | safe }}
</div>
==
~~~~  

The  `safe` filter for the tags is needed to prevent escaping of `html` content, as people familiar with  `jinja2` templates know.

Then an evaluator for `exercise.pl` could be as follows:

~~~~
evaluator ==
M = answer['resizable_matrix_A']

score = 100
numerror = 0

m = len(M)
n = len(M[0])

for i in range(m):
    for j in range(n):
        M[i][j] = sympify(M[i][j])
M = Matrix(M)

if m != n : 
    score = 0
    numerror = 1
elif M.det() != 1:
    score = 0
    numerror = 1
==
~~~~


# Resizable matrix input fields

They require the template `mathresizablematrix.pl` to be loaded, the first line of `exercise.pl` should thus be 

~~~~
extends = /template/mathresizablematrix.pl
~~~~

The resizable-matrix fields need to be declared in the  `before` tag of `exercise.pl` in a list named `resizable_matrix_tags` as in the following example, where the list holds a single tag description:

~~~~
before==
resizable_matrix_tags = [
{
    'name':'A',
    'max_rows':5,
    'max_cols':5,
    'cell_width':'3em',
    'cell_height':'2em',
    'input_style':'width:2em'
}]
==
~~~~

Resizable matrices are web page elements  consisting  of an array of `html` input fields surrounded by brackets. Moreover a hand tool allows to resize the array. They are used when a matrix is required as input from the user, but he also needs to set the right size for the matrix. 

In our implementation of resizable matrices:
  - The initial size of the matrix is 2 by 2. For the moment this is not parametrizable, nor are the minimum number of rows and columns.
  - The fields `max_rows` and `max_cols` specify to which dimensions the matrix is allowed to grow. The value of `max_rows` defaults to 5, while the value of `max_cols` defaults to that of `max_rows` if the latter is specified, and 5 otherwise.
  - The fields `cell_width` and `cell_height` hold the dimensions of each cell of the matrix. They default to reasonable values if they are not specified.
  - The field `input_style` is used to provide a list of `css` properties for the input field, whose dimensions should of course be smaller than those of the cell. These properties can be used to specify size, color, text style, etc... It defaults to the empty string.
  - For now an initial array of values may not be provided for the matrix. 
  - The values entered by the user in the input fields of the matrix with name `name` are returned in `answer['resizable_matrix_name']`. This is a python double list whose entries are thus accessed as `answer['resizable_matrix_name'][i][j]`, moreover indices run from 0, not 1. Each entry is a string, which therefore should be converted to be evaluated, if the expected input is an integer or sympy expression for instance. 
  - Resizable matrix elements are inserted in the `form` tag of `exercise.pl` as in the example below.
  
~~~~
text==
Enter a 4 by 4 antisymmetric matrix $% A %$ with determinant equal to 1 below. 
==

form==
<div style="text-align:center">
$% A =%$  {{ input_resizable_matrix_A | safe }}
</div>
==
~~~~  

The  `safe` filter for the tags is needed to prevent escaping of `html` content, as people familiar with  `jinja2` templates know.

Then an evaluator for `exercise.pl` could be as follows:

~~~~
evaluator ==
A = answer['resizable_matrix_A']

score = 100
numerror = 0

m = len(A)
n = len(A[0])

for i in range(m):
    for j in range(n):
        A[i][j] = sympify(A[i][j])
A = Matrix(A)

if (m != 4) or (n != 4) : 
    score = 0
    numerror = 1
elif A != A.T:
    score = 0
    numerror = 1
elif A.det() != 1:
    score = 0
    numerror = 1
==
~~~~

# Function plot fields

They require the template `mathplotlib.pl` to be loaded, the first line of `exercise.pl` should thus be 

~~~~
extends = /template/mathplotlib.pl
~~~~

Moreover, the plots are generated using the `sympy.plot` package, hence the `before`tag of `exercise.pl` should contain the line 
~~~~
from sympy.plotting import plot
~~~~

Unlike the other template tags, the template tags for plots are automaticaly generated from sympy plots. They are not designed to return  user input, only to display a plot. For instance, assume the `before`tag of `exercise.pl` looks like this:
~~~~
before==
from sympy.plotting import plot
x = symbols('x')
graph_1 = plot(x**2,(x,-2, 2))
graph_2 = plot(sin(x),(x,-2, 2))
==
~~~~

then the plots can be inserted in the tags `text`or `form` of `exercise.pl`as follows
~~~~
text== 
which of these function plot do you find prettier ?
<br>
<span style="width:300px;">{{ graphe_1 | safe }}</span>
<span style="width:300px;">{{ graphe_2 | safe }}</span>
== 
~~~~

Another possible use of plots is as the `display` field of a drag element. Such a field may be any `html` content, but cannot be a template. Therefore we provide a function which returns the `html`string corresponding to the plot, namely `render_plot(arg)`, where `arg`is a plot. An example is the following equivalent of the above example

~~~~
before==
from sympy.plotting import plot
x = symbols('x')
graph_1 = plot(x**2,(x,-2, 2))
graph_2 = plot(sin(x),(x,-2, 2))

html_graph_1 = render_plot(graph_1)
html_graph_2 = render_plot(graph_2)

style = 'width: 300px; height: 200px'

drag_tags = [
    {'name':'graph_1', 'display':html_graph_1, 'style': style},
    {'name':'graph_2', 'display':html_graph_2, 'style': style}
]
drop_tags = [
  {'name':'here', 'display':'drop here', 'style':style}
]
==

text== 
Drop the function plot you find prettier in the designated area.

Function plots:
<br>
{{ input_drag_graph_1 }} {{ input_drag_graph_2 }}
<br>
<br>
{{ input_drop_here }}
==
~~~~

# JSXGraph fields

They require the template `mathjsxgraph.pl` to be loaded, the first line of `exercise.pl` should thus be 

~~~~
extends = /template/mathjsxgraph.pl
~~~~

`JSXGraph` is a javascript-based library for dynamical geometry, i.e. geometrical constructions which can be modified by the user through interaction with his mouse or trackpad. 

The javascript code for the construction is specified in the tag `jsxgraph_script`. An optional tag `jsxgraph_capture` allows to specify a list of names of javascript functions defined in `jsxgraph_script` with no arguments. 

These functions are used to return user input, as in the following example where:
- Random coordinates *x* and *y* are generated in the  `before` tag.
- The `javascript` code in `jsxgraph_script` initializes a drawing board, and creates a point *P* with coordinates *x* and *y* in the board, as well as a circle *A*.
- The `javascript` code in `jsxgraph_script` defines the function `isInA()` whose value is `True` or `False` according to wether the point *P* is in the circle *A* or not.
- The tag `jsxgraph_capture` indicates that the value of `isInA()` will be captured upon validation by the user. 
Note that the tag `jsxgraph_script` is a template, i.e. may contain tags ``{{ name }}``, where `name`is the name of a variable defined before, but also other tags with the `jinja2` syntax. 

~~~~
before ==
x = rd.uniform(-4,4)
y = rd.uniform(-4,4)
==

jsxgraph_script ==

var jxg_board = JXG.JSXGraph.initBoard(
    'jxg_container', 
    {
        boundingbox:[-5, 5, 5, -5],
        axis:false,
        grid:false,
        showCopyright:false,
        showNavigation:false
    }
);
var P = jxg_board.create(
    'point',
    [{{ x }}, {{ y }}],
    {
        name:'P',
        color:'blue'
    }
);

var A = jxg_board.create(
    'circle',
    [[-2,0],[0,0]],
    {
        name:'A',
        strokeColor:'pink',
        label:{strokeColor:'pink'},
        fixed:true,
        fillColor:'lightpink',
        hasInnerPoints: true,
        highlight: false,
        opacity: 0.5,
        withLabel: true
    }
);

function isInA(){
/* the coordinates of P need to be translated to screen coordinates, which 
is apparently what the method hasPoint(x,y) needs as (x,y). */
    var c = new JXG.Coords(JXG.COORDS_BY_USER, [P.X(), P.Y()], jxg_board);
    return A.hasPoint(c.scrCoords[1], c.scrCoords[2]);
}
==

jsxgraph_capture = ["isInA"]
~~~~

The `jsxgraph`board is inserted in the `text` `form`tag of `exercise.pl` using the template tag `{{ jsx_graph | safe }}`. The  `safe` filter for the tags is needed to prevent escaping of `html` content, as people familiar with  `jinja2` templates know.

After user validation, the value of `isInA()` is stored in `answer['jsxgraph_isInA']`. 

Therefore the rest of the code for `exercise.pl` could be  as follows:

~~~~
text ==
In the figure below move the point $%P%$ inside region $%A%$.
==

form ==
{{ jsxgraph | safe }}
==

evaluator ==
if (answer['jsxgraph_isInA'] == True):
    score = 100
else : 
    score = 0
==
~~~~
