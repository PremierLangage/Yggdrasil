
form =@ /form/text_editor.html
@ graderjavaerror.py [grader.py]
@ builderjavaerror.py [builder.py]
@ /utils/sandboxio.py
@ java.py

trys=0

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


