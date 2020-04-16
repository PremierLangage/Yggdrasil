import math
import random

# https://github.com/qntm/greenery
import fsm
import lego

# https://github.com/caleb531/automata
from automata.fa.dfa import DFA
from automata.fa.nfa import NFA

from components import AutomatonDrawer, AutomatonEditor

class Automaton:
    """
    Provides methods for the creation and manipulation of **deterministic** finite automata.

    Exemples:
    An automaton of the words starting with 'ab' for the alphabet ['a', 'b', 'c'] can be created in the following ways:
    
    ### Create from a regular expression.
    Automaton.parse('ab(a|b|c)*')

    ### Create from a string notatation.
    Automaton.parse(
    '''
        #states
        S0
        S1
        S2
        #initials
        S0
        #accepting
        S2
        #alphabet
        a
        b
        c
        #transitions
        S0:a>s1
        S1:b>s2
        S2:a,b,c>S2
    ''')

    ### Create from object notation
    Automaton.parse({
        "alphabet": ["a", "b", "c"],
        "states": ["S0", "S1", "S2"],
        "initialStates":["0"],
        "acceptingStates": ["2"],
        "transitions": [
            { "fromState": "S0", "toState": "S1", "symbols": ["a"]},
            { "fromState": "S1", "toState": "S2", "symbols": ["b"]},
            { "fromState": "S2", "toState": "S2", "symbols": ["a", "b", "c"]}
        ]
    })

    ### Create from a component 
    editor = AutomatonEditor(automaton={
        "alphabet": ["a", "b", "c"],
        "states": ["S0", "S1", "S2"],
        "initialStates":["0"],
        "acceptingStates": ["2"],
        "transitions": [
            { "fromState": "S0", "toState": "S1", "symbols": ["a"]},
            { "fromState": "S1", "toState": "S2", "symbols": ["b"]},
            { "fromState": "S2", "toState": "S2", "symbols": ["a", "b", "c"]}
        ]
    })
    Automaton.parse(editor)

    ### Create from an instance
    Automaton.parse(
        Automaton.parse('(a|b)+')
    )
    """

    def __init__(self, state_machine):
        if not isinstance(state_machine, fsm.fsm):
            raise TypeError('argument "state_machine" must be an instance of fsm.fsm')

        self.state_machine = state_machine
        self._stringifyStates()

    def __str__(self):
        return str(self.state_machine)

    # PROPERTIES

    @property
    def states(self):
        """
        Return a set of the final states of the automaton. e.g. ['S0', 'S1', 'S2']
        """
        return self.state_machine.states

    @property
    def initial(self):
        """
        Gets the initial state of the automaton.
        """
        return self.state_machine.initial

    @property
    def alphabet(self):
        """
        Gets a set of the symbols in the automaton. e.g. ['a', 'b', 'c']
        """
        return self.state_machine.alphabet

    @property
    def finals(self):
        """
        Return a set of the final states of the automaton. e.g. ['S3', 'S4']
        """
        return self.state_machine.finals

    @property
    def transitions(self):
        """
        Gets a map representing the transitions of the automaton.
        Each key of the map is the name of a state and each value is a map
        of the outgoing transitions from the state.
        e.g.

        {
            'SO': { 'a', 'S0', 'b': 'S1' },
            'S1': { 'a', 'S0', 'b': 'S2' },
            'S2': { 'b': 'S2' }
        }
        """
        return self.state_machine.map

    # STATIC METHODS

    @staticmethod
    def parse(obj):
        """
        Converts the given object to an instance of Automaton representing
        a minimal deterministic automaton equivalent to the given one.
        
        :param object any of the following types (
            str (regex or string notation) |
            dict (object notation)|
            fsm.fsm |
            Automaton |
            AutomatonEditor |
            AutomatonViewer
        )
        :return An instance of Automaton class.
        :raise TypeError if obj cannot be parsed.
        :raise SyntaxError if obj is not valid.
        """
    
        if isinstance(obj, Automaton):
            return obj

        if isinstance(obj, fsm.fsm):
            return Automaton(obj)
    
        if isinstance(obj, AutomatonEditor):
            return Automaton.from_editor(obj)

        if isinstance(obj, AutomatonDrawer):
            return Automaton.from_viewer(obj)

        if isinstance(obj, str):
            if obj.strip().count('\n') > 1:
                return Automaton.from_string_notation(obj)
            return Automaton.from_regex(obj)

        if not isinstance(obj, dict):
            raise TypeError(
                '''Automaton can be parsed from the following types only: [
                    str,
                    fsm.fsm,
                    Automaton,
                    AutomatonDrawer,
                    AutomatonEditor
                ]
                '''
            )

        if 'state_machine' in obj: # from serialized Automaton instance inside a grader
            return Automaton.parse(obj['state_machine'])

        if 'initialStates' in obj: # from object notation
            return Automaton.from_object_notation(obj)

        # from serialized fsm object inside a grader
        return Automaton(
            fsm.fsm(
                states=set(obj['states']),
                alphabet=set(obj['alphabet']),
                initial=obj['initial'],
                finals=set(obj['finals']),
                map=obj['map']
            )
        )
 
    @staticmethod
    def rand(numStates: int, numAlphabet: int, numTransitions: int):
        """
        Generates a random automaton.

        Note: The generated automaton is a minimal deterministic automaton

        :param numStates the number of states of the automaton.
        :param numAlphabet the alphabet of the automaton.
        :param numTransitions the number of transitions of the automaton.
        """

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
                    numToStates = random.randint(0, numTransitions)
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

            state_machine = fsm.fsm(
                alphabet=set(alphabet),
                states=set(states),
                initial=initial,
                finals=set(finals),
                map=transitions
            ).reduce()
    
            symbolsInTransitions = set()
            for fromState, toStates in state_machine.map.items():
                    for symb in toStates:
                        symbolsInTransitions.add(symb)

            if len(state_machine.alphabet) != len(symbolsInTransitions):
                continue

            if len(state_machine.states) == numStates:
                return Automaton(state_machine)

    @staticmethod
    def from_regex(regex: str):
        """
        Creates a minimal deterministic automaton from a regex.

        :param regex a regular expression
        :return an Automaton instance.
        :raise TypeError if regex is not a string.
        """
        if not isinstance(regex, str):
            raise TypeError('from_regex: Excepted an automaton in regex notation')
        return Automaton(lego.parse(regex).to_fsm().reduce())

    @staticmethod
    def from_editor(editor: AutomatonEditor):
        """
        Creates a minimal deterministic Automaton from the given Editor instance.
        (the automaton is determinized and minimized if needed)

        :param editor an AutomatonEditor component.
        :return an Automaton instance.
        :raise TypeError if automaton is not an instance of AutomatonEditor.
        :raise SyntaxError if automaton cannot be parsed.
        """

        if not isinstance(editor, AutomatonEditor):
            raise TypeError('parameter "editor" must be an instance of AutomatonEditor')
    
        if isinstance(editor.automaton, str):
            return Automaton.from_string_notation(editor.automaton)

        return Automaton.from_object_notation(editor.automaton)

    @staticmethod
    def from_viewer(viewer: AutomatonDrawer):
        """
        Creates a minimal deterministic Automaton from the given AutomatonDrawer instance.
        (the automaton is determinized and minimized if needed)

        :param viewer an AutomatonDrawer component.
        :return an Automaton instance.
        :raise TypeError if automaton is not an instance of AutomatonDrawer.
        :raise SyntaxError if automaton cannot be parsed.
        """

        if not isinstance(viewer, AutomatonDrawer):
            raise TypeError('parameter "viewer" must be an instance of AutomatonDrawer')
    
        if isinstance(viewer.automaton, str):
            return Automaton.from_string_notation(viewer.automaton)

        return Automaton.from_object_notation(viewer.automaton)

    @staticmethod
    def from_string_notation(stringNotation: str):
        """
        Creates a minimal deterministic Automaton from a string notation.
        (the automaton is determinized and minimized if needed)

        :param stringNotation An automaton in the string notation.
        :return Automaton object.
        :raise TypeError if stringNotation is not a string.
        :raise SyntaxError if stringNotation cannot be parsed.
        """
        
        if not isinstance(stringNotation, str):
            raise TypeError('from_string_notation: Excepted an automaton in string notation')

        lines = stringNotation.split('\n');

        states: [str] = []
        initials: [str] = []
        accepting: [str] = []
        alphabet: [str] = []
        transitions = []
        parseState = None

        parseCounts = {
            'states' : 0,
            'initials' : 0,
            'accepting' : 0,
            'alphabet' : 0,
            'transitions' : 0
        }

        for i in range(len(lines)):
            line = lines[i].strip()
            if len(line) == 0:
                continue;
            if line[0] == '#':
                parseState = line[1:]
                if parseState not in parseCounts:
                    raise SyntaxError('Line ' + (i + 1).toString() + ': invalid section name ' +
                                    parseState + '. Must be one of: states, initials, \
                                    accepting, alphabet, transitions.')
                else:
                    parseCounts[parseState] += 1
                    if parseCounts[parseState] > 1:
                        raise SyntaxError(f'Line {(i + 1)}: duplicate section name {parseState}.');
            else:
                if parseState is None:
                    raise SyntaxError('Line ' + (i + 1).toString() + ': no #section declared. \
                                    Add one section: states, initial, accepting, \
                                    alphabet, transitions.')
                elif parseState == 'states':
                    states += line.split(';')
                elif parseState == 'initials':
                    initials += line.split(';')
                elif parseState == 'accepting':
                    accepting += line.split(';')
                elif parseState == 'alphabet':
                    alphabet += line.split(';')
                elif parseState == 'transitions':
                    state_rest = line.split(':');
                    fromStates = state_rest[0].split(',')
                    parts = state_rest[1].split(';')
                    symbols: [str] = [];
                    toStates: [str] = []
                    for j in range(len(parts)):
                        left_right = parts[j].split('>');
                        symbols = left_right[0].split(',');
                        toStates = left_right[1].split(',');
                    for fromState in fromStates:
                        for toState in toStates:
                            transitions.append({
                                "fromState": fromState,
                                "toState": toState,
                                "symbols": symbols
                            })
        
        for k in parseCounts:
            if parseCounts[k] != 1:
                raise SyntaxError('Specification missing #' + parseCounts[k] +' section.')
        
        return Automaton.from_object_notation({
            "states": states,
            "initialStates": initials,
            "alphabet": alphabet,
            "acceptingStates": accepting,
            "transitions": transitions
        })

    @staticmethod
    def from_object_notation(objectNotation: dict):
        """
        Creates a minimal deterministic Automaton from an object notation.
        (the automaton is determinized and minimized if needed)

        :param objectNotation An automaton in the object notation.
        :return Automaton instance.
        :raise TypeError if objectNotation is not a dict.
        :raise SyntaxError if objectNotation cannot be parsed.
        """

        if not isinstance(objectNotation, dict):
            raise TypeError('from_object_notation: Excepted an automaton in object notation')

        if 'states' not in objectNotation or not len(objectNotation['states']):
            raise SyntaxError("Vous devez saisir un automate avec au moins un état initial et un état final!")
        if 'initialStates' not in objectNotation or not len(objectNotation['initialStates']):
            raise SyntaxError("L'automate que vous avez saisi ne contient pas d'état initial!")
        if 'acceptingStates' not in objectNotation or not len(objectNotation['acceptingStates']):
            raise SyntaxError("L'automate que vous avez saisi ne contient pas d'état final!")
        if 'alphabet' not in objectNotation or not len(objectNotation['alphabet']):
            raise SyntaxError("L'automate que vous avez saisi ne contient aucun symbole!")
        if 'transitions' not in objectNotation or not len(objectNotation['transitions']):
            raise SyntaxError("L'automate que vous avez saisi ne contient aucune transition!")

        # check the transitions of the editor
        states = objectNotation['states']
        initials = objectNotation['initialStates']
        alphabet = objectNotation['alphabet']
        finals = objectNotation['acceptingStates']

        transitions = {}
        for state in states:
            transitions[state] = {}
    
        """
        for transition in objectNotation['transitions']:
            toState = transition['toState']
            fromState = transition['fromState']
            if fromState not in transitions:
                transitions[fromState] = {}
            for symbol in transition['symbols']:
                transitions[fromState][symbol] = toState

        if len(initials) > 1: # TODO remove once multiple initial states is supported
            raise SyntaxError('Mutiple initial states is not currently supported !')

        return Automaton(
            fsm.fsm(
                states=set(states),
                alphabet=set(alphabet),
                initial=initials[0],
                finals=set(finals),
                map=transitions
            )
        )
        """

        for transition in objectNotation['transitions']:
            toState = transition['toState']
            fromState = transition['fromState']
            for symb in transition['symbols']:
                if symb not in transitions[fromState]:
                    transitions[fromState][symb] = set()
                transitions[fromState][symb].add(toState)

        # create a nfa that is equivalent to the given automaton
        nfa = NFA(
            states=set(states),
            input_symbols=set(alphabet),
            transitions=transitions,
            initial_state=initials[0],
            final_states=set(finals)
        )

        # create a dfa that is equivalent to the nfa
        dfa = DFA.from_nfa(nfa)

        state_machine = fsm.fsm(
            states=dfa.states,
            alphabet=dfa.input_symbols,
            initial=dfa.initial_state,
            finals=dfa.final_states,
            map=dfa.transitions
        )
    
        # minimize the fsm
        minimal = state_machine.reduce()

        return Automaton(minimal)

    @staticmethod
    def viewer(obj):
        """
        Gets an AutomatonDrawer component that can be displayed inside
        the form of an exercice.

        :param obj An automaton in one of the accepted format.

        Example:

        before==
        viewer = Automaton.viewer('(ab)(a|b|c)*') 
        ==

        form==
        {{ viewer | component }}
        ==
        """
        return Automaton.parse(obj).as_viewer()

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
        :param a An automaton in a any of the accepted formats.
        :param b An automaton in a any of the accepted formats.
        :raise If a or b cannot be parsed.
        """
        try:
            a = Automaton.parse(a)
            b = Automaton.parse(b)
            return a.state_machine.equivalent(b.state_machine), None
        except Exception as e:
            return False, str(e)
    
    # TODO remove this method and use `properties` method once 
    # the class supported non dfa automatons
    @staticmethod
    def editor_properties(editor: AutomatonEditor):
        """
        Gets useful informations about the given edited automaton.
        """
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

    # INSTANCE METHODS
    
    def iterate(self, fn):
        """ Call fn with fromState, toState, symb for each transition of the automaton"""
        for fromState, toStates in self.state_machine.map.items():
            for symb, toState in toStates.items():
                fn(
                    fromState,
                    toState,
                    symb
                )
 
    def as_viewer(self):
        """
        Gets an AutomatonDrawer component that can be displayed inside
        the form of an exercice.

        Example:

        before==
        viewer = Automaton.parse('(ab)(a|b|c)*') 
        ==

        form==
        {{ viewer | component }}
        ==
        """

        state_machine = self.state_machine

        states    = '#states\n' + '\n'.join([e for e in state_machine.states])
        initials  = '#initials\n' + state_machine.initial
        accepting = '#accepting\n' + '\n'.join([e for e in state_machine.finals])
        alphabet  = '#alphabet\n' + '\n'.join([e for e in state_machine.alphabet])

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

    def properties(self):
        """
        Gets useful informations about the automaton.
        :return {
            "complete": bool,
            "infinite": bool,
            "deterministic": bool,
            "reachable": bool,
            "coreachable": bool
        }
        """

        complete = True
        infinite = False
        deterministic = True

        states = self.states
        finals = self.finals
        initials = [self.initial] # TODO use self.initials once multiple initial states is supported 
        transitions = self.transitions
        alphabetLength = len(self.alphabet)

        # calculate reachable states
        reachables = []
        for state in initials:
            reachables.extend(self.reachable_states(state))
        reachables = set(reachables)

        # calculate coreachable states
        coreachables = []
        for state in finals:
            coreachables.extend(self.coreachable_states(state))
        coreachables = set(coreachables)

        # check whether the automaton is infinite
        processed = set()
        for fromState, toStates in transitions.items():
            for symb, toState in toStates.items():
                if (toState in processed) or (fromState == toState) and (fromState in coreachables):
                    infinite = True
                    break
                processed.add(fromState)
    
        # check whether the automaton is deterministic and or complete
        for state in states:
            outgoing = []
            for fromState, toStates in transitions.items():
                for symb in toStates:
                    if fromState == state:
                        outgoing.append(symb)

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

    def random_recognized_strings(self, max=3):
        """
        Gets a list of random strings accepted by the automaton.
        :param max the max number of elements of the returned list.
        """
        r = []
        i = 0
        for e in self.state_machine.strings():
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

    def random_unrecognized_strings(self, max=3):
        """
        Gets a list of random strings not accepted by the automaton.
        :param max the max number of elements of the returned list.
        """
        r = []
        i = 0
        for e in self.state_machine.everythingbut().strings():
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

    def reachable_states(self, initialState: str, shouldIncludeInitialState=True):
        """
        Calculate the reachable states of an automaton starting from the given `initialState`

        :param initialState the initial state
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
            self.iterate(consumer)
        return sorted(reachables)

    def coreachable_states(self, finalState: str, shouldIncludeFinalState=True):
        """
        Calculate the coreachable states of the automaton starting from the given `finalState`

        :param finalState the final state
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
            self.iterate(consumer)
        unreachables.add(currentState)
        return unreachables

    # PRIVATE METHODS

    def _stringifyStates(self):
        """Convert states of the automaton to string."""
        def stringify(state):
            if type(state) is str:
                return state
            return str(state)

        state_machine = self.state_machine
        alphabet = set([e for e in state_machine.alphabet if type(e) is str])
        initial = stringify(state_machine.initial)
        finals = set([
            stringify(e) for e in state_machine.finals
        ])
        states = set([
            stringify(e) for e in state_machine.states
        ])
        map = {
            stringify(fromState): {
                symb: stringify(toStates[symb]) for symb in toStates
            } for fromState, toStates in state_machine.map.items()
        }
        self.state_machine = fsm.fsm(
            alphabet=alphabet, states = states, initial=initial, finals=finals, map=map
        )





if __name__ == '__main__':
    objectNotation = {
        "alphabet": ["a", "b", "c"],
        "states": ["S0", "S1", "S2"],
        "initialStates":["S0"],
        "acceptingStates": ["S2"],
        "transitions": [
            { "fromState": "S0", "toState": "S1", "symbols": ["a"]},
            { "fromState": "S1", "toState": "S2", "symbols": ["b"]},
            { "fromState": "S2", "toState": "S2", "symbols": ["a", "b", "c"]}
        ]
    }

    stringNotation = '''
        #states
        S0
        S1
        S2
        #initials
        S0
        #accepting
        S2
        #alphabet
        a
        b
        c
        #transitions
        S0:a>S1
        S1:b>S2
        S2:a,b,c>S2
    '''

    print(Automaton.compare(objectNotation, Automaton.parse(stringNotation)))

    # ISOMORPH
    A = '''
        #states
        A
        B
        C
        #initials
        A
        #accepting
        A
        #alphabet
        a
        b
        #transitions
        A:b>C
        A:a>B
        C:a>A
        C:b>B
        B:b>A
        B:a>B
    '''

    B ='''
        #states
        D
        E
        F
        #initials
        D
        #accepting
        D
        #alphabet
        a
        b
        #transitions
        D:b>F
        D:a>E
        F:a>D
        F:b>E
        E:b>D
        E:a>E
    '''

    print(Automaton.compare(A, B))

    # properties
    print(Automaton.parse(A).properties())
    print(Automaton.editor_properties(AutomatonEditor(automaton=objectNotation)))





