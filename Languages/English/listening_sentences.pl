extends = /template/basicinput.pl

audio1 =$ /Languages/English/audio/sentence1.mp3
audio2 =$ /Languages/English/audio/sentence2.mp3
audio3 =$ /Languages/English/audio/sentence3.mp3

input.type = number

title = Listening

before ==
isol=rd.randint(3)
lst_sentences=["I'm gonna make him an offer he can't refuse.",
               "May the force be with you.",
               "Frankly, my dear, I don't give a damn."]
lstaudio=[audio1,audio2,audio3]
audiofile=lstaudio[sol-1]
==

text ==
<button onclick="playAudio()" class="btn btn-info"><i class="fas fa-volume-up"></i></button> Ecrire le nombre entendu (en caractères numériques).
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
if input.value==sol:
    grade=(100,str(dist))
else:
    grade=(0,str(dist))
==

