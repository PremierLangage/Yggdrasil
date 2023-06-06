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

@DisplayName("MainTest")  
class MainTest {

    @Test
    @DisplayName("SimpleSquare")
    void SimpleSquare() {
        var p = 2;
        Assertions.assertEquals(Main.square(p), 4);
    }

    @Test
    @DisplayName("NegativeSquare")
    void NegativeSquare() {
        var p = -2;
        Assertions.assertEquals(Main.square(p), 4);
    }

    @Test
    @DisplayName("ZeroSquare")
    void ZeroSquare() {
        var p = 0;
        Assertions.assertEquals(Main.square(p), 0);
    }
    

}
==