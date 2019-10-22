extends = mathbasic.pl

drawer =: MathDrawer

before==
==

title==
Math Drawer Component
==

extracss==
<style>
.math-drawer-component {
    max-width:400px;
    width:90vw;
    max-height:400px;
    height:90vw;
    margin: 0 auto;
}
</style>
==

form==
<center>
{{ drawer|component }}
</center>
==

