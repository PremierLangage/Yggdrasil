

Test suite {{feedback.name}}
{% for type,num,text,g,w in feedback.tests %}
{%  if type=="failure" %}
###<p style="background-color: Tomato;">Test {{ num }}
Failure {{text}} attendu {{w}} optenu {{g}}</p> {% endif %}
{% if type=="success" %}<p style="background-color: lightgreen;">###Test {{ num }}
success {{text}} attendu {{w}} optenu {{g}}</p>{%  endif %}
{% if type=="error" %}###Test {{ num }} Error Failure <p style="background-color: Tomato;">{{text}} {{g}}</p>{%  endif %}
{% endfor %}

{% if globalfeedback != "" %}
{{ globalfeedback }}
{% endif %}



