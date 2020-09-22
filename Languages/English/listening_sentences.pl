extends = /model/basic.pl

audio1 =$ /Languages/English/audio/sentence1.mp3
audio2 =$ /Languages/English/audio/sentence2.mp3
audio3 =$ /Languages/English/audio/sentence3.mp3
audio4 =$ /Languages/English/audio/sentence4.mp3


title = Listening

before ==
import random as rd
k=rd.randint(0,3)
k = 3
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

input =: Input

form ==
{{ input|component }}
==

extrajs ==
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
def levenshteinDistance(str1, str2):
    m = len(str1)
    n = len(str2)
    lensum = float(m + n)
    d = []           
    for i in range(m+1):
        d.append([i])        
    del d[0][0]    
    for j in range(n+1):
        d[0].append(j)       
    for j in range(1,n+1):
        for i in range(1,m+1):
            if str1[i-1] == str2[j-1]:
                d[i].insert(j,d[i-1][j-1])           
            else:
                minimum = min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+2)         
                d[i].insert(j, minimum)
    ldist = d[-1][-1]
    ratio = (lensum - ldist)/lensum
    return {'distance':ldist, 'ratio':ratio}

if levenshteinDistance(input.value, sol)['ratio']>0.9:
    grade=(100,sol)
else:
    grade=(0,sol)
==

settings.feedback = rightwrong




