extends = /model/math.pl

matrix =: MathMatrix
matrix.decorator = CustomMathMatrix
matrix.resizable % true


before==
M = Matrix([[1,2],[4,5]])
matrix.setmatrix(M)
==

title==
Math Matrix Component
==

text==
==

form==
{{ matrix|component}}
==

evaluator ==
score = 100
feedback = str(Matrix(matrix.getmatrix()))
==

extracss ==
<style>
.math-matrix-component {
    display:inline-block;
    position: relative;
    margin: 5px;
    vertical-align: middle;

    .matrix-input {
        border : none;
        border-radius:4px;
        text-align: center;
        font-style: italic;
        font-size: 12pt;
        color:black;
        background-color: Red !important;
        z-index:10;

    }

    .matrix-container {
        display: inline-block;
        overflow: hidden;
    }

    .matrix-table {
        table-layout:fixed;
        width: auto;
    }

    .matrix-cell {
        margin:0;
        position:relative;
        height: 2em;
        width: 3em;
    }


    mwlResizable {
        box-sizing: border-box; // required for the enableGhostResize option to work
    }
}
</style>
==
