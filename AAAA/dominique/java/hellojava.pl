
extends= /template/java.pl

title= Causer à l'utilisateur 

text==

On veut produire quelque chose avec notre code !

Afficher un text sur l'ecran ! 

Techniquement on dit "envoyer des caractères sur la sortie standard" !

Pour cela on utilise la fonction **println** de la class **java.lang.System**.

Dans la fonction Main de la class Bienvenue ajoutez la ligne suivante :

    System.out.println("Hello");

L'idée est que System.out est un canal de sortie de votre programme et que vous écrivez dedans en utilisant sa méthode println.

La méthode println recopie ses paramètres sous forme de string dans le canal et ajoute un caractère de fin de ligne '\n'.
==

classname = Bienvenue


# Name expectedresultonstdout args
stdout_tests==
"No argument" Hello
James Hello Bande de moules
==


doc==
The first and second arguments of each line must be the repectively the name of the test
and the expected output, any other argument will be given to the student's program standard input.

If the line start with the character '!', the test will be set as hidden (only the name is
displayed in the feedback).

Returns a list containing a dict {name, hidden, expected, args, returncode, out, err} for
each test where:
    - 'name' is the name of the test.
    - 'hidden' is True if the test was set as hidden, False otherwise.
    - 'expected' is the expected output on stdout.
    - 'args' is a list of arguments given to the student's program (may be an empty list).
    - 'returncode' code returned by the student's program.
    - 'out' received stdout (may be an empty string).
    - 'err' received stderr (may be an empty string).

Returns an empty list if the key 'stdout_tests' was not found.

E.G.:
With a tests key like this:

    stdout_tests==
    "No argument" Hello
    James "Hello James" James
    "2 arguments" "Hello Jhon and James" Jhon James
    !"One argument with space" "Hello Jhon Doe" "Jhon Doe"
    ==
==
