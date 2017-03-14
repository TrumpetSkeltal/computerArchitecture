
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
	
	la $t1, buf0
	la $t2, buf0
	li $t5, 'z'
	li $t6, 'a'
		
loop_begin:
	lb $t3, ($t1)
	addi $t1, $t1, 1
	blt $t3, $t6, dont_remove
	bgt $t3, $t5, dont_remove
	b loop_begin
	
dont_remove:
	sb   $t3,($t2)
	addi $t2, $t2, 1
	bne $t3, $zero, loop_begin

loop_end:
	la $a0, buf0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
		
