# ****************************************************************************
#    Copyright (C) 2020 Nicolas Borie <nicolas.borie at univ-eiffel dot fr>
#
#          Distributed under the terms of the CC-BY-SA 4.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#    The full text of the CC-BY-SA 4.0 is available at:
#
#          https://creativecommons.org/licenses/by-sa/4.0/legalcode
# ****************************************************************************

# CYOA : Choose Your Own Adventure (Gamebook)

# A kind of serious game in which the user/player take decision by following
# links building a story step by step

title = CYOA template, should be overwrited

text== 
This text should never appear, you probably didn't use the CYOA template correctly.
==

form== 
This text should never appear, you probably didn't use the CYOA template correctly.
==

@ lib:/utils/sandboxio.py
@ utils.py

@ CYOA_build.py [builder.py]
@ CYOA_evaluator.py [grader.py]

game_data_file = None

