* This document gives some guideline on how to create new template tags to facilitate the inclusion of complex `html` code in the `text` and `form` tags of a `pl` exercise. 

# The tag from the user point of view.

Assume we are creating a template tag `my_tag`, whose purpose is to insert specially formatted input field in the `form` part of an exercise. 

Such an input field could be, for instance a drop-down list of items to select from
~~~~
<span style = 'display:inline-block;' id = 'thename'>
  <select>
		 <option value='item_1'> display_1 </option>
		 <option value='item_2'> display_2 </option>
		 <option value='item_3'> display_3 </option>
  </select>
</span>
~~~~~

The person who designs the exercise should be able to insert such a field in the `form` tag of the exercise with the following syntax

~~~~
form==
{{ input_select_thename }}
==
~~~~

However, the options in the input field should be specified somewhere. This will be in the `before` tag of the exercise.

~~~~
before==
select_tags = [
	{'name' : 'thename', 
	 'options' : [
	 	['item_1', 'display_1],
	 	['item_2', 'display_2],
	 	['item_3', 'display_3]
		]
	}
==
~~~~

Moreover, the option selected by the student doing the exercise will be accessible in the tag `evaluator`as follows.

~~~~
evaluator==

if answer['select_thename'] == 'item_1':
	score = 100
else:
	score = 0
==
~~~~

# The template

To achieve this user-interface, we need three elements:
- A file `select_tag.html` as follows
~~~~
<span style = 'display:inline-block;' id = 'form_select_{{ tag.name }}'>
  <select>
  {% for item in tag.options %}
		 <option value='{{ item.0 }}'> {{ item.1 }} </option>
  {% endfor %}
  </select>
</span>
~~~~

here the id `form_select_{{ tag.name }}` insures -  assuming that `tag_name`is equal to `"thename"` and that `'item_1'` was selected by the student doing the exercise - that `answer['select_thename']'` evluates to `'item_1'`  in the tag `evaluator` of the exercise.

- A piece of code in the tag `footerbefore` of the exercise where the template `select_tag.html` is rendered with the data `select_tags` provided by the user in the `before` tag. This requires also a tag `select_tag_html` to store the above template as a string.

~~~~
select_tag_html=@  /inclusion_tags/fixed_matrix_tag.html

footerbefore==
from jinja2 import Template

def render_select_tag(tag):
	return Template(select_tag_html).render(tag)

try:
    select_tags
except NameError:
	pass
else:
	for tag in select_tags:
    	locals()['input_select_'+tag['name']] = render_select_tag(tag)
==
~~~~



# More complex tags

More complex tags may require a more complicated `render_??_tag` function, which would process the data provided by the user before feeding it to the `html` template. It could also include some additional code in the `headevaluator` tag of the exercise to process the data returned by the form to be used in evaluator as in the following example written for the `select` tag, where only the number of the option selected is kept. 

~~~~ 
headevaluator==
try:
    select_tags
except NameError:
    pass
else:
    for tag in select_tags:
    	selected_option = answer['select_' + tag['name']]
    	for i in range(len(tag['options'])) :
		if tag['options'][i][0] == selected_option:
			answer['select_' + tag['name']] = i+1
==
~~~~
Then the `evaluator` tag of the exercise should be modified as follows.
~~~~
evaluator==

if answer['select_thename'] == 1:
	score = 100
else:
	score = 0
==
~~~~




		






