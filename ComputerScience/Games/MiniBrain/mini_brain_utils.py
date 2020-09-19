"""
Mini Brain is a python clone of the Little Thinker written in java.
(see : https://github.com/Pavell94000/LittleThinker )

Mini Brain model a small CPU: 
 * A central memory 
 * An Arithmetic and Logic Unit 
 * A central unit to synchronize the two others and execute a program.

List of available functions:

* ld [$? or value] [#?-a]: load value inside the CPU
* st [#?-a or value] [$?]: store value to central memory
* mv [#?-a] [#?-a]: internal fast copy inside the CPU

* inc [#?]: increment targeted register 
            (up the flag if zero)
* dec [#?]: decrement targeted register 
            (up the flag if zero)
* add [#?-a or value or $?]: add targeted value to the accumulator 
                             (up the flag if zero)
* sub [#?-a or value or $?]: subtract targeted value to the accumulator 
                             (up the flag if zero)
* mul [#?-a or value or $?]: multiply by targeted value the accumulator 
                             (up the flag if zero)
* div [#?-a or value or $?]: divide the accumulator by targeted value 
                             (up the flag if zero if exact division)
* mod [#?-a or value or $?]: replace the accumulator by its remainder when divide by targeted value 
                             (up the flag if zero)
* cmp [#?-a or value or $?]: do nothing 
                             (up the flag if the accumulator is smaller than the argument)

* bfup [#?-a or value or $?]: jump to instruction indexed by the value if the flag is up else do nothing and continue
* bfdn [#?-a or value or $?]: jump to instruction indexed by the value if the flag is down else do nothing and continue
* bnow [#?-a or value or $?]: jump in all cases to instruction indexed by the value

* exit [#?-a or value or $?]: stop the program with return code the targeted value   
* <empty instruction>: produce the behavior of exit a

TESTS::

>>> M = MiniBrain('''ld 12 a
... ld $12 #4
... mv #4 #0
... st #1 $21
... inc a
... inc #4
... inc #$13
... dec #3
... dec #$13
... inc #3
... 
... 12345
... 2''')
>>> M.run(verbose=True)
|     #0     #1     #2     #3     #4 |  #-1=a | f | -->  PC : next instruction
|      0      0      0      0      0 |      0 | 0 | -->   1 : ld 12 a
|      0      0      0      0      0 |     12 | 0 | -->   2 : ld $12 #4
|      0      0      0      0  12345 |     12 | 0 | -->   3 : mv #4 #0
|  12345      0      0      0  12345 |     12 | 0 | -->   4 : st #1 $21
|  12345      0      0      0  12345 |     12 | 0 | -->   5 : inc a
|  12345      0      0      0  12345 |     13 | 0 | -->   6 : inc #4
|  12345      0      0      0  12346 |     13 | 0 | -->   7 : inc #$13
|  12346      0      0      0  12346 |     13 | 0 | -->   8 : dec #3
|  12346      0      0     -1  12346 |     13 | 0 | -->   9 : dec #$13
|  12345      0      0     -1  12346 |     13 | 0 | -->  10 : inc #3
|  12345      0      0      0  12346 |     13 | 1 | -->  11 : exit a
Process exited normally with code 13
0
"""
#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

#*************************************************************************
# Some utilities
#*************************************************************************
def scale_16_bits_a2(val, nb_bits=16):
    """
    Rescale a possible overflow value to a 16 bits value using the
    two's complement rule.

    Python use a bit for the sign then supports arbitrary sized
    integers for positives and negatives. UAL primitives mostly use
    two'a complement rule on a fixed number of bits. This ugly
    function just force Mini Brain to follow behavior of classical
    arithmetic unit.

    EXAMPLES::

    >>> scale_16_bits_a2(0)
    0
    >>> scale_16_bits_a2(1)
    1
    >>> scale_16_bits_a2(32421)
    32421
    >>> scale_16_bits_a2(2**15-1)
    32767
    >>> scale_16_bits_a2(2**15)
    -32768
    >>> scale_16_bits_a2(2**15+1)
    -32767
    >>> scale_16_bits_a2(2**16-2)
    -2
    >>> scale_16_bits_a2(2**16-1)
    -1
    >>> scale_16_bits_a2(2**16)
    0
    >>> from random import randint
    >>> a = randint(-(2**100), 2**100); scale_16_bits_a2(a) == scale_16_bits_a2(a+2**(16+randint(0,5)))
    True
    """
    ans = (val % (2**nb_bits))
    if ans >= 2**(nb_bits-1):
        ans = -(2**nb_bits) + ans
    return ans

def represents_int(s):
    """
    Returns `True` if the string s represent an integer. Returns
    `False` otherwise.

    EXAMPLES::

    >>> represents_int("1234")
    True
    >>> represents_int("-54")
    True
    >>> represents_int("0")
    True
    >>> represents_int("")
    False
    >>> represents_int("123d")
    False
    >>> represents_int("12,34")
    False
    >>> represents_int("12.34")
    False
    >>> represents_int("1.0")
    False
    >>> represents_int("a123")
    False
    """
    try:
        int(s)
        return True
    except ValueError:
        return False


class MiniBrainUAL():
    """
    A class modeling a Mini Brain UAL.

    The UAL manage some memory close to circuits operating
    arithmetical operation : registers, accumulator and flag.

    The UAL register the CPUtime consumed, however the synchronization
    is mainly proceed by the control unit.

    EXAMPLES::

    >>> UAL = MiniBrainUAL()
    >>> str(UAL)
    '|      0      0      0      0      0 |      0 | 0 | -->   1'
    >>> UAL.get_program_counter()
    1
    >>> UAL.add(12)
    >>> str(UAL)
    '|      0      0      0      0      0 |     12 | 0 | -->   1'
    >>> UAL.sub(12)
    >>> str(UAL)
    '|      0      0      0      0      0 |      0 | 1 | -->   1'
    """
    def __init__(self, nb_register=5):
        """
        Initialise properly `self` with default values for all
        attributes.

        TESTS::

        >>> UAL = MiniBrainUAL()
        """
        self._nb_register = nb_register
        self._register = [0,]*nb_register
        self._accumulator = 0
        self._flag = False
        self._program_counter = 1
        self._cpu_cycles = 1

    def __str__(self):
        """
        Returns a string describing the state of the UAL `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> str(UAL)
        '|      0      0      0      0      0 |      0 | 0 | -->   1'
        """
        state = "| "
        state += " ".join([format(reg, '6d') for reg in self._register])
        state += " | " + format(self._accumulator, '6d')
        state += " | " + format(self._flag, '1d')
        state += " | --> " + format(self._program_counter, '3d')
        return state

    #*************************************************************************
    # Registers and accumulator access
    #*************************************************************************
    def get_register(self, reg_index):
        """
        Returns the value stored in the register indexed by
        `reg_index` or the value of the accumulator if `reg_index` is
        `-1`.

        The unit control is responsible to check the validity of
        instruction.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator = 12
        >>> UAL.get_register(-1)
        12
        >>> UAL._register[0] = -42
        >>> UAL.get_register(0)
        -42
        >>> UAL.get_register(4235)
        Traceback (most recent call last):
        ...
        IndexError: list index out of range
        """
        if reg_index == -1:
            return self._accumulator
        else:
            return self._register[reg_index]

    def set_register(self, reg_index, value):
        """
        Store `value` inside the register indexed by `reg_index` or
        inside the accumulator if `reg_index` is `-1`.

        The unit control is responsible to check the validity of
        instruction.

        >>> UAL = MiniBrainUAL()
        >>> UAL.set_register(-1, 12)
        >>> UAL.set_register(2, -42)
        >>> UAL._register[0]
        0
        >>> UAL._accumulator
        12
        >>> UAL._register[2]
        -42
        """
        if reg_index == -1:
            self._accumulator = scale_16_bits_a2(value)
        else:
            self._register[reg_index] = scale_16_bits_a2(value)

    #*************************************************************************
    # Ruptures and cycles management
    #*************************************************************************
    def get_program_counter(self):
        """
        Returns the current value of program counter inside the CPU
        `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL.get_program_counter()
        1
        >>> UAL._program_counter = 54
        >>> UAL.get_program_counter()
        54
        """
        return self._program_counter

    def set_program_counter(self, value):
        """
        Set the current value of program counter inside the CPU
        `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._program_counter
        1
        >>> UAL.set_program_counter(12)
        >>> UAL._program_counter
        12
        """
        self._cpu_cycles += 1
        self._program_counter = value

    def increment_program_counter(self):
        """
        Increment by `1` the current value of program counter inside
        the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._program_counter
        1
        >>> UAL.increment_program_counter()
        >>> UAL._program_counter
        2
        >>> UAL.increment_program_counter()
        >>> UAL.increment_program_counter()
        >>> UAL._program_counter
        4
        """
        self._cpu_cycles += 1
        self._program_counter += 1

    def get_flag(self):
        """
        Return the current status of the flags inside `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL.get_flag()
        False
        >>> UAL._flag = True
        >>> UAL.get_flag()
        True
        """
        return self._flag

    def set_flag_up(self):
        """
        Set the flag up inside `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._flag
        False
        >>> UAL.set_flag_up()
        >>> UAL._flag
        True
        """
        self._flag = True

    def set_flag_down(self):
        """
        Set the flag down inside `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._flag = True
        >>> UAL.set_flag_down()
        >>> UAL._flag
        False
        """
        self._flag = False

    def wait_input_output(self, cycles):
        """
        The control unit can force the UAL `self` waiting for a value
        to be read or write inside the central memory.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._cpu_cycles
        1
        >>> UAL.wait_input_output(42)
        >>> UAL._cpu_cycles
        43
        """
        self._cpu_cycles += cycles

    #*************************************************************************
    # Arithmetic operations
    #
    # * inc(2) [#...]
    # * dec(2) [#...]
    # * add [#?-a or value or $?]
    # * sub [#?-a or value or $?]
    # * mul [#?-a or value or $?]
    # * div [#?-a or value or $?]
    # * mod [#?-a or value or $?]
    # * cmp [#?-a or value or $?]
    #*************************************************************************
    def inc(self, reg_index=None):
        """
        Resolve an incrementation inside the CPU `self`.

        `reg_index` must be a valid register index or `-1` for the
        accumulator. The unit control is responsible to check the
        validity of instruction.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._register[0]
        0
        >>> UAL.inc(0)
        >>> UAL._register[0]
        1
        >>> UAL._flag
        False
        >>> UAL._accumulator = -1
        >>> UAL.inc(-1)
        >>> UAL._accumulator
        0
        >>> UAL._flag
        True
        """
        # arithmetic resolution
        if reg_index == -1:
            self._accumulator = scale_16_bits_a2(self._accumulator + 1)
            # flag managment
            if self._accumulator == 0:
                self.set_flag_up()
            else:
                self.set_flag_down()
        else:
            self._register[reg_index] = scale_16_bits_a2(self._register[reg_index] + 1)
            # flag managment
            if self._register[reg_index] == 0:
                self.set_flag_up()
            else:
                self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 1

    def dec(self, reg_index=None):
        """
        Resolve a decrementation inside the CPU `self`.

        `reg_index` must be a valid register index or `-1` for the
        accumulator. The unit control is responsible to check the
        validity of instruction.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._register[1] = 2
        >>> UAL.dec(1)
        >>> UAL._register[1]
        1
        >>> UAL._flag
        False
        >>> UAL.dec(1)
        >>> UAL._register[1]
        0
        >>> UAL._flag
        True
        """
        # arithmetic resolution
        if reg_index == -1:
            self._accumulator = scale_16_bits_a2(self._accumulator - 1)
            # flag managment
            if self._accumulator == 0:
                self.set_flag_up()
            else:
                self.set_flag_down()
        else:
            self._register[reg_index] = scale_16_bits_a2(self._register[reg_index] - 1)
            # flag managment
            if self._register[reg_index] == 0:
                self.set_flag_up()
            else:
                self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 1

    def add(self, value):
        """
        Resolve an addition inside the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator
        0
        >>> UAL.add(42)
        >>> UAL._accumulator
        42
        >>> UAL._flag
        False
        >>> UAL.add(-42)
        >>> UAL._accumulator
        0
        >>> UAL._flag
        True
        """
        # arithmetic resolution
        self._accumulator = scale_16_bits_a2(self._accumulator + value)
        # flag managment
        if self._accumulator == 0:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 2

    def sub(self, value):
        """
        Resolve a substraction inside the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator
        0
        >>> UAL.sub(22)
        >>> UAL._accumulator
        -22
        >>> UAL._flag
        False
        >>> UAL.sub(-22)
        >>> UAL._accumulator
        0
        >>> UAL._flag
        True
        """
        # arithmetic resolution
        self._accumulator = scale_16_bits_a2(self._accumulator - value)
        # flag managment
        if self._accumulator == 0:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 2

    def mul(self, value):
        """
        Resolve a multiplication inside the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator = 1
        >>> UAL.mul(33)
        >>> UAL._accumulator
        33
        >>> UAL._flag
        False
        >>> UAL.mul(0)
        >>> UAL._accumulator
        0
        >>> UAL._flag
        True
        """
        # arithmetic resolution
        self._accumulator = scale_16_bits_a2(self._accumulator * value)
        # flag managment
        if self._accumulator == 0:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 2

    def div(self, value):
        """
        Compute an integer quotient inside the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator = 14
        >>> UAL.div(2)
        >>> UAL._accumulator
        7
        >>> UAL._flag
        True
        >>> UAL.div(3)
        >>> UAL._accumulator
        2
        >>> UAL._flag
        False
        """
        # flag managment : put up the flag if the division is exact !
        if self._accumulator % value == 0:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # arithmetic resolution
        self._accumulator = scale_16_bits_a2(self._accumulator // value)
        # cycles costs
        self._cpu_cycles += 2

    def mod(self, value):
        """
        Compute an integer quotient inside the CPU `self`.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator = 14
        >>> UAL.mod(5)
        >>> UAL._accumulator
        4
        >>> UAL._flag
        False
        >>> UAL.mod(2)
        >>> UAL._accumulator
        0
        >>> UAL._flag
        True
        """
        # flag managment : put up the flag if the remainder is zero !
        if self._accumulator % value == 0:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # arithmetic resolution
        self._accumulator = scale_16_bits_a2(self._accumulator % value)
        # cycles costs
        self._cpu_cycles += 2

    def cmp(self, value):
        """
        Compare accumulator and `value`. Set the flag up if the accumulator is
        smaller than `value`. Otherwise the flag is setted down.

        EXAMPLES::

        >>> UAL = MiniBrainUAL()
        >>> UAL._accumulator = 7
        >>> UAL.cmp(3)
        >>> UAL._accumulator
        7
        >>> UAL._flag
        False
        >>> UAL.cmp(9)
        >>> UAL._accumulator
        7
        >>> UAL._flag
        True
        """
        # flag managment : put up the flag if the accumulator is smaller than the argument.
        if self._accumulator <= value:
            self.set_flag_up()
        else:
            self.set_flag_down()
        # cycles costs
        self._cpu_cycles += 2
        
#*****************************************************************************
#  Parsing command utilities
#*****************************************************************************
def analyse_arg(s_arg):
    """
    Check argument and analyse its string to describe what kind of
    machine word it is.

    EXAMPLES::

    >>> analyse_arg("12345")
    [12345, None, None, None, None]
    >>> analyse_arg("-53")
    [-53, None, None, None, None]
    >>> analyse_arg("a")
    [None, -1, None, None, None]
    >>> analyse_arg("#3")
    [None, 3, None, None, None]
    >>> analyse_arg("$12")
    [None, None, 12, None, None]
    >>> analyse_arg("$#4")
    [None, None, None, 4, None]
    >>> analyse_arg("#$47")
    [None, None, None, None, 47]
    >>> analyse_arg("a12")
    'invalid argument'
    >>> analyse_arg("##12")
    'invalid argument of type #...'
    >>> analyse_arg("$$12")
    'invalid argument of type $...'
    >>> analyse_arg("$#")
    'invalid argument of type $#...'
    >>> analyse_arg("#$")
    'invalid argument of type #$...'
    >>> analyse_arg("#$12$")
    'invalid argument of type #$...'
    >>> analyse_arg("#12.23")
    'invalid argument of type #...'
    >>> analyse_arg("123,321")
    'invalid argument'
    >>> analyse_arg("123.321")
    'invalid argument'
    """
    # check pattern [a]
    if s_arg == 'a':
        return [None, -1, None, None, None]
    # check constant value
    if represents_int(s_arg):
        return [int(s_arg), None, None, None, None]
    # check pattern [#...]
    if s_arg[0] == "#":
        if (len(s_arg) == 1):
            return "invalid argument of type #..."
        if represents_int(s_arg[1:]):
            return [None, int(s_arg[1:]), None, None, None]
        if s_arg[1] == "$": # check pattern [#$...]
            if (len(s_arg) == 2):
                return "invalid argument of type #$..."
            if represents_int(s_arg[2:]):
                return [None, None, None, None, int(s_arg[2:])]
            else:
                return "invalid argument of type #$..."
        else:
            return "invalid argument of type #..."
    # check pattern [$...]
    if s_arg[0] == "$":
        if (len(s_arg) == 1):
            return "invalid argument of type $..."
        if represents_int(s_arg[1:]):
            return [None, None, int(s_arg[1:]), None, None]
        if s_arg[1] == "#": # check pattern [$#...]
            if (len(s_arg) == 2):
                return "invalid argument of type $#..."
            if represents_int(s_arg[2:]):
                return [None, None, None, int(s_arg[2:]), None]
            else:
                return "invalid argument of type $#..."
        else:
            return "invalid argument of type $..."
    # all remaining cases
    return "invalid argument"


#*****************************************************************************
#  Mini Brain central memory
#*****************************************************************************
class MiniBrainMem():
    """
    A class modeling a Mini Brain central memory.

    EXAMPLES::

    >>> MEM = MiniBrainMem('''ld 12 a
    ... mv a #1
    ... ld $5 #2
    ... add #2
    ...
    ... 4321''')
    >>> MEM._mem_array
    ['ld 12 a', 'mv a #1', 'ld $5 #2', 'add #2', '', '4321']
    """
    def __init__(self, code):
        """
        TESTS::

        >>> MEM = MiniBrainMem("")
        """
        self._original_code = code+('\n'*100)
        self._mem_array = code.split('\n')

    def __str__(self):
        """
        Returns a string describing the current memory.

        TESTS::

        >>> MEM = MiniBrainMem('''ld 12 a
        ... mv a #1
        ... ld $5 #2
        ... add #2
        ...
        ... 4321''')
        >>> print(MEM)
        ld 12 a
        mv a #1
        ld $5 #2
        add #2
        <BLANKLINE>
        4321
        """
        return "\n".join(self._mem_array)

    def get_instruction(self, program_counter):
        """
        Returns the `program_counter^{th}` instructions of the program
        `self`. This can be a Mini Brain instruction as well as a pure
        data program.

        EXAMPLES::

        >>> MEM = MiniBrainMem('''ld 12 a
        ... mv a #1
        ... ld $5 #2
        ... add #2
        ...
        ... 4321''')
        >>> MEM.get_instruction(1)
        'ld 12 a'
        >>> MEM.get_instruction(3)
        'ld $5 #2'
        >>> MEM.get_instruction(6)
        '4321'
        """
        return self._mem_array[program_counter-1]

    def set_value(self, value, program_counter, limit=2000):
        """
        Set a value inside the central memory.

        EXAMPLES::

        >>> MEM = MiniBrainMem('''ld 12 a
        ... mv a #1
        ... ld $5 #2
        ... add #2
        ...
        ... 4321''')
        >>> MEM.set_value(1234, 6)
        0
        >>> print(MEM)
        ld 12 a
        mv a #1
        ld $5 #2
        add #2
        <BLANKLINE>
        1234
        >>> MEM.set_value(101, 10)
        0
        >>> print(MEM)
        ld 12 a
        mv a #1
        ld $5 #2
        add #2
        <BLANKLINE>
        1234
        <BLANKLINE>
        <BLANKLINE>
        <BLANKLINE>
        101
        """
        if (program_counter <= 0) or (program_counter >= limit):
            return "Segmentation Fault : you can not write at address "+str(program_counter)
        else:
            if program_counter > len(self._mem_array):
                for i in range(program_counter - (len(self._mem_array) + 1)):
                    self._mem_array.append('')
                self._mem_array.append(str(scale_16_bits_a2(value)))
                return 0
            else:
                self._mem_array[program_counter-1] = str(scale_16_bits_a2(value))
                return 0

    def analyse_instruction(self, instr):
        """
        Returns an analysis of the instruction `instr`.

        EXAMPLES::

        >>> MEM = MiniBrainMem("stop 0")
        >>> MEM.analyse_instruction("ld 12 a")
        (True, ('ld', [12, None, None, None, None], [None, -1, None, None, None]))
        >>> MEM.analyse_instruction("st #$2 $40")
        (True, ('st', [None, None, None, None, 2], [None, None, 40, None, None]))
        >>> MEM.analyse_instruction("inc a")
        (True, ('inc', [None, -1, None, None, None]))
        >>> MEM.analyse_instruction("dec #4")
        (True, ('dec', [None, 4, None, None, None]))
        >>> MEM.analyse_instruction("add $#2")
        (True, ('add', [None, None, None, 2, None]))
        >>> MEM.analyse_instruction("sub #$34")
        (True, ('sub', [None, None, None, None, 34]))
        >>> MEM.analyse_instruction("sub #$34 12")
        (False, 'sub #$34 12', 'invalid command name with 2 arguments')
        >>> MEM.analyse_instruction("ld $34")
        (False, 'ld $34', 'invalid command name with 1 argument')
        >>> MEM.analyse_instruction("mv $34 $45")
        (False, 'mv $34 $45', 'command mv only works on registers and accumulator')
        >>> MEM.analyse_instruction("st 34 #4")
        (False, 'st 34 #4', 'command st only write inside central memory')
        >>> MEM.analyse_instruction("dec $12")
        (False, 'dec $12', 'command dec only works on registers or accumulator')
        >>> MEM.analyse_instruction("inc #$21")
        (True, ('inc', [None, None, None, None, 21]))
        """
        s = instr

        # Time to isolate all non empty string argument
        tokens = s.split(' ')
        while '' in tokens:
            tokens.remove('')

        if len(tokens) == 0: # empty command become : exit a
            tokens = ['exit', 'a']

        # less than two tokens more than 3 tokens --> Invalid command
        if len(tokens) not in [2, 3]:
            return (False, instr, "Parsing instruction error : legal commands have 1 ou 2 arguments")

        # Memory management commands have 3 tokens : copy [source or value] [dest]
        if len(tokens) == 3:
            if tokens[0] not in ["ld", "st", "mv"]:
                return (False, instr, "invalid command name with 2 arguments")

            arg1 = analyse_arg(tokens[1])
            arg2 = analyse_arg(tokens[2])
            # check the parsing of the two argument
            if isinstance(arg1, str):
                return (False, instr, "Parsing instruction error : "+arg1)
            if isinstance(arg2, str):
                return (False, instr, "Parsing instruction error : "+arg2)

            # mv command checks -----------------------------------------------------------------------------
            if tokens[0] == "mv":
                # check fist argument src with pattern [#?-a]
                if (arg1[0] is not None) or (arg1[2] is not None) or (arg1[3] is not None):
                    return (False, instr, "command mv only works on registers and accumulator")
                # check fist argument src with pattern [#?-a]
                if (arg2[0] is not None) or (arg2[2] is not None) or (arg2[3] is not None):
                    return (False, instr, "command mv only works on registers and accumulator")
                # check that src and dst are different
                if arg1 == arg2:
                    return (False, instr, "command mv : the two locations must be different")
                return (True, ('mv', arg1, arg2))

            # ld command checks -----------------------------------------------------------------------------
            if tokens[0] == "ld":
                # check first argument with pattern [$?(5) or value(1)]
                if (arg1[1] is not None) or (arg1[4] is not None):
                    return (False, instr, "command ld only load constant or value from central memory")
                # check second argument with pattern [#?-a]
                if (arg2[0] is not None) or (arg2[2] is not None) or (arg2[3] is not None):
                    return (False, instr, "command ld only write on registers or accumulator")
                return (True, ('ld', arg1, arg2))

            # st command checks -----------------------------------------------------------------------------
            else: # here the command can be only store : st [#?-a or value] [$?]
                # check first argument with pattern [#?-a or value]
                if (arg1[2] is not None) or (arg1[3] is not None):
                    return (False, instr, "command st only store constant or value from registers or accumulator")
                # check second argument with pattern [$?...]
                if (arg2[0] is not None) or (arg2[1] is not None) or (arg2[4] is not None):
                    return (False, instr, "command st only write inside central memory")
                return (True, ('st', arg1, arg2))

        # Here we are sure that there is only a single argument
        arg1 = analyse_arg(tokens[1])
        # check the argument
        if isinstance(arg1, str):
            return (False, instr, "Parsing instruction error : "+arg1)

        # Arithmetic commands : 3 char for the command name
        if len(tokens[0]) == 3:
            if tokens[0] not in ['inc', 'dec', 'add', 'sub', 'mul', 'div', 'mod', 'cmp']:
                return (False, instr, "invalid command name with 1 argument")

            if tokens[0] in ['inc', 'dec']:
                # check argument with pattern [#?-a]
                if (arg1[0] is not None) or (arg1[2] is not None) or (arg1[3] is not None):
                    return (False, instr, "command "+tokens[0]+" only works on registers or accumulator")
                else:
                    return (True, (tokens[0], arg1))

            # other arithmetic command can use any value...
            return (True, (tokens[0], arg1))

        # Last commands are rupture commands having 4 caracters
        if tokens[0] not in ["bfup", "bfdn", "bnow", "exit"]:
            return (False, instr, "invalid command name with 1 argument")

        # rupture command can use any value...
        return (True, (tokens[0], arg1))

#*****************************************************************************
#  Mini Brain Central Unit (synchronisation and bus interfaces)
#*****************************************************************************
class MiniBrain():
    """
    A class modeling a Mini Brain process.

    EXAMPLES::

    >>> M = MiniBrain('''ld 12 a
    ... add 42''')
    >>> M.run()
    0
    >>> print(M._verbose)
    |     #0     #1     #2     #3     #4 |  #-1=a | f | -->  PC : next instruction
    |      0      0      0      0      0 |      0 | 0 | -->   1 : Empty instruction
    Empty instruction : process terminated
    ld 12 a
    add 42
    <BLANKLINE>

    Here is an exemple computing factorial of $6 :

    >>> M = MiniBrain('''ld $7 #0
    ... ld 1 a
    ... mul #0
    ... dec #0
    ... bfdn 3
    ...
    ... 5''')
    >>> M.run(verbose=True)
    |     #0     #1     #2     #3     #4 |  #-1=a | f | -->  PC : next instruction
    |      0      0      0      0      0 |      0 | 0 | -->   1 : ld $7 #0
    |      5      0      0      0      0 |      0 | 0 | -->   2 : ld 1 a
    |      5      0      0      0      0 |      1 | 0 | -->   3 : mul #0
    |      5      0      0      0      0 |      5 | 0 | -->   4 : dec #0
    |      4      0      0      0      0 |      5 | 0 | -->   5 : bfdn 3
    |      4      0      0      0      0 |      5 | 0 | -->   3 : mul #0
    |      4      0      0      0      0 |     20 | 0 | -->   4 : dec #0
    |      3      0      0      0      0 |     20 | 0 | -->   5 : bfdn 3
    |      3      0      0      0      0 |     20 | 0 | -->   3 : mul #0
    |      3      0      0      0      0 |     60 | 0 | -->   4 : dec #0
    |      2      0      0      0      0 |     60 | 0 | -->   5 : bfdn 3
    |      2      0      0      0      0 |     60 | 0 | -->   3 : mul #0
    |      2      0      0      0      0 |    120 | 0 | -->   4 : dec #0
    |      1      0      0      0      0 |    120 | 0 | -->   5 : bfdn 3
    |      1      0      0      0      0 |    120 | 0 | -->   3 : mul #0
    |      1      0      0      0      0 |    120 | 0 | -->   4 : dec #0
    |      0      0      0      0      0 |    120 | 1 | -->   5 : bfdn 3
    |      0      0      0      0      0 |    120 | 1 | -->   6 : Empty instruction
    Empty instruction : process terminated
    ld $7 #0
    ld 1 a
    mul #0
    dec #0
    bfdn 3
    <BLANKLINE>
    5
    0
    """
    def __init__(self, code, nb_register=5):
        """
        Initialise the process `self`.

        TESTS::

        >>> M = MiniBrain('''exit 12''')
        """
        self._code = code
        self._verbose = ""
        self._nb_cycles = 0
        self._memory = MiniBrainMem(code)
        self._nb_register = nb_register
        self._UAL = MiniBrainUAL(self._nb_register)

    def read_central_bus(self, machine_word_location):
        """
        Returns as a value the machine word described by
        `machine_word_location`. A `machine_word_location` is a kind
        of C union since it can have 5 differents form. It is always a
        python list of lenght 5 containing a single not None
        value. The position of the not None value determine the
        location of data the machine word is.


        a machine word can be :
        - a 16 bits integer signed value with two's complement rule.
        - a register or accumulator content
        - an instruction content (acces via program counter $23)
        - an instruction content (acces via a register content $#2)
        - a register content (acces via an instruction content #$43)

        EXAMPLES::

        >>> M = MiniBrain('''3
        ... 12
        ... -54''')
        >>> M._UAL._accumulator = 42
        >>> M._UAL._register[3] = -34
        >>> M._UAL._register[1] = 3
        >>> M.read_central_bus([12, None, None, None, None]) # --> constant 12
        12
        >>> M.read_central_bus([None, 3, None, None, None]) # --> #3
        -34
        >>> M.read_central_bus([None, None, 2, None, None]) # --> $1
        12
        >>> M.read_central_bus([None, None, None, 1, None]) # --> $#1 = $2
        -54
        >>> M.read_central_bus([None, None, None, None, 1]) # --> #$0 = #3
        -34
        """
        # direct value
        if machine_word_location[0] is not None:
            return scale_16_bits_a2(machine_word_location[0])

        # internal memory of CPU
        if machine_word_location[1] is not None:
            if machine_word_location[1] in range(-1, self._nb_register):
                return scale_16_bits_a2(self._UAL.get_register(machine_word_location[1]))
            else:
                return "CPU error : register #"+str(machine_word_location[1])+" does not exist."

        # direct access of central menory
        if machine_word_location[2] is not None:
            self._UAL.wait_input_output(5)
            if represents_int(self._memory.get_instruction(machine_word_location[2])):
                return scale_16_bits_a2(int(self._memory.get_instruction(machine_word_location[2])))
            else:
                return "Bus error : impossible to read this as a value "+str(self._memory.get_instruction(machine_word_location[2]))

        # central memory via register of accumulator value as address
        if machine_word_location[3] is not None:
            # first request to get the register value as an adress
            address = self.read_central_bus([None, machine_word_location[3], None, None, None])
            if isinstance(address, str):
                return address
            # Now the classical central memory access with the new address counter
            return self.read_central_bus([None, None, address, None, None])

        # internal memory of CPU via a value of the central memory as address
        if machine_word_location[4] is not None:
            # first request to get the value from central memory
            address = self.read_central_bus([None, None, machine_word_location[4], None, None])
            if isinstance(address, str):
                return address
            # Now the classical register value using central memory value as register index
            return self.read_central_bus([None, address, None, None, None])

        return "Bus error : invalid data request (empty machine word)"

    def write_central_bus(self, machine_word_location, value):
        """
        Write `value` at the location described by
        `machine_word_location`.  Returns 0 if the writing has been
        processed successfully or a string describing the error for a
        synchronous unmaskable interruption.

        a machine word can be :
        - a 16 bits integer signed value --> not valid left value
        - a register or accumulator
        - an instruction case (acces via program counter $23)
        - an instruction case (acces via a register content $#2)
        - a register (acces via an instruction content #$43)

        EXAMPLES::

        >>> M = MiniBrain('')
        >>> M.write_central_bus([12, None, None, None, None], 2)
        'Bus error : invalid data writing (constant are not valid data location)'
        >>> M.write_central_bus([None, -1, None, None, None], 12) # --> a
        0
        >>> M._UAL._accumulator
        12
        >>> M.write_central_bus([None, 2, None, None, None], 3) # --> #2
        0
        >>> M._UAL._register[2]
        3
        >>> M.write_central_bus([None, None, 1, None, None], 45) # --> $1
        0
        >>> M._memory.get_instruction(1)
        '45'
        >>> M.write_central_bus([None, None, None, 2, None], -37) # --> $#2
        0
        >>> M._memory.get_instruction(3)
        '-37'
        >>> M.write_central_bus([None, None, 4, None, None], 2) # --> $4
        0
        >>> M._memory.get_instruction(4)
        '2'
        >>> M.write_central_bus([None, None, None, None, 4], -555) # --> #$4
        0
        >>> M._UAL._register[2]
        -555
        """
        # direct value --> that is not a left value !
        # this should never happen since parsing check validy of location kind
        if machine_word_location[0] is not None:
            return "Bus error : invalid data writing (constant are not valid data location)"

        # internal memory of CPU writing
        if machine_word_location[1] is not None:
            if machine_word_location[1] in range(-1, self._nb_register):
                self._UAL.set_register(machine_word_location[1], value)
                return 0
            else:
                return "CPU error : register #"+str(machine_word_location[1])+" does not exist."

        # direct access writing on central menory
        if machine_word_location[2] is not None:
            self._UAL.wait_input_output(5)
            msg_or_zero = self._memory.set_value(value, machine_word_location[2])
            if isinstance(msg_or_zero, str):
                return msg_or_zero
            return 0

        # central memory writing via register of accumulator value as address
        if machine_word_location[3] is not None:
            # first request to get the register value as an adress
            address = self.read_central_bus([None, machine_word_location[3], None, None, None])
            if isinstance(address, str):
                return address
            # Now the classical central memory writing with access using the new address counter
            return self.write_central_bus([None, None, address, None, None], value)

        # internal memory of CPU writing via a value of the central memory as address
        if machine_word_location[4] is not None:
            # first request to get the value from central memory
            address = self.read_central_bus([None, None, machine_word_location[4], None, None])
            if isinstance(address, str):
                return address
            # Now the classical register value using central memory value as register index
            return self.write_central_bus([None, address, None, None, None], value)

        return "Bus error : invalid data writing (location do not exist)"

    def resolve_instructions(self, tokens):
        """
        Resolve nicely parsed instruction. Returns 0 if the
        instruction is executed sucessfully or returns a string for
        synchronouss unmaskable interuption. Returning a string will
        break instantlty the execution of the Mini Brain.

        EXAMPLES::

        >>> M = MiniBrain('')
        >>> M.resolve_instructions(['ld', [12, None, None, None, None], [None, -1, None, None, None]])
        0
        >>> M._UAL._accumulator
        12
        >>> M.resolve_instructions(['mv', [None, -1, None, None, None], [None, 4, None, None, None]])
        0
        >>> M._UAL._register[4]
        12
        >>> M.resolve_instructions(['st', [None, 4, None, None, None], [None, None, 2, None, None]])
        0
        >>> M._memory.get_instruction(2)
        '12'
        """
        # The three memory management commands are copy function (read
        # thus write a value). So they share the same source code...
        # But students have to understand what kind of memory there
        # are manipulating since parsing make différence for these 3
        # function.
        if tokens[0] in ['mv', 'ld', 'st']:
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            msg_or_zero = self.write_central_bus(tokens[2], value_or_msg)
            if isinstance(msg_or_zero, str):
                return msg_or_zero
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'inc':
            if tokens[1][1] in range(-1, self._nb_register):
                self._UAL.inc(tokens[1][1])
                self._UAL.increment_program_counter()
                return 0
            if tokens[1][4] is not None:
                value_or_msg = self.read_central_bus(tokens[1])
                if isinstance(value_or_msg, str):
                    return value_or_msg
                if value_or_msg in range(-1, self._nb_register):
                    self._UAL.inc(value_or_msg)
                    self._UAL.increment_program_counter()
                    return 0
            return "CPU error : register does not exist."

        if tokens[0] == 'dec':
            if tokens[1][1] in range(-1, self._nb_register):
                self._UAL.dec(tokens[1][1])
                self._UAL.increment_program_counter()
                return 0
            if tokens[1][4] is not None:
                value_or_msg = self.read_central_bus(tokens[1])
                if isinstance(value_or_msg, str):
                    return value_or_msg
                if value_or_msg in range(-1, self._nb_register):
                    self._UAL.dec(value_or_msg)
                    self._UAL.increment_program_counter()
                    return 0
            return "CPU error : register does not exist."

        if tokens[0] == 'add':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.add(value_or_msg)
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'sub':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.sub(value_or_msg)
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'mul':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.mul(value_or_msg)
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'div':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.div(value_or_msg)
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'mod':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.mod(value_or_msg)
            self._UAL.increment_program_counter()
            return 0

        if tokens[0] == 'cmp':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.cmp(value_or_msg)
            self._UAL.increment_program_counter()
            return 0
        
        if tokens[0] == 'bfup':
            if self._UAL.get_flag():
                value_or_msg = self.read_central_bus(tokens[1])
                if isinstance(value_or_msg, str):
                    return value_or_msg
                self._UAL.set_program_counter(value_or_msg)
                return 0
            else:
                self._UAL.increment_program_counter()
                return 0

        if tokens[0] == 'bfdn':
            if not self._UAL.get_flag():
                value_or_msg = self.read_central_bus(tokens[1])
                if isinstance(value_or_msg, str):
                    return value_or_msg
                self._UAL.set_program_counter(value_or_msg)
                return 0
            else:
                self._UAL.increment_program_counter()
                return 0

        if tokens[0] == 'bnow':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            self._UAL.set_program_counter(value_or_msg)
            return 0

        if tokens[0] == 'exit':
            value_or_msg = self.read_central_bus(tokens[1])
            if isinstance(value_or_msg, str):
                return value_or_msg
            return "Process exited normally with code "+str(value_or_msg)

        return "Internal inconsistency : valid parsed command appears to be not implemented."

    def _add_line_verbose(self, msg, verbose=False):
        """
        This function add in the verbose the line `msg`. If the
        `verbose` is activated, the line `msg` is also displayed on
        standard output.

        EXAMPLES::

        >>> M = MiniBrain('')
        >>> M._add_line_verbose('Une ligne silencieuse')
        >>> M._add_line_verbose('Une ligne bruyante', verbose=True)
        Une ligne bruyante
        >>> print(M._verbose)
        Une ligne silencieuse
        Une ligne bruyante
        <BLANKLINE>
        """
        self._verbose += msg+"\n"
        if verbose:
            print(msg)

    def run(self, verbose=False):
        """
        Execute the process in the Mini Brain CPU.

        EXAMPLES::

        >>> M = MiniBrain('''ld $7 #0
        ... ld 1 a
        ... mul #0
        ... dec #0
        ... bfdn 2
        ...
        ... 5''')
        >>> M.run()
        0
        """
        UAL = self._UAL
        MEM = self._memory
        running = True
        # Nice print of colunm name
        if self._nb_register == 5:
            self._add_line_verbose("|     #0     #1     #2     #3     #4 |  #-1=a "
                                   "| f | -->  PC : next instruction", verbose=verbose)
        while True:

            # get the current program counter
            program_counter = UAL.get_program_counter()

            # is the program counter value legal
            if program_counter < 0:
                self._add_line_verbose("Interruption : program_counter error", verbose=verbose)
                return 1
            if program_counter >= len(MEM._mem_array) - 1:
                self._add_line_verbose(str(UAL) + " : Empty instruction", verbose=verbose)
                self._add_line_verbose("Empty instruction : process terminated", verbose=verbose)
                self._add_line_verbose(str(MEM), verbose=verbose)
                return 0

            # read the next instruction
            next_instr = MEM.get_instruction(program_counter)
            if next_instr == '':
                next_instr = 'exit a'
            self._add_line_verbose(str(UAL) + " : " + next_instr, verbose=verbose)

            # tokenize the instruction
            tokens = self._memory.analyse_instruction(next_instr)
            # if the command in not valid
            if not tokens[0]:
                self._add_line_verbose("Error parsing instruction : "+tokens[1], verbose=verbose)
                self._add_line_verbose(tokens[2], verbose=verbose)
                return 2

            # else it is time to act
            msg = self.resolve_instructions(tokens[1])
            if msg != 0:
                if "Process exited normally" in msg:
                    self._add_line_verbose(msg, verbose=verbose)
                    return 0
                self._add_line_verbose(msg, verbose=verbose)
                return 3

################################################
#       Test for local developping
# enable them when downloading the file on
# your computer outside platon
################################################
# import sys

# code = ''.join([line for line in sys.stdin])
# print(code)
# M = MiniBrain(code)
# M.run(verbose=True)


