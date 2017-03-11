.data 
text0:	.asciiz "Enter your text \n"
buf0: 	.space 100
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

	li $t1 '0'
	li $t2 '9'
	la $t3, buf0
	
loop_begin:
	lb $t4, ($t3)
	beq $t4, 0, loop_end
	blt $t4, $t1, increment_ptr
	bgt $t4, $t2, increment_ptr
	
	li $t4,'*'
	sb $t4, ($t3)
	
increment_ptr: 
	add $t3, $t3, 1
	b loop_begin
	
loop_end:
	la $a0, buf0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall