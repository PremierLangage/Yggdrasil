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


def make_hide_block_on_click(nameblock, title, content):
    """
    """
    # Here the clickable title 
    src_ans = '''<h3 id="extra_doc" onmouseover="style='text-decoration:underline'" '''
    src_ans += '''onmouseout="style='text-decoration:none'">'''
    src_ans += 'Voir/Réduire <b>' + nameblock + '</b></h3>'

    # Now the content
    src_ans += '<div id="extra_doc_div">'
    src_ans += content
    src_ans += '</div>'

    # The script ennabling the hide/unhide
    src_ans += '''<script type="text/javascript">'''
    src_ans += '''$(document).ready(function(){'''
    src_ans += '''  $("#extra_doc_div").hide();'''
    src_ans += '''  $("#extra_doc").click(function(){'''
    src_ans += '''    $("#extra_doc_div").toggle();'''
    src_ans += '''  });'''
    src_ans += '''});'''
    src_ans += '''</script>'''

    return src_ans
