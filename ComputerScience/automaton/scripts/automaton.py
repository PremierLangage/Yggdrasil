#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  automaton.py
#
#  Copyright 2020 Cisse Mamadou [mciissee@gmail.com]

import random
import math
import lego
import fsm

from automata.fa.dfa import DFA
from automata.fa.nfa import NFA

from components import AutomatonDrawer, AutomatonEditor

class Automaton:

    def __init__(self, fa):
        if not isinstance(fa, fsm.fsm):
            raise TypeError('argument "fa" must be an instance of fsm.fsm')

        self.fa = fa
        self.stringifyStates()

    @property
    def states(self):
        return self.fa.states

    @property
    def alphabet(self):
        return self.fa.alphabet

    @property
    def finals(self):
        return self.fa.finals

    @property
    def initial(self):
        return self.fa.initial

    @property
    def transitions(self):
        return self.fa.map


    @staticmethod
    def parse(o):
        if isinstance(o, Automaton):
            return o

        if isinstance(o, fsm.fsm):
            return Automaton(o)
    
        if isinstance(o, AutomatonEditor):
            return Automaton.from_editor(o)

        if isinstance(o, str):
            return Automaton.from_regex(o)

        if not isinstance(o, dict):
            raise TypeError(
                'Automaton can be parsed from the following types only: [Automaton, AutomatonEditor, fsm.fsm, string regex]'
            )

        if 'fa' in o: # serialized Automaton instance
            return Automaton.parse(o['fa'])

        # serialized fsm object
        return Automaton(
            fsm.fsm(
                states=set(o['states']),
                alphabet=set(o['alphabet']),
                initial=o['initial'],
                finals=set(o['finals']),
                map=o['map']
            )
        )
 
    @staticmethod
    def rand(numStates, numAlphabet, maxNumToStates, dfa=True):
        while True:
            r = {}
            i = 0
            j = 0
            k = 0
            def prefix(ch, num, s):
                ret = s
                for i in range(0, len(s) - num):
                    ret = ch + s
                return ret

            states = []
            num = len(str(numStates))
            for i in range(0, numStates):
                states.append('S' + prefix('0', num, str(i)))

            alphabet = [];
            if numAlphabet > 26:
                num = len(str(numAlphabet))
                for i in range(0, numAlphabet):
                    alphabet.append('a' + prefix('0', num, str(i)))
            else:
                alphabet = list('abcdefghijklmnopqrstuvwxyz'[0:numAlphabet])


            initial = states[0]
            finals = []
            for i in range(numStates):
                if round(random.random()):
                    finals.append(states[i])

            transitions = {}
            for i in range(numStates):
                for j in range(len(alphabet)):
                    numToStates = random.randint(0, maxNumToStates)
                    if numToStates > 0:
                        toStates = []
                        k = 0
                        while k < len(states) and len(toStates) < numToStates:
                            diff = (len(states) - k) - (numToStates - len(toStates)) + 1
                            if diff <= 0:
                                diff = 1
                            else:
                                diff = 1/diff
                            if random.random() <= diff:
                                toStates.append(states[k])
                            k += 1
                        fromState = states[i]
                        symb = alphabet[j]
                        transitions[fromState] = {symb: toState for toState in toStates}

            fa = fsm.fsm(
                alphabet=set(alphabet),
                states=set(states),
                initial=initial,
                finals=set(finals),
                map=transitions
            ).reduce()
    
            symbolsInTransitions = set()
            for fromState, toStates in fa.map.items():
                    for symb in toStates:
                        symbolsInTransitions.add(symb)

            if len(fa.alphabet) != len(symbolsInTransitions):
                continue

            if len(fa.states) == numStates:
                return Automaton(fa)

    @staticmethod
    def from_regex(regex: str):
        """
        Creates a minimal deterministic automaton from a regex.
        :param regex a regular expression
        :return an Automaton instance.
        :raise TypeError if regex is not a string.
        """
        if not isinstance(regex, str):
            raise TypeError('parameter "regex" must be a string')

        return Automaton(lego.parse(regex).to_fsm().reduce())

    @staticmethod
    def from_editor(editor: AutomatonEditor):
        """
        Creates a minimal deterministic automaton from an AutomatonEditor component instance.

        :param editor an AutomatonEditor component.
        :return an Automaton instance.
        :raise TypeError if editor is not a valid automaton.
        """
        if not isinstance(editor, AutomatonEditor):
            raise TypeError('parameter "editor" must be an instance of AutomatonEditor')

        automaton = editor.automaton
        if 'states' not in automaton or not len(automaton['states']):
            raise TypeError("Vous devez saisir un automate avec au moins un état initial et un état final!")
        if 'initialStates' not in automaton or not len(automaton['initialStates']):
            raise TypeError("L'automate que vous avez saisi ne contient pas d'état initial!")
        if 'acceptingStates' not in automaton or not len(automaton['acceptingStates']):
            raise TypeError("L'automate que vous avez saisi ne contient pas d'état final!")
        if 'alphabet' not in automaton or not len(automaton['alphabet']):
            raise TypeError("L'automate que vous avez saisi ne contient aucune transition!")

        transitions = {}
        for state in automaton['states']:
            transitions[state] = {}

        for transition in automaton['transitions']:
            toState = transition['toState']
            fromState = transition['fromState']
            for symb in transition['symbols']:
                transition = transitions[fromState].get(symb)
                if symb not in transitions[fromState]:
                    transitions[fromState][symb] = set()
                transitions[fromState][symb].add(toState)

        nfa = NFA(
            states=set(automaton['states']),
            input_symbols=set(automaton['alphabet']),
            transitions=transitions,
            initial_state=automaton['initialStates'][0],
            final_states=set(automaton['acceptingStates'])
        )

        dfa = DFA.from_nfa(nfa)
        return Automaton(fsm.fsm(
            states=dfa.states,
            alphabet=dfa.input_symbols,
            initial=dfa.initial_state,
            finals=dfa.final_states,
            map=dfa.transitions
        ).reduce())

    @staticmethod
    def viewer(o):
        """
        Returns an automaton viewer component to draw the given automaton | regex.
        """
        return Automaton.parse(o).asViewer()

    @staticmethod
    def editor():
        """Return new automaton editor component."""
        return AutomatonEditor()

    @staticmethod
    def compare(a, b):
        """
        Return a tuple (equals, error) where equals indicate whether
        the minimal deterministic automaton of `a` and `b` are equivalents
        and error an message if there is any error (None if no error)
        """
        try:
            a = Automaton.parse(a)
            b = Automaton.parse(b)
            return a.fa.equivalent(b.fa), None
        except Exception as e:
            return False, str(e)
    
    @staticmethod
    def informations(editor: AutomatonEditor):
        try:
            Automaton.parse(editor)
        except Exception as e:
            return None, str(e)
    
        def iterator(automaton: AutomatonEditor, consumer):
            transitions = automaton['transitions']
            for transition in transitions:
                fromState = transition['fromState']
                toState = transition['toState']
                for symbol in transition['symbols']:
                    consumer(fromState, toState, symbol)

        def reachableStates(automaton, initialState, iterator, shouldIncludeInitialState=True):
            """
            Calculate the reachable states of an automaton starting from the given `initialState`

            :param automaton the automaton to test
            :param initialState the initial state
            :param iterator function that accept an automaton and a consumer function as arguments
                and iterate over the transitions of the automaton to call the consumer with the following args (fromState, toState, symbol)
            :param shouldIncludeInitialState a value indicating whether initialState should be included
                or not in the response.
            :return a set of the coreachable states.
            """

            unprocessed = [initialState]
            reachables = set([initialState]) if shouldIncludeInitialState else []
            def consumer(fromState, toState, symbol):
                if currentState == fromState and toState not in reachables:
                    reachables.add(toState)
                    if toState not in unprocessed:
                        unprocessed.append(toState)
            while len(unprocessed):
                currentState = unprocessed.pop()
                iterator(automaton, consumer)
            return sorted(reachables)

        def coReachableStates(automaton, finalState, shouldIncludeFinalState=True):
            """
            Calculate the coreachable states of an automaton starting from the given `finalState`

            :param automaton the automaton to test
            :param finalState the final state
            :param iterator function that accept an automaton and a consumer function as arguments
                and iterate over the transitions of the automaton to call the consumer with the following args (fromState, toState, symbol)
            :param shouldIncludeFinalState a value indicating whether finalState should be included
                or not in the response.
            :return a set of the coreachable states.
            """
            unprocessed = [finalState]
            unreachables = set([finalState]) if shouldIncludeFinalState else []
            def consumer(fromState, toState, symbol):
                if currentState == toState and fromState not in unreachables:
                    unreachables.add(toState)
                    if fromState not in unprocessed:
                        unprocessed.append(fromState)
            while len(unprocessed):
                currentState = unprocessed.pop()
                iterator(automaton, consumer)
            unreachables.add(currentState)
            return unreachables

        complete = True
        infinite = False
        deterministic = True

        automaton = editor.automaton
        states = automaton['states']
        finals = automaton['acceptingStates']
        initials = automaton['initialStates']
        transitions = automaton['transitions']
        alphabetLength = len(automaton['alphabet'])

        # calculate reachable states
        reachables = []
        for state in initials:
            reachables.extend(reachableStates(automaton, state, iterator))
        reachables = set(reachables)

        # calculate coreachable states
        coreachables = []
        for state in finals:
            coreachables.extend(coReachableStates(automaton, state, iterator))
        coreachables = set(coreachables)

        # check whether the automaton is infinite
        processed = set()
        for transition in transitions:
            toState = transition['toState']
            fromState = transition['fromState']
            if (toState in processed) or (fromState == toState) and (fromState in coreachables):
                infinite = True
                break
            processed.add(fromState)

        # check whether the automaton is deterministic and or complete
        for state in states:
            outgoing = []
            for transition in transitions:
                toState = transition['toState']
                fromState = transition['fromState']
                if fromState == state:
                    for s in transition['symbols']:
                        outgoing.append(s)

            i = len(outgoing) # number of outgoing transitions
            j = len(set(outgoing)) # number of distinct outgoing transitions
            if i != j:
                deterministic = False
            if j != alphabetLength:
                complete = False

        n = len(states)
        return {
            "complete": complete,
            "infinite": infinite,
            "deterministic": deterministic,
            "reachable": len(reachables) == n,
            "coreachable": len(coreachables) == n
        }, None


    def randomStringInAlphabet(self, max=3):
        r = []
        i = 0
        for e in self.fa.strings():
            if e:
                r.append(''.join(e))
            else:
                r.append('ε')
            i += 1
            if i > 10:
                break
        random.shuffle(r)
        ret = []
        max = random.randint(1, max)
        for i in range(len(r)):
            ret.append(r[i])
            if i >= max:
                break
        return ret

    def randomStringNotInAlphabet(self, max=3):
        r = []
        i = 0
        for e in self.fa.everythingbut().strings():
            if e:
                r.append(''.join(e))
            else:
                r.append('ε')
            i += 1
            if i > 10:
                break
        random.shuffle(r)
        ret = []
        max = random.randint(1, max)
        for i in range(len(r)):
            ret.append(r[i])
            if i >= max:
                break
        return ret

    def iterate(self, fn):
        """ Call fn with fromState, toState, symb for each transition of the automaton"""
        for fromState, toStates in self.fa.map.items():
            for symb, toState in toStates.items():
                fn(
                    fromState,
                    toState,
                    symb
                )

    def asViewer(self):
        fa = self.fa

        states    = '#states\n' + '\n'.join([e for e in fa.states])
        initials  = '#initials\n' + fa.initial
        accepting = '#accepting\n' + '\n'.join([e for e in fa.finals])
        alphabet  = '#alphabet\n' + '\n'.join([e for e in fa.alphabet])

        transitions = []
        def fn(fromState, toState, symb):
            transitions.append(
                f'{fromState}:{symb}>{toState}'
            )
        self.iterate(fn)

        transitions = '#transitions\n' + '\n'.join(transitions)
        return AutomatonDrawer(
            automaton=f'{states}\n{initials}\n{accepting}\n{alphabet}\n{transitions}'
        )

    def stringifyStates(self):
        """Convert states of the automaton to string."""
        def stringify(state):
            if type(state) is str:
                return state
            return str(state)

        fa = self.fa
        alphabet = set([e for e in fa.alphabet if type(e) is str])
        initial = stringify(fa.initial)
        finals = set([
            stringify(e) for e in fa.finals
        ])
        states = set([
            stringify(e) for e in fa.states
        ])
        map = {
            stringify(fromState): {
                symb: stringify(toStates[symb]) for symb in toStates
            } for fromState, toStates in fa.map.items()
        }
        self.fa = fsm.fsm(
            alphabet=alphabet, states = states, initial=initial, finals=finals, map=map
        )






