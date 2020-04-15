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
    s = ":~$> " + command.replace('\n', '\ <br />')
    s += output.replace('\n', ' <br />')
    return s
