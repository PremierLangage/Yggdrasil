
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  evaluator.py
#
#  Copyright 2020 Cisse Mamadou [mciissee@gmail.com]


import uuid
import random
import string

from automaton import Automaton
from components import CheckboxGroup


class Evaluator:

    @staticmethod
    def eval_multichoice_question(checkbox: CheckboxGroup, matching: list, withanswer=True):
        right = 0
        total = 0
        for item in checkbox.items:
            item['css'] = ''
            checked = item['checked']
            content = item['content']
            if content in matching:
                total += 1
                item['css'] = 'success-border'
                if checked:
                    right += 1
                    item['css'] = 'success-border'
                elif withanswer:
                    item['css'] = 'animated pulse infinite'
            elif checked:
                item['css'] = 'error-border'
        return right, total

    @staticmethod
    def eval_transition_table(automaton, table, context):
        def transition_name(state, symb):
            return f"({state}, {symb})"
        error = False
        transitions = table['transitions']
        for state in automaton.states:
            for symb in automaton.alphabet:
                name = transition_name(state, symb)
                answer = context[name] # input component
                answer.suffix = '<i class="fas fa-check"></i>'
                if answer.value.strip().lower() != transitions[name].strip().lower():
                    error = True
                    answer.suffix = '<i class="fas fa-times"></i>'
        return error



