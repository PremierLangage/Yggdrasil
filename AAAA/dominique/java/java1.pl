
extends = /template/java.pl

title = Première méthode
text ==

Ecrire dans la classe **{{classname}}** une méthode **{{name}}** qui prend un *int* en paramêtre et retourne le carré de son paramètre.


== 

before==
import random
classname = random.choice(['Maclass','Exercice1','Principale','Platon','PL'])
name = random.choice(['maMethode','m','square','fois','prise'])


editor["code"] = """
public class %s {
    public static void main(String[] args) {
        
        
    }
    int %s(int x){
    return x*x;
    }
}""" % (classname,name)

junit= """

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions;

@DisplayName("%s Test")
class PointTest {
    
    @Test
    @DisplayName("%s")
    void testCarre() {
        var p = new %s();
        Assertions.assertEquals(36,p.%s(6));
    }

}
""" % (classname,name,classname,name)
==


