package areaGeometrica;

/**
 * Nível 2 — Exercício 3: Cálculo de áreas geométricas
 *
 * Pergunta para reflexão:
 * Por que não faz sentido criar um objeto genérico de FiguraGeometrica sem definir qual figura ele representa?
 *
 * Resposta:
 * Porque "Figura Geométrica" é um conceito abstrato. Não existe uma fórmula matemática genérica para
 * calcular a área de uma figura sem saber sua forma específica (se possui raio, base, altura, lados, etc.).
 * Por isso, FiguraGeometrica serve como um contrato/modelo base para suas subclasses concretas
 * (Retangulo, Circulo, Triangulo), garantindo que todas implementem calcularArea() à sua maneira.
 */
public abstract class FiguraGeometrica {

    public abstract double calcularArea();

    public String getNomeFigura() {
        return this.getClass().getSimpleName();
    }
}
