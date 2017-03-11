.data

text0:	.asciiz "Enter ur string"
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
	la $t2, buf0
	addi $t1,$t1,1
	
loop_begin: 

	lb $t4, ($t1)
	lb $t5, ($t2)
	
	beq $t4, '\n', loop_end
	beq $t5, '\n', loop_end
	
	sb $t4, ($t2)
	sb $t5, ($t1)
	
	addi $t1,$t1,2
	addi $t2,$t2,2
	b loop_begin
	
loop_end:

	la $a0, buf0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
	
	