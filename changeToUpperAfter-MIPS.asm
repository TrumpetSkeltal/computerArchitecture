.data
text0:	.asciiz "Enter string '\n'"
buf0:	.space 100
buf1:	.space 100

	.text
	.globl main
	
main:
	la $a0, text0
	li $v0, 4
	syscall
	
	la $a0, buf0
	la $a1, 99
	li $v0, 8
	syscall
	
	la $t1, buf0
	la $t2, buf1

	
loop_begin:
	lb $t3, ($t1)
	beq $t3, '\n', end_loop
	beq $t3, $zero, end_loop
	bne $t3,'-', load
	addi $t1,$t1,1
	lb $t3, ($t1)
	sub $t3, $t3, 0x20

load:
	
	sb $t3, ($t2)
	addi $t2, $t2, 1
	addi $t1, $t1, 1
	b loop_begin
	
end_loop:
	addi $t2, $t2, 1	
	sb $zero, ($t2)
	la $a0, buf1
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
