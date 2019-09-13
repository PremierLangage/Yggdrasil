# OCE : test 12/09/2019 KO

import random
from unidecode import unidecode

vowels = "aeiouyw"

sentence = unidecode(input())

new_sentence = ""
for i, c in enumerate(sentence.lower()):
    if c in vowels:
      new_c = random.choice(vowels)
    else:
      new_c = c
    if sentence[i].isupper():
      new_c = new_c.upper()
    new_sentence += new_c
print(new_sentence)


