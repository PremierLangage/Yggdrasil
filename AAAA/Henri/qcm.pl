extends = /model/basic/checkbox_rw.pl

question ==
Le fichier  suivant contient potentiellement des erreurs de syntaxes. 

<link rel="stylesheet" href="/path/to/styles/default.css">
<script src="/path/to/highlight.min.js"></script>
<script>hljs.highlightAll();</script>

<pre><code class="language-c">#include &lt;stdio.h&gt;

int main(void) {
    int i;
    for(i=0; i&lt;3; i+=1)
       printf("%d",i);
    return 0
}</code></pre>

Combien y en a t-il ?
==

right ==
0
0
==

wrong ==
1
2
3
==

nbitems = 4
minright = 1
maxright = 1