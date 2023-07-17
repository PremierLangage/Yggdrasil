
extends= javaerror.pl 


title = this is an exemple 
text=


stdout_tests==
"No argument" Bravo!
==



code12==
publique Class Main{
System.out.println("Bravo!");
}
==

code==
public class %s {
    public static void main(String[] args) {
        
        
    }
    int %s(int x){
    return x*x;
    }
==


before==

basetext = """
Il faut corriger le code dans l'editeur pour que le test puisse avoir lieux.
Voici ce qu'a répondu la compilation.
"""
text = basetext

editor["code"]=code


==


