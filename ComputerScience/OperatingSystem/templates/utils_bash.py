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

signals = {
    2: "SIGINT",
    3: "SIGQUIT",
    4: "SIGILL",
    6: "SIGABRT",
    8: "SIGFPE",
    9: "SIGKILL",
    11: "SIGSEGV",
    13: "SIGPIPE",
    14: "SIGALRM",
    15: "SIGTERM"
};


def display_as_shell_this(command, output, user=None, errout="", returncode=0):
    r"""
    Return a nice shell looking of the command and its output in html/css
    """
    s = ''
    # Information about process termination
    if returncode == 0:
        s += "Process exited normally"
    elif returncode > 0:
        s += "Process exited normally with code "+str(returncode)
    else:
        if -returncode in signals:
            s += "Process exited with signal ("+str(-returncode)+") "+signals[-returncode]
        else:
            s += "Process exited with signal ("+str(-returncode)+")"
    # making the div for terminal screen
    s += '<br /><div style="background-color: black; '
    s += 'background-image: radial-gradient(rgba(0, 150, 0, 0.75), black 120%); '
    #s += 'height: 80vh; '
    s += 'font: 1rem Inconsolata, monospace; '
    s += 'border-radius: 15px; padding: 10px;" >'
    s += '<pre><output style="color: white; text-shadow: 0 0 5px #C8C8C8;">'

    # if command do not end with a newline, we had it...
    while command[-1] == '\n':
        command = command[:-1]
    if user is not None:
        s += user+"@PLaTon"
    s += ":~$> " + command.replace('\n', ' \ <br />... ')
    s += "<br />"
    if len(errout) > 0:
        s += '<span style="color: red; text-shadow: 0 0 5px #C80000;">'
        s += errout.replace('\n', ' <br />')
        s += '</span>'
    s += output.replace('\n', ' <br />')

    s += "</output></pre></div>"
    return s

def frame_message(message, status=None):
    """
    frame the message with colors
    """
    s = ""
    if status == "ok":
        s += '<div style="background-color: #8EFF7F; '
    elif status == "warning":
        s += '<div style="background-color: #FFEEAA; '
    elif status == "error":
        s += '<div style="background-color: #FFCCCC; '
    else:
        s += '<div style="background-color: white; '
    s += 'border: 1px solid black; '
    s += 'border-radius: 15px; padding: 10px;" >'
    s += message
    s += "</div>"
    return s
    
