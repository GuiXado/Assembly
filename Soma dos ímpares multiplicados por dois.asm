#58. Entrar com o número de termos da série (n), (n > 0 e, 
#caso não seja, deve ser novamente solicitado),
#e imprimir o valor de H, sendo: H = 1*2+3*2+5*2+... 
#Observção: cada multiplicação é um termo. Entender a série 
#é fundamental para a resolução do problema.
.data
	n:.asciiz "Digite um número: "
	s:.asciiz "\nA soma dos ímpares multiplicados por dois é: "
.text
main:
	li $v0, 4 # Imprimir mensagem
	la $a0, n
	syscall
	li $v0, 5  # Ler número inteiro
	syscall
	add $s1, $v0, 0
	
	ble $s1, 0, main  # Se n <= 0, solicitar novamente
	
	li $t1, 1 # Inicializar o primeiro número ímpar
	li $t2, 0 # Inicializar contador
	li $s0, 0 # Inicializar H em 0 #nao sei se precisa
volta:
	mul $s2, $t1, 2 # Multiplicar o número ímpar por 2
	add $s0, $s0, $s2 # Adicionar ao total
	
	add $t1, $t1, 2 # Passar para o próximo ímpar
	
	add $t2, $t2, 1 # Incrementar o contador 
	blt $t2, $s1, volta # Continuar até contar n termos

	li $v0, 4
	la $a0, s
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
