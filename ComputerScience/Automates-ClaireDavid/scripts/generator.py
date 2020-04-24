#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  generator.py
#
#  Copyright 2020 Cisse Mamadou [mciissee@gmail.com]

import uuid
import random
import string

from automaton import Automaton
from components import CheckboxGroup, Input

class Generator:
    """
    Helper class to generate automatons.
    """

    @staticmethod
    def alphabet(length: int, sort=False):
        """
        Generated an alphabet with letters taken randomly.

        :param length the length of the generated alphabet
        :param sort if set to True then the letters of the alphabet will be taken in alphabetical order.
        :return alphabet: str the generated alphabet
        """
        if sort:
            if length > 26:
                raise Exception('length must be <= 26')
            return [string.ascii_lowercase[i] for i in range(length)]

        alphabet = ['' for _ in range(length)]
        while len(set(alphabet)) != length:
            alphabet = ''.join(set("".join(
                random.choice(string.ascii_lowercase)
                for _ in range(length)
            )))
        return alphabet

    # DEPRECATED this method will be removed soon.
    # You should use the method "alphabet" by setting the argument sort to True to get the
    # same behavior.

    @staticmethod
    def sorted_alphabet(length: int):
        """
        Generates an alphabet with the letters taken in alphabetical order.

        :param length The length of the generated alphabet
        :return alphabet: str The generated alphabet
        """
    
        alphabet =  [string.ascii_lowercase[i] for i in range(length)]
        return alphabet


    @staticmethod
    def regex(regex, simple=False):
        """
        Generates an automaton from the given regex.

        :param regex a regex where the following metacharacters and formations
            have their usual meanings: ., *, +, ?, {m}, {m,}, {m,n}, (), |, [], 
        :param simple if set to True only the following metacharacters will be supported: 
            . => concatenation
            + => union
            * => 0+ occurences
            () => capture
        :return An instance of Automaton class.
        """
        if simple:
            regex = regex.replace('.', '').replace('+', '|')
        return Automaton.parse(regex)


    @staticmethod
    def prefix(max_symbs=2, length=4, sorted_alphabet=False):
        """
        Generates an alphabet of max_symbs letters,
        a word `prefix` of length <= length and an automaton
        recognizing the words starting with `prefix`.

        :param max_symbs max length of the alphabet
        :param length max length of the prefix
        :param sorted_alphabet if set to True then the letters of the alphabet will be taken in alphabetical order.
        :return (alphabet: str, prefix: str, automaton: Automaton)
        """
    
        alphabet = Generator.alphabet(max_symbs, sorted_alphabet)
        n = random.randint(2, length)
        prefix =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        suffix = '|'.join(list(alphabet))
        return alphabet, prefix, Automaton.parse(f'{prefix}({suffix})*')

    @staticmethod
    def suffix(max_symbs=2, length=4, sorted_alphabet=False):
        """
        Generates an alphabet of max_symbs letters,
        a word `suffix` of length <= length and an automaton
        recognizing the words ending with `suffix`.

        :param max_symbs max length of the alphabet
        :param length max length of the suffix
        :param sorted_alphabet if set to True then the letters of the alphabet will be taken in alphabetical order.
        :return (alphabet: str, suffix: str, automaton: Automaton)
        """
    
        alphabet = Generator.alphabet(max_symbs, sorted_alphabet)
        n = random.randint(2, length)
        prefix = '|'.join(list(alphabet))
        suffix =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        return alphabet, suffix, Automaton.parse(f'({prefix})*{suffix}')

    @staticmethod
    def factor(max_symbs=2, length=4, sorted_alphabet=False):
        """
        Generates an alphabet of max_symbs letters,
        a word `factor` of length <= length and an automaton
        recognizing the words contains `factor`.

        :param max_symbs max length of the alphabet
        :param length max length of the factor
        :param sorted_alphabet if set to True then the letters of the alphabet will be taken in alphabetical order.
        :return (alphabet: str, factor: str, automaton: Automaton)
        """
    
        alphabet = Generator.alphabet(max_symbs, sorted_alphabet)
        n = random.randint(2, length)
        prefix = '|'.join(list(alphabet))
        factor =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        suffix = '|'.join(list(alphabet))
        return alphabet, factor, Automaton.parse(f'({prefix})*{factor}({suffix})*')

    @staticmethod
    def sequence(max_symbs=2, length=4, sorted_alphabet=False):
        """
        Generates a random word and alphabet.
        :param length max length of the generated word.
        :param max_symbs max length of the generated alphabet.
        :param sorted_alphabet if set to True then the letters of the alphabet will be taken in alphabetical order.
        :return (alphabet: str, word: str)
        """

        alphabet = Generator.alphabet(max_symbs, sorted_alphabet)
        word_length = random.randint(2, length)
        word =  "".join(
            random.choice(alphabet)
            for _ in range(word_length)
        )
        return alphabet, word

    @staticmethod
    def counting(max_symbs=2, length=4, mode=0, sorted_alphabet=False):
        """
        Generates an alphabet of max_symbs letters,
        a letter `letter``a number `n` <= length and an automaton
        recognizing contains at least, exactly, or at most depending of
        the value of mode (-1, 0, 1)
        """

        alphabet = Generator.alphabet(max_symbs, sorted_alphabet)
        n = random.randint(2, length)
        letter = random.choice(alphabet)

        anything = '(' + '|'.join(list(alphabet)) + ')*'
        anythingexcept = '(' + '|'.join([e for e in alphabet if e != letter]) + ')*'

        regex = ''
        if mode == 0: # exactly
            regex = anythingexcept + anythingexcept.join([letter for i in range(n)]) + anythingexcept
            pass
        elif mode < 0: # at least
            regex = anything + anything.join([letter for i in range(n)]) + anything
        else: # at most
            regex = anythingexcept + anythingexcept.join([letter + '?' for i in range(n)]) + anythingexcept
        return alphabet, letter, n, Automaton.parse(regex)

    @staticmethod
    def multi_choice_question(obj, maxright=3, maxwrong=3):
        """
        Generates a multi choice question exercise to test the words recognized by the given automaton
        :param obj an automaton in any of the accepted notation.
        :param maxright max number of right answers
        :param maxwrong max number of wrong answers

        :return (checkbox: CheckboxGroup, recognized: str[])
        """

        # pre-parse to optimize otherwise random_recognized_strings and random_unrecognized_strings will parse twice
        parsed = Automaton.parse(obj)
    
        recognized = Automaton.random_recognized_strings(parsed, maxright)
        unrecognized =  Automaton.random_unrecognized_strings(parsed, maxwrong)
    
        checkbox = CheckboxGroup()
        checkbox.items = []

        for e in recognized:
            checkbox.items.append({
                "id": str(uuid.uuid4()),
                "content": e,
                "multiple": True
            })
    
        for e in unrecognized:
            checkbox.items.append({
                "id": str(uuid.uuid4()),
                "content": e,
                "multiple": True
            })
    
        random.shuffle(checkbox.items)
        return checkbox, recognized



    # TODO fix a bug where the generated Input components are always set to None inside the form= key
    @staticmethod
    def transition_table(automaton: Automaton, context: dict):
        def transition_name(state, symb):
            return f"({state}, {symb})"

        head = sorted(list(automaton.alphabet))
        rows = {}
        transitions = {}

        for state in sorted(automaton.states):
            row = []
            for symb in sorted(automaton.alphabet):
                name = transition_name(state, symb)
                transitions[name] = ''
                textinput = Input(value='')
                context[name] = textinput
                row.append(textinput)
            rows[state] = row

        for fromState, toStates in automaton.transitions.items():
            for symb, toState in toStates.items():
                name = transition_name(fromState, symb)
                transitions[name] = toState
 
        return {
            "head": head,
            "rows": rows,
            "transitions": transitions
        }





