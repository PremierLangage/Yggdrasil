import math
import copy
import random
import string

# https://github.com/qntm/greenery
import fsm
import lego

# https://github.com/caleb531/automata
from automata.fa.dfa import DFA
from automata.fa.nfa import NFA

from components import AutomatonDrawer, AutomatonEditor

import fa, reex

def fado_from_string(string_notation):
    nfa = fa.NFA()
    lines = string_notation.splitlines();

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

    for i, line in enumerate(lines):
        line = line.strip()
        if len(line) == 0:
            continue
        if line[0] == '#':
            parseState = line[1:]
            if parseState not in parseCounts:
                raise SyntaxError(f'Line {i + 1}: invalid section name '
                                  f'{parseState}. Must be one of: states, initials, '
                                  f'accepting, alphabet, transitions.')
            else:
                parseCounts[parseState] += 1
                if parseCounts[parseState] > 1:
                    raise SyntaxError(f'Line {i + 1}: duplicate section name {parseState}.');
            continue
        if parseState is None:
            raise SyntaxError(f'Line {i + 1}: no #section declared. '
                              f'Add one section: states, initial, accepting, '
                              f'alphabet, transitions.')
        if parseState == 'states':
            for s in line.split(';'):
                nfa.addState(s)
            continue
        if parseState == 'initials':
            for s in line.split(';'):
                nfa.addInitial(nfa.stateIndex(s))
            continue
        if parseState == 'accepting':
            accepting += line.split(';')
            for s in line.split(';'):
                nfa.addFinal(nfa.stateIndex(s))
            continue
        if parseState == 'alphabet':
            for letter in line.split(';'):
                nfa.addSigma(letter)
            continue
        if parseState == 'transitions':
            parts = line.split(';')
            for part in parts:
                fromState, rest = part.split(':')
                symbols, toState = rest.split('>')
                for symb in symbols.split(','):
                    nfa.addTransition(nfa.stateIndex(fromState), 
                                      symb,
                                      nfa.stateIndex(toState))

    for k in parseCounts:
        if parseCounts[k] != 1:
            raise SyntaxError('Specification missing #' + parseCounts[k] +' section.')
    return nfa

# moved in automaton class
#def fado_from_editor(editor):
#    return fado_from_string(editor.automaton)

def fado_to_string(nfa):
    states = '\n'.join(nfa.States)
    initials = '\n'.join(nfa.States[i] for i in nfa.Initial)
    finals = '\n'.join(nfa.States[i] for i in nfa.Final)
    sigma = '\n'.join(nfa.Sigma)
    delta = '\n'.join(f'{nfa.States[from_]}:{sym}>{nfa.States[to]}' for from_ in nfa.delta for sym in nfa.delta[from_] for to in nfa.delta[from_][sym])
    return f'''
#states
{states}
#initials
{initials}
#accepting
{finals}
#alphabet
{sigma}
#transitions
{delta}
'''

class Automaton:
    """
    Provides methods for the creation and manipulation of **deterministic** finite automata.

    Exemples:
    An automaton of the words starting with 'ab' for the alphabet ['a', 'b', 'c'] can be created in the following ways:
    
    ### Create from a regular expression.
    Automaton.parse('ab(a|b|c)*')

    ### Create from a string notation.
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
        S0:a>S1
        S1:b>S2
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
        "initialStates":["S0"],
        "acceptingStates": ["S2"],
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
    def syntax_simple_regex(chaine: str, alphabet=None) :
        """
        Return True if chaine is a simple regex with respect to alphabet
           Allowed simple regex : Sregex
               any symbol from the alphabet, '€' and 'ε'
               (Sregex) -- capture
               Sregex.Sregex -- concatenation
               SregexSregex -- concatenation
               Sregex+Sregex -- union
               Sregex* -- Kleene star
        
           symbols '€' and 'ε' represent the empty word
        
        :param alphabet if not specified alphabet contains all lowercaps letter
        """
        copie = chaine
        if alphabet is None:
            alphabet = set(string.ascii_letters+string.digits)
        authorized_letters = alphabet|{'€','ε'}
        special_symbols = {'.','+','*','(',')'}
        if any(c not in authorized_letters|special_symbols for c in copie):
            return False
        for c in authorized_letters:
            copie = copie.replace(c,'S')
        fini = False
        while not fini:
            if 'S*' in copie :
                copie = copie.replace('S*', 'S')
                continue
            if 'SS' in copie :
                copie = copie.replace('SS', 'S')
                continue
            if 'S.S' in copie :
                copie = copie.replace('S.S', 'S')
                continue
            if '(S)' in copie :
                copie = copie.replace('(S)', 'S')
                continue
            if 'S+S' in copie :
                copie = copie.replace('S+S', 'S')
                continue
            fini = True
    
        return copie == 'S'

    @staticmethod
    def from_regex(regex: str, alphabet=None, simple=False):
        # keep using this function for non simple regex
        # For simple regex, use from_regex_nd
        """
        Creates a minimal deterministic automaton from a regex.

        :param regex a regex where the following metacharacters and formations
            have their usual meanings: ., *, +, ?, {m}, {m,}, {m,n}, (), |, [], 
        :param alphabet can be specified for simple regex syntax check
        :param simple if set to True only simple regex are allowed. See syntax_simple_regex for details
            . concatenation, + union, * Kleene Star, () capture
        :return an Automaton instance.
        :raise TypeError if regex is not a string.
        """

        # epsilon symbol in lego
        epsilon = ''

        if not isinstance(regex, str):
            raise TypeError('from_regex: Excepted an automaton in regex notation')

        if simple:
            if not Automaton.syntax_simple_regex(regex, alphabet) :
                    raise Exception("Syntax error : this is not a simple regex")        
            regex = regex.replace('.', '').replace('+', '|').replace('€',epsilon).replace('ε',epsilon)

        return Automaton(lego.parse(regex).to_fsm().reduce())

    @staticmethod
    def from_regex_nd(regex: str, alphabet=None, simple=False):
        #TODO -- Test the fonction for non simple regex -- in particular dealin with epsilon might not work.
        """
        Creates a nondeterministic automaton from a regex using Fado glushkov algorithm.
        TODO fix the problem with states names to be able to use Position method in Fado

        :param regex a regex where the following metacharacters and formations
            have their usual meanings: ., *, +, ?, {m}, {m,}, {m,n}, (), |, [], 
        :param alphabet can be specified for simple regex syntax check
        :param simple if set to True only simple regex are allowed. See syntax_simple_regex for details
            . concatenation, + union, * Kleene Star, () capture
        :return an Automaton instance.
        :raise TypeError if regex is not a string.
        """

        # epsilon symbol in Fado
        epsilon = '@epsilon'

        if not isinstance(regex, str):
            raise TypeError('from_regex: Excepted an automaton in regex notation')

        # syntax check for simple expression
        if simple:
            if not Automaton.syntax_simple_regex(regex, alphabet) :
                    raise Exception("Syntax error : this is not a simple regex")        
            regex = regex.replace('.', '').replace('+', '|').replace('€',epsilon).replace('ε',epsilon)

        a = reex.str2regexp(regex).nfaPosition()

        # A garder pour avoir le nom des états sous forme a1,b2 etc
        #a.States = [s.replace('(', '').replace(')', '').replace(',', '').replace("'", '').replace(' ', '') for s in a.States]

        # A garder pour avoir les noms des états comme la convention des exo L2
        def rename(statename):
            if statename == 'Initial':
                return 'S0'
            return 'S' + statename.split(',')[1].replace(')', '').replace(' ', '')
        a.States = [rename(s) for s in a.States]
        return fado_to_string(a)

#    @staticmethod
#    def from_regex(regex: str):
#        """
#        Creates a minimal deterministic automaton from a regex.
#
#        :param regex a regular expression
#        :return an Automaton instance.
#        :raise TypeError if regex is not a string.
#        """
#        if not isinstance(regex, str):
#            raise TypeError('from_regex: Excepted an automaton in regex notation')
#        return Automaton(lego.parse(regex).to_fsm().reduce())

    # Réfléchir où mettre cette méthode lors du grand nettoyage
    @staticmethod
    def string_soluce_det(nfa_string):
        """
        Creates a determinic automaton in string representation
        Rename states wrt instructions givent to the students
        So far to be used with NFA with <10 states named from 0... TO FIX

        :param nfa_string a nfa given in string notation
        """

        # Attention, prends les index et non les noms des états du nfa dans le determinisation pour construire les noms du dfa
        a = fado_from_string(nfa_string).toDFA().complete(dead='P').toNFA()

        # A garder pour avoir les noms des états comme la convention des exo L2
        def rename(statename):
            if statename == 'P':
                return statename
            return ''.join(map(str, sorted(statename)))
#            return statename.replace('(','').replace(')', '').replace(' ', '')
        a.States = [rename(s) for s in a.States]

        return fado_to_string(a)

    # Réfléchir où mettre cette méthode lors du grand nettoyage
    @staticmethod
    def string_soluce_product(nfa_string1, nfa_string2, mode='intersect'):
        """
        Creates a non determinic automaton in string representation
        corresponding to the product of the two nfa
        Set final states depending in type parameter
        
        :param nfa_string1 a nfa given in string notation
        :param nfa_string2 a nfa given in string notation
        :param mode str to specify which langage should be defined by the product
            default 'intersect'
            'union' build L1UL2  raise exception if input automata are not complete
            'minusright' build L1\L2 raise exception if nfa_string2 is not det complete
            'minusleft' build L2\L1 raise exception if nfa_string1 is not det complete
            'symdiff' build (L2\L1)U(L1\L2) raise exception if input automata are not deterministic and complete
        """
        nfa1 = fado_from_string(nfa_string1)
        nfa2 = fado_from_string(nfa_string2)

        def compute_product():
            a = nfa1.product(nfa2)
            xx = []
            for (x1,x2) in a.States:
                    if x1 == '@empty_set' or x2 == '@empty_set':
                        xx.append(a.stateIndex((x1,x2)))
            for x in xx:
                a.deleteState(x)
            return a

        if mode == 'intersect':
            a = compute_product()
            #set final states
            for x in [(nfa1.States[f1], nfa2.States[f2]) for f1 in nfa1.Final for f2 in nfa2.Final]:
                if x in a.States:
                    a.addFinal(a.stateIndex(x))
        elif mode == 'union':
            if nfa1.completeP() and nfa2.completeP():
                a = nfa1.product(nfa2)
                #set final states
                for (x1,x2) in a.States:
                    if nfa1.stateIndex(x1) in nfa1.Final or nfa2.stateIndex(x2) in nfa2.Final:
                        a.addFinal(a.stateIndex((x1,x2)))
            else:
                ##### les deux automates doivent être complets
                pass
        elif mode == 'minusright' :
            if nfa2.completeP() and nfa2.determinicP():
                a = nfa1.product(nfa2)
                #set final states
                for (x1,x2) in a.States:
                    if nfa1.stateIndex(x1) in nfa1.Final and nfa2.stateIndex(x2) not in nfa2.Final:
                        a.addFinal(a.stateIndex((x1,x2)))
            else:
                ##### les nfa2 doit être det complet
                pass
        elif mode == 'minusleft' :
            if nfa1.completeP() and nfa1.determinicP():
                a = nfa1.product(nfa2)
                #set final states
                for (x1,x2) in a.States:
                    if nfa1.stateIndex(x1) not in nfa1.Final and nfa2.stateIndex(x2) in nfa2.Final:
                        a.addFinal(a.stateIndex((x1,x2)))
            else:
                ##### les nfa1 doit être det complet
                pass
        elif mode == 'symdiff' :
            if nfa1.completeP() and nfa1.determinicP() and nfa2.completeP() and nfa2.determinicP():
                a = nfa1.product(nfa2)
                #set final states
                for (x1,x2) in a.States:
                    if (nfa1.stateIndex(x1) in nfa1.Final and nfa2.stateIndex(x2) not in nfa2.Final) or (nfa1.stateIndex(x1) not in nfa1.Final and nfa2.stateIndex(x2) in nfa2.Final):
                        a.addFinal(a.stateIndex((x1,x2)))
            else:
                ##### les deux automates doivent être det complet
                pass
        else:
            ### mode inconnu
            pass



        # A garder pour avoir les noms des états comme la convention des exo L2
        def rename(statename):
            return ''.join(map(str, statename))
        
        a.States = [rename(s) for s in a.States]

        return fado_to_string(a)


    @staticmethod
    def fado_from_editor(editor):
        return Automaton.fado_from_object_notation(editor.automaton)
    

    @staticmethod
    def string_notation_from_editor(editor):
        return fado_to_string(Automaton.fado_from_object_notation(editor.automaton))

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
                    ## variante avec des transitions de la forme state:symbols>state avec les lettres séparées par des , quand il y en a plusieurs
                    # autorise à avoir plusieurs transitions sur une même ligne avec des ; entre deux transitions
                    parts = line.split(';')
                    for part in parts:
                        fromState, rest = part.split(':')
                        symbols, toState = rest.split('>')
                        transitions.append({
                            "fromState": fromState,
                            "toState": toState,
                            "symbols": symbols.split(',')
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

        states = copy.deepcopy(objectNotation['states'])
        finals = copy.deepcopy(objectNotation['acceptingStates'])
        initials = copy.deepcopy(objectNotation['initialStates'])
        alphabet = copy.deepcopy(objectNotation['alphabet'])
        transitions = copy.deepcopy(objectNotation['transitions'])
        
        # create a standard automaton
        if len (initials) > 1:
            # create new initial state not in the existing states
            new_initial = 'Ø'
            while new_initial in states:
                new_initial = new_initial + 'Ø'

            # for each transition (p, a, q) add new transition from Ø to q if p is a initial state
            for transition in transitions:
                toState = transition['toState']
                fromState = transition['fromState']
                symbols = transition['symbols']
                if fromState in initials:
                    transitions.append({
                        "fromState": new_initial,
                        "toState": toState,
                        "symbols": symbols
                    })
    
            # set Ø final if any of the original initial states is final
            for state in initials:
                if state in finals:
                    finals.append(new_initial)
                    break

            # register Ø as a state
            states.append(new_initial)
            # set Ø as the new initial state
            initials = [new_initial]
    
        # transform objectNotation to fsm notation

        """
        fsm_transitions = {}
        for transition in transitions:
            toState = transition['toState']
            fromState = transition['fromState']
            if fromState not in fsm_transitions:
                fsm_transitions[fromState] = {}
            for symbol in transition['symbols']:
                fsm_transitions[fromState][symbol] = toState

        return Automaton(
            fsm.fsm(
                states=set(states),
                alphabet=set(alphabet),
                initial=initials[0],
                finals=set(finals),
                map=fsm_transitions
            )
        )
        """
      
        # transform objectNotation transitions to automaton-lib transitions 
        nfa_transitions = {}
        for state in states:
            nfa_transitions[state] = {}
        for transition in transitions:
            toState = transition['toState']
            fromState = transition['fromState']
            for symb in transition['symbols']:
                if symb not in nfa_transitions[fromState]:
                    nfa_transitions[fromState][symb] = set()
                nfa_transitions[fromState][symb].add(toState)
    
        # create a nfa that is equivalent to the given automaton
        nfa = NFA(
            states=set(states),
            input_symbols=set(alphabet),
            transitions=nfa_transitions,
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
    
        # .reduce() minimize the fsm
        return Automaton(state_machine.reduce())

    @staticmethod
    def fado_from_object_notation(objectNotation: dict):
        """
        Creates fado Automaton from an object notation.
        :param objectNotation An automaton in the object notation.
        :return Automaton instance.
        :raise TypeError if objectNotation is not a dict.
        :raise SyntaxError if objectNotation cannot be parsed.
        """

        if not isinstance(objectNotation, dict):
            raise TypeError('from_object_notation: Excepted an automaton in object notation')

        #TODO on peut avoir un automate sans état final/sans transition etc... A ajuster
        if 'states' not in objectNotation or not len(objectNotation['states']):
            raise SyntaxError("Vous devez saisir un automate avec au moins un état.")
        if 'initialStates' not in objectNotation or not len(objectNotation['initialStates']):
            raise SyntaxError("L'automate que vous avez saisi ne contient pas d'état initial!")
        if 'acceptingStates' not in objectNotation or not len(objectNotation['acceptingStates']):
            raise SyntaxError("L'automate que vous avez saisi ne contient pas d'état final!")
        if 'alphabet' not in objectNotation or not len(objectNotation['alphabet']):
            raise SyntaxError("L'automate que vous avez saisi ne contient aucun symbole!")
        if 'transitions' not in objectNotation or not len(objectNotation['transitions']):
            raise SyntaxError("L'automate que vous avez saisi ne contient aucune transition!")

        nfa = fa.NFA()

        states = copy.deepcopy(objectNotation['states'])
        finals = copy.deepcopy(objectNotation['acceptingStates'])
        initials = copy.deepcopy(objectNotation['initialStates'])
        alphabet = copy.deepcopy(objectNotation['alphabet'])
        transitions = copy.deepcopy(objectNotation['transitions'])

        for s in objectNotation['states']:
            nfa.addState(s)
        for symb in objectNotation['alphabet']:
            nfa.addSigma(symb)
        for s in objectNotation['initialStates']:
            nfa.addInitial(nfa.stateIndex(s))       
        for s in objectNotation['acceptingStates']:
            nfa.addFinal(nfa.stateIndex(s))
        for transition in objectNotation['transitions']:
            toState = transition['toState']
            fromState = transition['fromState']
            for symb in transition['symbols']:
                nfa.addTransition(nfa.stateIndex(fromState), 
                                  symb,
                                  nfa.stateIndex(toState))
            # est-il possible de voir apparaitre une transition 2fois? si oui tester ça:w

        return nfa



    @staticmethod
    def editor():
        """Return new automaton editor component."""
        return AutomatonEditor()

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

    @staticmethod
    def same_as( auto1 , auto2 ):
        """
        Return True if auto1 and auto2 coincide
                states names
                initial, final states and transitions
            :param auto1 automaton in string_notation
            :param auto2 automaton in string_notation
            :raise exception If auto1 or auto2 cannot be parsed.
        """
        try:
            fado1 = fado_from_string(auto1)
            fado2 = fado_from_string(auto2)

            states_match = sorted(fado1.States) == sorted(fado2.States)
            initial_states_match = sorted([fado1.States[i] for i in fado1.Initial]) == sorted([fado2.States[i] for i in fado2.Initial])
            final_states_match = sorted([fado1.States[i] for i in fado1.Final]) == sorted([fado2.States[i] for i in fado2.Final])
            transitions1 = [(fado1.States[from_],sym, fado1.States[to]) for from_ in fado1.delta for sym in fado1.delta[from_] for to in fado1.delta[from_][sym]]
            transitions2 = [(fado2.States[from_],sym, fado2.States[to]) for from_ in fado2.delta for sym in fado2.delta[from_] for to in fado2.delta[from_][sym]]
            transition_match = sorted(transitions1) == sorted(transitions2)

            return states_match and initial_states_match and final_states_match and transition_match , None
        except Exception as e:
            return False, str(e)
    
    @staticmethod
    def accepts(obj, word: str):
        """
        Checks `word` is recognized by the automaton `obj`.
        :param obj An automaton in any of the accepted notation
        :param word the word to test
        """
    
        word = word.replace('ε', '')
        return Automaton.parse(obj).state_machine.accepts(word)

    @staticmethod
    def random_recognized_strings(obj, max=3):
        """
        Gets a list of random strings accepted by the automaton.
        :param max the max number of elements of the returned list.
        """
        state_machine = Automaton.parse(obj).state_machine
        r = []
        i = 0
        for e in state_machine.strings():
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

    @staticmethod
    def random_unrecognized_strings(obj, max=3):
        """
        Gets a list of random strings not accepted by the automaton.
        :param max the max number of elements of the returned list.
        """
        r = []
        i = 0
        state_machine = Automaton.parse(obj).state_machine
        for e in state_machine.everythingbut().strings():
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
            "coreachable": len(coreachables) == n,
            "states": states
        }, None

    #XXX should be a regular method and not call parse again
    @staticmethod
    def properties(obj):
        """
        Gets useful informations about the automaton.
        :return {
            "complete": bool,
            "infinite": bool,
            "deterministic": bool,
            "reachable": bool,
            "coreachable": bool,
            "states": List<string>
        }
        """

        # editor_properties will not alterate the automaton
        if isinstance(obj, AutomatonEditor):
            return Automaton.editor_properties(obj)
    
        instance = Automaton.parse(obj)

        complete = True
        infinite = False
        deterministic = True

        states = instance.states
        finals = instance.finals
        initials = [instance.initial] # TODO use instance.initials once multiple initial states is supported 
        transitions = instance.transitions
        alphabetLength = len(instance.alphabet)

        # calculate reachable states
        reachables = []
        for state in initials:
            reachables.extend(instance.reachable_states(state))
        reachables = set(reachables)

        # calculate coreachable states
        coreachables = []
        for state in finals:
            coreachables.extend(instance.coreachable_states(state))
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
            "coreachable": len(coreachables) == n,
            "states": states
        }, None  # XXX remove this useless None

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
 
    def to_string_notation(self):
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
        return f'{states}\n{initials}\n{accepting}\n{alphabet}\n{transitions}'

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

        return AutomatonDrawer(
            automaton=self.to_string_notation()
        )

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


































