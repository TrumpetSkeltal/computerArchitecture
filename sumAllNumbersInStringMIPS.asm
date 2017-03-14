.data
text0:	.asciiz "Enter strings\n"
buf0:	.space 100

	.text
	.globl main

main:
	la $a0, text0
	li $v0, 4
	syscall
	
	la $a0, buf0
	li $a1, 99
	li $v0, 8
	syscall
	
	la $t1, buf0
	
	
begin_loop:
	lb $t3, ($t1)
	beq $t3, '\n', end_loop
	beq $t3, $zero, end_loop
	bgt $t3, '9', not_number
	blt $t3, '0', not_number
	sub $t3, $t3, '0'
	add $t4, $t3, $t4
	

not_number:
	addi $t1, $t1, 1
	b begin_loop
end_loop:
	move $a0, $t4
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
