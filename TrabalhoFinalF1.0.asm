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
	add $s0, $v0, 0
	
	ble $s0, 1, erro
	bgt $s0, 50000, erro
	j inicio
erro:
	li $v0, 4
	la $a0, dn
	syscall
	j main
inicio:
	li $t1, 1
	li $t2, 2
naoprimo:
	add $s0, $s0, 1
	
	rem $s1, $s0, 2
	beq $s1, 0, naoprimo
raiz:
	add $t1, $t1, 1
	mul $t7, $t1, $t1
	blt $t7, $s0, raiz
primo:
	rem $s2, $s0, $t2
	beq $s2, 0, inicio
	
	bge $t2, 3, pula
	add $t2, $t2, 1 
	j denovo
pula:
	add $t2, $t2, 2 
denovo:
	ble $t2, $t1, primo
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