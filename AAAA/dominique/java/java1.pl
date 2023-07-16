
extends = /template/java.pl

title = Première méthode
text ==

Ecrire dans la classe {{classname}} une méthode {{name}} qui prend un *int* en paramêtre et retourne sont carré.


== 

before==
import random
classname = random.choice(['Maclass','Main','Principale','Platon','PL'])
name = random.choice(['maMethode','m','square','fois','prise'])


editor["code"] = """
public class %s {
    public static void main(String[] args) {
        int %s (int x){

        }
        
    }
}""" % (classname,name)
==

junit==
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions;

@DisplayName("Point Test")
class PointTest {
    
    @Test
    @DisplayName("Get X")
    void testGetX() {
        var p = new Point(2, 3);
        Assertions.assertEquals(p.getX(), 2);
    }

    @Test
    @DisplayName("Get Y")
    void testGetY() {
        var p = new Point(2, 3);
        Assertions.assertEquals(p.getY(), 3);
    }
}
==


