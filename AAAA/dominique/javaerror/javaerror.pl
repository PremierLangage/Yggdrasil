
form =@ /form/text_editor.html
@ /grader/java.py [grader.py]
@ /builder/before.py [builder.py]
@ /utils/sandboxio.py

before==
editor["code"] = (
    "public class %s {\n"
    "    public static void main(String[] args) {\n"
    "        System.out.println("Bonjour les erreurs de syntaxe"); \n"
    "    }\n"
    "}"
) % classname


==

editor.language = java
editor.id = answer

classname = Main

