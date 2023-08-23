@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ lib:/grader/evaluator.py [grader.py]

title = Molecule editor

before ==

==

lang = fr

text ==
Dessin d'une molecule.
==
<script type="text/javascript" src="https://unpkg.com/smiles-drawer@2.0.1/dist/smiles-drawer.min.js"></script>
    <img id="imgExample" data-smiles-options="{ 'width': 400, 'height': 400 }" />

    <div style="background-color: #000">
        <svg id="svgExample" />
    </div>
#    <script type="text/javascript" src="https://unpkg.com/smiles-drawer@2.0.1/dist/smiles-drawer.min.js"></script>
    <script>
        let moleculeOptions = {};
        let reactionOptions = {};

        let sd = new SmiDrawer(moleculeOptions, reactionOptions);
        sd.draw('OC(C(=O)O[C@H]1C[N+]2(CCCOC3=CC=CC=C3)CCC1CC2)(C1=CC=CS1)C1=CC=CS1', '#imgExample')
        sd.draw('C=CCBr.[Na+].[I-]>CC(=O)C>C=CCI.[Na+].[Br-]', '#svgExample', 'dark')
    </script>
<script>
        SmiDrawer.apply();
    </script>
# ici, on va utiliser le formulaire décrit dans smiledraw-formulaire.html
#form=@smiledraw-formulaire.html

#script=@smiledraw.js

evaluator ==
grade=(100,"Bonne réponse")
==





