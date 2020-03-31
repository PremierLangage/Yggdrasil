extends = math.pl

mat =: MathMatrix
mat.decorator = CustomMathMatrix
mat.resizable % true


form==
{{ mat|component }}
==

settings.feedback = rightwrong

settings.maxattempt % 1

extracss ==
<style>
.matrix-input {
    border : none;
    border-radius: 4px;
    text-align: center;
    font-style: normal !important;
    font-size: 12pt;
    color:black;
    background-color: transparent !important;
    z-index:10;
}
</style>
==
