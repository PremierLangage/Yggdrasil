extends = /model/basicinput.pl

audio1 =$ /Languages/English/audio/sentence1.mp3
audio2 =$ /Languages/English/audio/sentence2.mp3
audio3 =$ /Languages/English/audio/sentence3.mp3
audio4 =$ /Languages/English/audio/sentence4.mp3


title = Listening

before ==
import random as rd
k=rd.randint(0,3)
lst_sentences=["I'm gonna make him an offer he can't refuse.",
               "May the force be with you.",
               "Frankly, my dear, I don't give a damn.",
               "Who is Dominique Revuz ?"]

lstaudio=[audio1,audio2,audio3,audio4]
audiofile=lstaudio[k]
sol=lst_sentences[k]
==

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Transcrire la phrase.
==

extrajs==
<audio id="Audio" style="display:none" src="{{audiofile}}">
</audio> 
<script>
var x = document.getElementById("Audio"); 
function playAudio() { 
  x.play(); 
} 
</script>
==

evaluator ==
def minimumEditDistance(s1,s2):
    if len(s1) > len(s2):
        s1,s2 = s2,s1
    distances = range(len(s1) + 1)
    for index2,char2 in enumerate(s2):
        newDistances = [index2+1]
        for index1,char1 in enumerate(s1):
            if char1 == char2:
                newDistances.append(distances[index1])
            else:
                newDistances.append(1 + min((distances[index1],
                                             distances[index1+1],
                                             newDistances[-1])))
        distances = newDistances
    return distances[-1]

dist=minimumEditDistance(sol,input.value)

if dist<0.7*len(sol):
    grade=(100,sol)
else:
    grade=(0,sol)
==

settings.feedback = rightwrong



