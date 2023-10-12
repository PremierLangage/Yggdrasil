
extends= javaerror.pl 


title = this is an exemple 
text=


stdout_tests==
"Test de compilationt" Bravo!
==



code==
publique Class Main{
    public static void main(String[] args) {
System.out.println("Bravo!");
}
}
==

codeXX==
public class Main {
    public static void main(String[] args) {
        
        
    }
    int Dammm(int x){
    return x*x;
    }
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


