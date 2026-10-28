package areaGeometrica;

public class Main {

    public static void executar() {
        System.out.println("==============================================================");
        System.out.println("   EXERCÍCIO 3 — CÁLCULO DE ÁREAS GEOMÉTRICAS");
        System.out.println("==============================================================");

        // 6. Criando objetos das três figuras e apresentando suas áreas individualmente
        Retangulo retangulo = new Retangulo(10.0, 5.0);
        Circulo circulo = new Circulo(4.0);
        Triangulo triangulo = new Triangulo(8.0, 6.0);

        System.out.println("\n--- Áreas individuais ---");
        System.out.printf("Área do %s: %.2f%n", retangulo.getNomeFigura(), retangulo.calcularArea());
        System.out.printf("Área do %s: %.2f%n", circulo.getNomeFigura(), circulo.calcularArea());
        System.out.printf("Área do %s: %.2f%n", triangulo.getNomeFigura(), triangulo.calcularArea());

        // Desafio adicional: armazenar as figuras em um vetor FiguraGeometrica[] e percorrê-lo
        System.out.println("\n--- Desafio Adicional: Percorrendo vetor FiguraGeometrica[] (Polimorfismo) ---");
        FiguraGeometrica[] figuras = new FiguraGeometrica[]{
                retangulo,
                circulo,
                triangulo
        };

        for (int i = 0; i < figuras.length; i++) {
            System.out.printf("[%d] %s -> Área = %.2f%n",
                    i + 1, figuras[i].getNomeFigura(), figuras[i].calcularArea());
        }

        System.out.println("\n--- Pergunta para reflexão ---");
        System.out.println("P: Por que não faz sentido criar um objeto genérico de FiguraGeometrica sem definir qual figura ele representa?");
        System.out.println("R: Porque 'FiguraGeometrica' é uma abstração; não existe uma fórmula única para calcular a área");
        System.out.println("   sem saber qual é a forma geométrica concreta (retângulo, círculo, triângulo, etc.) e suas dimensões.");
    }

    public static void main(String[] args) {
        executar();
    }
}
