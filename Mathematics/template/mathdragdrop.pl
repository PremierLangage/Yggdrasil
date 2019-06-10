extends = /Mathematics/template/mathbasic.pl

html_drop_tag =@ /Mathematics/inclusion_tags/drop_tag.html
html_drag_tag =@ /Mathematics/inclusion_tags/drag_tag.html


footerbefore ==
from jinja2 import Template

_strsympyvar={}
for _namevar in list(locals().keys()):
    if isinstance(locals()[_namevar],(Basic,Matrix)):
        _strsympyvar[_namevar]=str(locals()[_namevar])


def render_drop_tag(dic):
	context = {'name':dic['name']}
	if 'style' in dic:
	    context['style'] = dic['style']
	else: 
		context['style'] = ''
	if 'display' in dic:
	    context['display'] = dic['display']
	else: 
		context['display'] = ''
    return Template(html_drop_tag).render(context)

def render_drag_tag(dic):
	context = {'name':dic['name']}
	if 'style' in dic:
	    context['style'] = dic['style']
	else: 
		context['style'] = ''
	if 'display' in dic:
	    context['display'] = dic['display']
	else: 
		context['display'] = ''
    return Template(html_drag_tag).render(context)

try:
  drop_tags
except NameError:
	pass
else:
	for tag in drop_tags:
    	locals()['input_drop_'+tag['name']] = render_drop_tag(tag)

try:
  drag_tags
except NameError:
	pass
else:
	for tag in drag_tags:
    	locals()['input_drag_'+tag['name']] = render_drag_tag(tag)
==


style==
	.target, .source, .drag-display {
	border : 2px solid Black;
	border-radius:6px;
	color:black;
	z-index:10;
	}

    div.target, div.source { /* les divs qui contiennent les champs drag-drop */
    display: inline-flex;
    border:none;
	margin : 6px;
	width : 3em;
	height : 2em;
    vertical-align:middle;
	text-align:center;
	justify-content: center;
	align-items: center;
}
div.target  {
	background:AntiqueWhite;
}
div.source  {
	background:Burlywood;
}
.drag-display {
	display:flex;
    position:absolute;
	background:inherit;
	height:inherit;
	width:inherit;
	justify-content: center;
	align-items: center;
	text-align:center;
	font-size: 1em;
	overflow:hidden;
}
==

script==
	function allowDrop(ev) {
	    ev.preventDefault();
	}
	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}
	function drop(ev, target) { // target est l'id de la cible du drop "drop_name" ou "drag_container_name"
		ev.preventDefault();

		if (!ev.target.getAttribute("ondrop")) return false;
		// data est l'id de l'élément qu'on drag "drag_name"
		var data=ev.dataTransfer.getData("text");
		// Le drop
		document.getElementById(target).appendChild(document.getElementById(data));
		var input_ajax=document.getElementById('form_' + data);// on cherche le champ 'form_drag_name'
		if (target != undefined) input_ajax.value = target;
		if (target == undefined) input_ajax.value = '';
	}
== 

text==

==



















