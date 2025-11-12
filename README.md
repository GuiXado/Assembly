# Trabalho Final - Assembly MIPS

Este repositório contém três algoritmos desenvolvidos em Assembly MIPS como parte do trabalho final da disciplina.

---

## Projetos

### 1. TrabalhoFinalF1.0.asm  
- **Descrição:** Recebe um número `n` (onde 1 < n ≤ 50000). Caso o número esteja fora do intervalo, solicita novamente a entrada.  
- **Objetivo:** Exibir o primeiro número primo após o número fornecido.

---

### 2. Fibonacci.asm  
- **Descrição:** Lê um número `n` natural tal que 2 < n < 20. Caso o número esteja fora do intervalo, solicita a entrada novamente.  
- **Objetivo:** Gera a série de Fibonacci até o `n`-ésimo termo, imprime a multiplicação dos dois últimos termos em cada iteração, exibindo somente os resultados que sejam números ímpares.

---

### 3. SomaDosImparesMultiplicadosPorDois.asm  
- **Descrição:** Recebe o número de termos `n` da série (n > 0). Caso não satisfaça, solicita a entrada novamente.  
- **Objetivo:** Calcula e imprime o valor da soma H, onde H é a soma dos termos da série: 1*2 + 3*2 + 5*2 + ... (cada termo é um número ímpar multiplicado por 2).

---

## Instruções para execução  
- Os programas foram escritos em Assembly MIPS e devem ser executados em um simulador compatível (ex: MARS, QtSpim).  
- Para cada programa, insira o número conforme solicitado, respeitando os limites indicados.  
- Caso a entrada esteja incorreta, o programa solicitará nova entrada até que um valor válido seja informado.

---

## Possíveis Melhorias

- **Otimização do cálculo de raiz no algoritmo de busca de primos (TrabalhoFinalF1.0.asm):**  
  Atualmente, o programa recalcula a raiz aproximada a cada novo número testado.  
  Embora funcione corretamente, isso torna o processo mais lento para números maiores.  
  Uma futura melhoria seria reaproveitar o valor anterior da raiz ou implementar um método mais eficiente de verificação de primos.
