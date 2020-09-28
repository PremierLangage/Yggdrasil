#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

def make_hide_block_on_click(nameblock, title, content, order="Voir/Réduire "):
    """
    Return a html/css/js block composed by a clickable title which display
    a possible large content when clicked. Another click reduce the content
    and so on.
    """
    # Here the clickable title 
    src_ans = '''<h3 id="''' + nameblock + '''" onmouseover="style='text-decoration:underline;cursor: pointer'" '''
    src_ans += '''onmouseout="style='text-decoration:none'">'''
    src_ans += order+'<b>' + title + '</b></h3>'

    # Now the content
    src_ans += '<div id="' + nameblock + '_div">'
    src_ans += content
    src_ans += '</div>'

    # The script ennabling the hide/unhide
    src_ans += '''<script type="text/javascript">'''
    src_ans += '''$(document).ready(function(){'''
    src_ans += '''  $("#''' + nameblock + '''_div").hide();'''
    src_ans += '''  $("#''' + nameblock + '''").click(function(){'''
    src_ans += '''    $("#''' + nameblock + '''_div").toggle();'''
    src_ans += '''  });'''
    src_ans += '''});'''
    src_ans += '''</script>'''

    return src_ans

def subnlbybr(str):
    """
    Substitute each occurences of char '\n' by '<br />' in the string
    `str` in argument.
    EXAMPLES::
        >>> subnlbybr("\\n")
        '<br/>'
    """
    return "<br/>".join(str.split("\n"))

def add_border(html_code,
               font_color=None, font_family=None, font_size=None,
               font_style=None, font_weight=None,
               background_color=None, border_radius=None):
    """
    Return `html_code` but the content is placed in a box which
    respects the arguments.
    EXAMPLES::
    
        >>> add_border("Salut!")
        ...
    """
    # CSS local for the border of the div block 
    style = 'border:1px solid black;padding:1%;margin:1%;'
    if background_color is not None:
        style += 'background-color: ' + background_color + ';'
    if border_radius is not None:
        style += 'border-radius: ' + border_radius + ';'
    html_before = '<div style="' + style + '">'

    # CSS local for the content inside the block
    style = ''
    if font_color is not None:
        style += 'color: ' + font_color + ';'
    if font_family is not None:
        style += 'font-family: ' + font_family + ';'
    if font_size is not None:
        style += 'font-size: ' + font_size + ';'
    if font_style is not None:
        style += 'font-style: ' + font_style + ';'
    if font_weight is not None:
        style += 'font-weight: ' + font_weight + ';'
    html_before += '<font style="' + style + '">'

    # Ends of blocks
    html_after = '</font></div>'
    
    return html_before + subnlbybr(html_code) + html_after

def terminal_code(msg):
    """
    Return html/CSS code to display msg with a terminal look.
    EXEMPLES::
        >>> terminal_code(">>> 1+1\n2\n")
        ...
    """
    return add_border(msg, "White", "Monospace", "0.9em", "normal", "normal", "Black", None) 

