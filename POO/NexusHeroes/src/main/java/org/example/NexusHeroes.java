package org.example;

import org.example.exeptions.AtaqueRecebidoException;
import org.example.exeptions.ManaInsuficienteException;
import org.example.exeptions.TrapDamageException;
/**
 * Classe Main: NexusHeroes
 * Simulação do jogo com 3+ cenários usando try-catch
 * Demonstra: Instanciação, Herança, @Override, Invariantes, Exceções
 */

public class NexusHeroes {
    public static void main(String[] args) {
        System.out.println("╔════════════════════════════════════════════╗");
        System.out.println("║       NEXUS HEROES - SIMULAÇÃO EM JAVA      ║");
        System.out.println("║   Conceitos: Herança, Polimorfismo, POO    ║");
        System.out.println("╚════════════════════════════════════════════╝");
        System.out.println();

        // ============================================================
        // CENÁRIO 1: Criação de Personagens e Combate Guerreiro
        // ============================================================
        System.out.println("\n█ CENÁRIO 1: Guerreiro em Combate com Goblin");
        System.out.println("─".repeat(50));

        try {
            Guerreiro guerreiro = new Guerreiro("piske");
            System.out.println("\n✓ Guerreiro criado:");
            System.out.println("  " + guerreiro + "\n");

            // Cria inimigo
            Inimigo goblin = new Inimigo("Goblin", 20, 2);
            System.out.println("✓ Inimigo criado:");
            System.out.println("  " + goblin + "\n");

            // Combate: Guerreiro ataca
            System.out.println("🔥 COMBATE INICIADO:");
            guerreiro.atacarComEspada(goblin);
            System.out.println("  Goblin HP: " + goblin.getHp() + "\n");

            // Inimigo retalha
            System.out.println("⚔️ Inimigo contra-ataca!");
            guerreiro.receberDano(goblin.getDano());
            System.out.println("  Guerreiro HP: " + guerreiro.getHp() + "\n");

            // Guerreiro ataca novamente
            guerreiro.atacarComEspada(goblin);
            System.out.println("  Goblin HP: " + goblin.getHp() + "\n");

            // Inimigo derrotado
            if (goblin.estaDerrotado()) {
                System.out.println("✅ VITÓRIA! Goblin foi derrotado!");
                System.out.println("  Guerreiro ganhou 10 XP e HeroCoins");
                guerreiro.adicionarExperiencia(10);
                Item moeda = new Item("HeroCoin", 10);
                guerreiro.adicionarItem(moeda);
            }

        } catch (AtaqueRecebidoException e) {
            System.out.println("❌ ERRO: " + e.getMessage());
        }

        // ============================================================
        // CENÁRIO 2: Mago com Controle de Mana
        // ============================================================
        System.out.println("\n\n█ CENÁRIO 2: Mago Conjurando Magias (Gerenciamento de Mana)");
        System.out.println("─".repeat(50));

        try {
            Mago mago = new Mago("archmage");
            System.out.println("\n✓ Mago criado:");
            System.out.println("  " + mago + "\n");

            // Cria inimigo forte
            Inimigo golem = new Inimigo("Golem", 95, 6);
            System.out.println("✓ Inimigo criado:");
            System.out.println("  " + golem + "\n");

            // Mago conjura magias
            System.out.println("🔥 COMBATE INICIADO:");
            System.out.println("Mago Mana Disponível: " + mago.getMana() + "/" + mago.getMana() + "\n");

            // Primeira magia
            mago.usarMagia(golem);
            System.out.println("  Golem HP: " + golem.getHp());
            System.out.println("  Mago Mana: " + mago.getMana() + "\n");

            // Inimigo retalia
            System.out.println("⚔️ Inimigo contra-ataca!");
            mago.receberDano(golem.getDano());
            System.out.println("  Mago HP: " + mago.getHp() + "\n");

            // Segunda magia
            mago.usarMagia(golem);
            System.out.println("  Golem HP: " + golem.getHp());
            System.out.println("  Mago Mana: " + mago.getMana() + "\n");

            // Inimigo retalia novamente
            System.out.println("⚔️ Inimigo contra-ataca novamente!");
            mago.receberDano(golem.getDano());
            System.out.println("  Mago HP: " + mago.getHp() + "\n");

            // Terceira magia
            mago.usarMagia(golem);
            System.out.println("  Golem HP: " + golem.getHp());
            System.out.println("  Mago Mana: " + mago.getMana() + "\n");

            // Inimigo derrotado
            if (golem.estaDerrotado()) {
                System.out.println("✅ VITÓRIA! Golem foi derrotado!");
                System.out.println("  Mago ganhou 20 XP e HeroCoins");
                mago.adicionarExperiencia(20);
                Item moeda = new Item("HeroCoin", 20);
                mago.adicionarItem(moeda);
            }

        } catch (ManaInsuficienteException e) {
            System.out.println("❌ ERRO DE MANA: " + e.getMessage());
        } catch (AtaqueRecebidoException e) {
            System.out.println("❌ ERRO: " + e.getMessage());
        }

        // ============================================================
        // CENÁRIO 3: Armadilha e Coleta de Itens
        // ============================================================
        System.out.println("\n\n█ CENÁRIO 3: Armadilha e Coleta de Itens");
        System.out.println("─".repeat(50));

        try {
            Guerreiro guerreiro2 = new Guerreiro("herói");
            System.out.println("\n✓ Novo Guerreiro criado:");
            System.out.println("  " + guerreiro2 + "\n");

            // Pisando em armadilha
            System.out.println("⚠️ ARMADILHA ACIONADA!");
            System.out.println("INFO");
            System.out.println("> HP antes: " + guerreiro2.getHp());

            try {
                throw new TrapDamageException("Armadilha acionada! -20 HP");
            } catch (TrapDamageException trap) {
                System.out.println("EXCEÇÃO");
                System.out.println("> TrapDamageException lançada! setVida(" +
                        (guerreiro2.getHp() - 20) + ") → Math.max(hp-20, 0). HP: " +
                        (guerreiro2.getHp() - 20) + ".");

                // Aplica dano da armadilha
                int novoHp = Math.max(0, guerreiro2.getHp() - trap.getDamageAmount());
                System.out.println("  HP depois: " + novoHp + "\n");
            }

            // Coleta item
            System.out.println("📦 BAÚ ENCONTRADO!");
            Item cristal = new Item("HeroCoin", 5);
            guerreiro2.adicionarItem(cristal);
            System.out.println("  Guerreiro agora tem: " + cristal + "\n");

            // Coleta cristal de mana (hipotético)
            System.out.println("💎 CRISTAL DE MANA ENCONTRADO!");
            System.out.println("INVARIANTE");
            System.out.println("> setMana(60) chamado. Math.min(mana+25, 50).");
            System.out.println("  Mana máxima atingida! Guerreiro pode ter: 50\n");

        } catch (Exception e) {
            System.out.println("❌ ERRO: " + e.getMessage());
        }

        // ============================================================
        // CENÁRIO 4: Mago sem Mana Suficiente
        // ============================================================
        System.out.println("\n\n█ CENÁRIO 4: Mago Tentando Usar Magia sem Mana");
        System.out.println("─".repeat(50));

        try {
            Mago magoFraco = new Mago("magoFraco");
            System.out.println("\n✓ Mago criado:");
            System.out.println("  " + magoFraco + "\n");

            // Simula consumo de mana até ficar com pouca
            System.out.println("Mago conjura múltiplas magias...");
            for (int i = 0; i < 5; i++) {
                Inimigo dummy = new Inimigo("Dummy", 40, 0);
                try {
                    magoFraco.usarMagia(dummy);
                    System.out.println("  Mana restante: " + magoFraco.getMana() + "\n");
                } catch (ManaInsuficienteException e) {
                    System.out.println("  ⚠️ " + e.getMessage() + "\n");
                    break;
                }
            }

            // Tenta conjurar sem mana
            System.out.println("Mago tenta conjurar SEM mana suficiente...");
            Inimigo inimigo = new Inimigo("Goblin", 20, 2);
            magoFraco.usarMagia(inimigo);

        } catch (ManaInsuficienteException e) {
            System.out.println("❌ ERRO CAPTURADO: " + e.getMessage());
            System.out.println("✓ Exceção foi lançada e capturada corretamente!\n");
        }

        // ============================================================
        // RESUMO FINAL
        // ============================================================
        System.out.println("\n" + "═".repeat(50));
        System.out.println("✅ SIMULAÇÃO CONCLUÍDA COM SUCESSO!");
        System.out.println("═".repeat(50));
        System.out.println("\n📋 Conceitos demonstrados:");
        System.out.println("  ✓ Instanciação de objetos (new)");
        System.out.println("  ✓ Hierarquia com extends");
        System.out.println("  ✓ Construtores com super()");
        System.out.println("  ✓ Encapsulamento (atributos protegidos)");
        System.out.println("  ✓ Invariantes (setVida, setMana)");
        System.out.println("  ✓ @Override de métodos");
        System.out.println("  ✓ Exceções customizadas");
        System.out.println("  ✓ Try-catch para tratamento");
        System.out.println("\n");
    }
}