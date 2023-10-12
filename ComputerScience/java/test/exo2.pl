extends = java.pl


title = méthode carré

text ==
écrire une méthode statique **square** dans la class Square 
qui prend un nombre entier n et qui le retourne au carré et éxécuter la dans le main
==
before==
editor["code"] = (
    "public class Square {\n"
    "}"
)

editor["code"] = (
    "public class Square {\n"
    "    public static void main(String[] args) {\n"
    "        System.out.println(Square.square(Integer.parseInt(args[0])));"
    "    }\n"
    "}"
)
==

stdout_tests==
        basique 4 2
        negatif 4 -2 
        zero 0 0
==

code_before== #|java|
    }
==

code_after== #|after|
public class Square {
    public static void main(String[] args) {
        System.out.println(Square.square(Integer.parseInt(args[0])));    }
==

classname=Square
#junit
toto ==
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions;
import java.lang.reflect.*;

@DisplayName("SquareTest")  
class SquareTest {

    @Test
    @DisplayName("SimpleSquare")
    void simpleSquare() {
        var p = 2;
        Assertions.assertEquals(Square.square(p), 4,"la fonction ne renvoie pas les bonnes valeurs");
    }

    @Test
    @DisplayName("NegativeSquare")
    void negativeSquare() {
        var p = -2;
        Assertions.assertEquals(Square.square(p), 4,"la fonction ne renvoie pas les bonnes valeurs");
    }

    @Test
    @DisplayName("ZeroSquare")
    void zeroSquare() {
        var p = 0;
        Assertions.assertEquals(Square.square(p), 0,"la fonction ne renvoie pas les bonnes valeurs");
    }
    
    @Test
    @DisplayName("Visibility")
    void visibility() throws NoSuchMethodException {
        var method = Square.class.getMethod("square");
        String modifiers = Modifier.toString(method.getModifiers());
        
        Assertions.assertEquals(modifiers.contains("static") , true,Square.class.getMethods().toString());

    }

}
==