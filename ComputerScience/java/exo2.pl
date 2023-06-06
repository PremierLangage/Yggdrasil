extends = /template/java.pl


title = méthode carré

text = création d'une méthode statique **square** qui prend un nombre n et qui retourne n au carré

before==
wrapper = (
    "public class Main {\n"
    "%s"
    "    public static void main(String[] args) {\n"
    "        \n"
    "    }\n"
    "}"
)
==

build==
editor["code"] = wrapper% editor["code"]
==
classname=Main

junit==
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions;

@DisplayName("mkjhkjhlkjhkoijhkjh")  
class MainTest {

    @Test
    @DisplayName("test")
    void TestCarre() {
        var p = 2;
        Assertions.assertEquals(Main.square(p), 4);
    }


}
==