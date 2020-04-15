#!/usr/bin/env python3
# coding: utf-8

#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    General Public License for more details.
#
#  The full text of the GPL is available at:
#
#                  http://www.gnu.org/licenses/
#*****************************************************************************

def display_as_shell_this(command, output):
    r"""
    Return a nice shell looking of the command and its output in html/css
    """
    # making the div for terminal screen
    s = '<br /><div style="background-color: black; '
    s += 'background-image: radial-gradient(rgba(0, 150, 0, 0.75), black 120%); '
    #s += 'height: 80vh; '
    s += 'font: 1rem Inconsolata, monospace; '
    s += 'border-radius: 15px; padding: 10px;" >'
    s += '<pre><output style="color: white; text-shadow: 0 0 5px #C8C8C8;">'

    # if command do not end with a newline, we had it...
    while command[-1] == '\n':
        command = command[:-1]
    s += ":~$> " + command.replace('\n', ' \ <br />... ')
    s += "<br />"
    s += output.replace('\n', ' <br />')

    s += "</output></pre></div>"
    return s

