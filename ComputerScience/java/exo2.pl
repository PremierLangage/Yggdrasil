extends = /template/java.pl


title = méthode carré

text ==
écrire une méthode statique **square** dans la class Square 
qui prend un nombre n et qui retourne n au carré 
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
    void TestCarre() {
        var p = 2;
        Assertions.assertEquals(Main.square(p), 4);
    }

    @Test
    @DisplayName("NegativeSquare")
    void TestCarre() {
        var p = -2;
        Assertions.assertEquals(Main.square(p), 4);
    }

    @Test
    @DisplayName("ZeroSquare")
    void TestCarre() {
        var p = 0;
        Assertions.assertEquals(Main.square(p), 0);
    }
    

}
==