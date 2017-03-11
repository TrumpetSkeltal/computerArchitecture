.data
text0:	.asciiz "Enter string \n"
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
	
	la $t0, buf0
	la $t1, buf0
	
loop_begin:
	lb $t3, ($t1)
	beq $t3, '\n', loop_swap_begin
	addi $t1, $t1, 1
	b loop_begin

loop_swap_begin:
	bge $t0, $t1, loop_swap_end
	subi $t1, $t1, 1
	lb $t6, ($t0)
	lb $t7, ($t1)
	sb $t6, ($t1)
	sb $t7, ($t0)
	addi $t0, $t0, 1
	b loop_swap_begin

loop_swap_end:
	la $a0, buf0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
		
