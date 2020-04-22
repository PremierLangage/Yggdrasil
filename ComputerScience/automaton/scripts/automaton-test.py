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

        states = objectNotation['states']
        initials = objectNotation['initialStates']
        alphabet = objectNotation['alphabet']
        finals = objectNotation['acceptingStates']
    
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
        if len (initials) > 1:
            new_initial = 'Ø'
            transitions = objectNotation['transitions']
            for transition in objectNotation['transitions']:
                toState = transition['toState']
                fromState = transition['fromState']
                symbols = transition['symbols']
                if fromState in initials:
                    transitions.append({
                        "fromState": new_initial,
                        "toState": toState,
                        "symbols": symbols
                    })
            states.append(new_initial)
            for state in initials:
                if state in finals:
                    finals.append(new_initial)
                    break
            initials = [new_initial]
            objectNotation['transitions'] = transitions
    
        transitions = {}
        for transition in objectNotation['transitions']:
            toState = transition['toState']
            fromState = transition['fromState']
            if fromState not in transitions:
                transitions[fromState] = {}
            for symbol in transition['symbols']:
                transitions[fromState][symbol] = toState

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
      
        # transform objectNotation transitions to automaton-lib transitions 
        transitions = {}
        for state in states:
            transitions[state] = {}
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
        #minimal = state_machine.reduce()

        return Automaton(minimal)
        """

