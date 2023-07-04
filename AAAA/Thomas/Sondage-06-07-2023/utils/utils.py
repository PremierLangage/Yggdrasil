"""
Author : Antonin JEAN
Date : 15/05/2023

-*-
Utils file containing function related to dev usage

Contact: ofghanirre@gmail.com
"""

import sys

def log(message : str):
    print(f"Log:\n{message}\n", file=sys.stderr)

def log_print():
    print(f"Exited program to display logging (usage of function utils.log_print)", file=sys.stderr)
    sys.exit(42)

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