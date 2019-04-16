# SelectWords

## Résumé

Identifier des mots dans un texte en cliquant dessus.

* **Inclusion:** `extends = /template/selectwords.pl`

* **Dépendance:**
    * `@ /utils/sandboxio.py`
    * `@ /grader/evaluator.py [grader.py]`
    * `@ /builder/before.py [builder.py]`
    * `form =@ /form/form_selectwords.html`


* **Clés utilisées**: `textselect, indexwords, designmode`
___


## Utilisation



## Exemples

### greek.pl

```
extends = /template/selectwords.pl

title = Grec ancien : adjectifs comparatifs

text ==
Identifier les adjectifs comparatifs dans le texte ci-dessous.
==

textselect = Δαρείου καὶ Παρυσάτιδος γίγνονται παῖδες δύο, πρεσβύτερος μὲν Ἀρταξέρξης, νεώτερος δὲ Κῦρος· ἐπεὶ δὲ ἠσθένει Δαρεῖος καὶ ὑπώπτευε τελευτὴν τοῦ βίου, ἐβούλετο τὼ παῖδε ἀμφοτέρω παρεῖναι.

indexwords = 6,9
```
