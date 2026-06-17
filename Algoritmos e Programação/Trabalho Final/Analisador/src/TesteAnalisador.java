import java.io.ByteArrayInputStream;
import java.util.Random;

public class TesteAnalisador {
    public static void main(String[] args) {

        Random random = new Random();
        StringBuilder entrada = new StringBuilder();

        for (int i = 0; i < 100; i++) {
            entrada.append(random.nextInt(10000) + 1).append("\n");
        }

        System.setIn(
                new ByteArrayInputStream(
                        entrada.toString().getBytes()
                )
        );

        Analisador.main(new String[0]);
    }
}
