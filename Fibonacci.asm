#65. Criar um algoritmo que leia (n) (onde n deve ser um número natural maior que 2 e menor que 20, caso contrário, 
#deve ser solicitado), imprima a multiplicação dos 2 últimos termos gerados, em cada iteração, da série de 
#fibonacci e mostre apenas os resultados de valores ímpares , fazendo o incremento da série até chegar a (n).
.data
	d: .asciiz "\n\nDigite um número: "
	e: .asciiz "\nValor invalido!"
	imp: .asciiz "\nÉ impar: "
.text
main:
	li $v0, 4
	la $a0, d
	syscall
	
	li $v0, 5
	syscall
	add, $t1, $v0, 0

	bgt $t1, 19, erro
	blt $t1, 3, erro
	
	li $s1, 1
	li $s2, 1
	li $t2, 1
	j comeco
	
erro:
	li $v0, 4
	la $a0, e
	syscall
	j main
	
comeco:
	mul $s0, $s1, $s2
	rem $s4, $s0, 2
	
	beq $s4, 1, m
	j f
m:
	li $v0, 4
	la $a0, imp
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
f:
	add $s3, $s1, $s2
	add $s1, $s2, 0
	add $s2, $s3, 0
	
	add $t2, $t2, 1
	blt $t2, $t1, comeco













	