extends = ../templates/editor.pl

maxattempt = 5

generate== #|py|
mode = random.choice([-1, 0, 1])

editor.automaton = {
    "alphabet": [
      "a",
      "b"
    ],
    "initialStates": [
      "S0",
      "S1",
      "S2"
    ],
    "acceptingStates": [
      "S2"
    ],
    "states": [
      "S0",
      "S1",
      "S2"
    ],
    "transitions": [
      {
        "fromState": "S0",
        "toState": "S1",
        "symbols": [
          "a"
        ]
      },
      {
        "fromState": "S1",
        "toState": "S2",
        "symbols": [
          "a"
        ]
      },
      {
        "fromState": "S2",
        "toState": "S2",
        "symbols": [
          "b"
        ]
      },
      {
        "fromState": "S1",
        "toState": "S1",
        "symbols": [
          "b"
        ]
      },
      {
        "fromState": "S0",
        "toState": "S0",
        "symbols": [
          "b"
        ]
      }
    ],
    "position": {
      "S0": {
        "x": 93,
        "y": 265
      },
      "S1": {
        "x": 315,
        "y": 207
      },
      "S2": {
        "x": 530,
        "y": 237
      }
    }
}
mode= 1
message = {
    -1: 'au moins',
    0: 'exactement',
    1: 'au plus'
}[mode]

max_symbs = 2
max_word_length = 2
alphabet, letter, occurences, viewer = Generator.counting(
    max_symbs,
    max_word_length,
    mode,
    sorted_alphabet=True
)
alphabet = ', '.join(list(alphabet))
==

title= Nombre d'occurences

text== #|html|
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }} mots ayant {{ message }} **{{ occurences }}** occurrences de la lettre **{{ letter }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==


