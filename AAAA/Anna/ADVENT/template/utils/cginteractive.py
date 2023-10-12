from asyncio import create_subprocess_exec, wait_for, TimeoutError
from asyncio.subprocess import PIPE

class InvalidCGBinaryExecution(Exception):
    pass

class CGInteractiveBinary():
    """Class which allows to start, stop and interact with a process through its standard input and output easily.
    There is no deadlock protection, thus communication must always be unidirectional at any time, as in, both processes should
    not attempt to communicate with the other at the same time.
    A strict query/response protocol will avoid any problem on that aspect.
    Newlines (\n) must be used to signal the end of a query or of an answer"""
    cmd_nobuf = ['stdbuf', '-oL']

    def __init__(self, cmd):
        """Initialises a CGInteractiveBinary instance
        cmd must be a list of strings corresponding to the command to use to start the binary"""
        self.cmd = cmd
        self.proc = None

    async def start(self, forcelinebuffers=True):
        """Starts the process"""
        finalcmd = []
        if forcelinebuffers: finalcmd += self.cmd_nobuf
        finalcmd += self.cmd

        self.proc = await create_subprocess_exec(*finalcmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)

    async def stop(self):
        """Kills the process if it's still running"""
        if self.proc.returncode is None:
            self.proc.kill()
            await self.proc.wait()

    async def send(self, *args):
        """Sends a string to the running process. Takes a variable amount of arguments, each is turned into their
        string representation if they're not a string, and arguments are all joined together into one string, with newlines
        inserted in between.
        A newline is also added at the end of the string"""
        # Building query
        query = ''
        for arg in args:
            arg = str(arg)
            query += arg
            if not arg.endswith('\n'): query += '\n'
        # Sending query
        try:
            self.proc.stdin.write(query.encode())
            await self.proc.stdin.drain()
        except (BrokenPipeError, ConnectionResetError):
            if self.proc.returncode is None:
                raise InvalidCGBinaryExecution("Cannot sent data to subprocess: pipe is broken")
            else:
                raise InvalidCGBinaryExecution("Cannot send data to subprocess: subprocess terminated prematurely")

    async def receive(self, timeout=1):
        """Receives data from the running process. The string to receive must be marked with a newline to indicate
        the end of it. An InvalidCGBinaryExecution exception is raised in case of a timeout while waiting for the answer"""
        try:
            output = await wait_for(self.proc.stdout.readline(), timeout)
        except TimeoutError:
            raise InvalidCGBinaryExecution("Timeout while waiting for subprocess answer")
        return output.decode()

    async def query(self, query, timeout=1):
        """Combines a send and a receive together"""
        await self.send(query)
        return await self.receive(timeout=timeout)