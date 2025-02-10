.data
	n: .asciiz "\nDigite o número: "
	dn: .asciiz "\nDigite novamente.\n"
	np: .asciiz "\nO próximo número primo é: "
	esp: .asciiz "\n"
.text
main:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0 # s0 recebe o valor inicial
	
	ble $s0, 1, erro # s0 menor ou igual a 1 
	bgt $s0, 50000, erro # s0 maior que 
	j inicio # se dentro dos parâmetros pula pro inicio
erro: # se fora dos parâmetros exibe msg de erro e solicita novamente um valor
	li $v0, 4
	la $a0, dn
	syscall
	j main
inicio: # inicializa os contadores 
	li $t1, 1 # t1 vai receber o valor a raiz (aproximado)
	li $t2, 2 # t2 vai receber n° que div o s0 para verificar (o resto) se é primo
naoprimo:
	add $s0, $s0, 1 # add +1 ao s0 
	# (uma vez que ele quer o prox n° primo, ele mesmo já é ignorado aqui
	
	rem $s1, $s0, 2 # s1 recebe o resto da div de s0 por 2 
	beq $s1, 0, naoprimo # verifica se o resto é igual a 0, se sim retorna pra somar +1 no s0 (verificar o prox)
	# aqui já elimita todos os n° pares, só passando os ímpares para verificação
raiz: 
	add $t1, $t1, 1 # soma 1 ao t1 para a mul dele por ele iniciar em 2 e vai testando de 1 em 1 (3; 4; 5; ...)
	mul $t7, $t1, $t1 # t7 = t1 * t1 (ex.: 5 * 5 = 25)
	blt $t7, $s0, raiz # verifica se o resultado da mul já alcançou o valor a ser verificado ( no caso o s0)
	# se ainda não volta (raiz) e testa novamente antes de seguir
	# como resultado o t1 vai ter o maior numero que ele * ele de um valor a cima do s0

primo: # o n° sendo impar, tendo a raiz proximada ele passa para verificar se é primo
	rem $s2, $s0, $t2 # s2 recebe o resto de s0 (n° a ser verificado) div por t2 (contador iniciado em 2)
	beq $s2, 0, inicio # se resto zero reinicia (desde a declaração dos contadores para zerar)
			# se resto 1 segue
			
	bge $t2, 3, pula # se contador t2, for maior ou igual a 3 (pula a soma +1)
	add $t2, $t2, 1 # soma +1 e segue
	j denovo # pula a soma de +2
pula: # aqui eu só estou fazendo com que o valor a ser div seja um n° ímpar para a conferencia
	add $t2, $t2, 2 # só passa aqui se o t2 (for 3 ou maior) contador passa a ser 3+2=5 / 5+2=7 / 7+2=9...
denovo:
	ble $t2, $t1, primo # se t2 ('divisor atual') menor ou igual ao t1 ('raiz') ele volta para dividir novamente
	# só passa dessa etapa se todos os restos verificados derem diferente de zero
fim:
	li $v0, 4
	la $a0, np
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
	li $v0, 4
	la $a0, esp
	syscall
