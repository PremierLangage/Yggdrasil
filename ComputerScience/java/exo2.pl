extends = /template/java.pl


title = méthode carré

text ==
écrire une méthode statique **square** dans la class Square 
qui prend un nombre entier n et qui le retourne au carré 
==
before==
editor["code"] = (
    "public class Square {\n"
    "}"
)
==

classname=Square

junit==
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions;
import java.lang.reflect.*;

@DisplayName("SquareTest")  
class SquareTest {

    @Test
    @DisplayName("SimpleSquare")
    void simpleSquare() {
        var p = 2;
        try{
            Assertions.assertEquals(Square.square(p), 4,"la fonction ne renvoie pas le bon retour");
        }catch(Exception e){
        }

        }

    @Test
    @DisplayName("NegativeSquare")
    void negativeSquare() {
        var p = -2;
        Assertions.assertEquals(Square.square(p), 4);
    }

    @Test
    @DisplayName("ZeroSquare")
    void zeroSquare() {
        var p = 0;
        Assertions.assertEquals(Square.square(p), 0);
    }
    
    @Test
    @DisplayName("Visibility")
    void visibility() {
        var p = 0;
        Assertions.assertEquals(Square.square(p), 0);
    }

}
==