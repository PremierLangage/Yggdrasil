



extends= regexp1.pl

title= Une expression régulière pour identifier une adresse email 

doc==

<a href="https://docs.python.org/fr/3/howto/regex.html"> La doc RE  expressions régulières.</a>

<div style="font-size:1em">
<details><summary>Fichier exemple <button onclick="docopy('exemple.py')">Copy exemple</button></summary><blockquote id="exemple" style="white-space: pre-line" 
><pre>
{{lexemple}}
</pre>
</blockquote>
</details>

==


text==

Ecrire une fonction **checkemail(chaine)** qui vérifie que la chaine est une adresse email correct.

Une adresse email contient un caractère '@' qui sépare la partie locale du serveur.

La partie locale est composé de caractères <a href="https://fr.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange">ASCII</a>, ou  les caractères spéciaux doivent êêtre déspécialisés avec des anti-slash (barre oblige \ ).

Même chose pour le partie serveur.

Seul le carctère point "." a des contraintes: il ne peut apparaitre en premier, ni en dernier, ni être répété.




==

