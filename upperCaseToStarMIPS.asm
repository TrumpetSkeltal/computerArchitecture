.data
text0: .asciiz "Please enter the string \n" # storing the string in text0
buf0: .space 100  # buffer of size 100 to store the string

.text
	.globl main
main: 
	la $a0, text0 # we load the string to register a0
	li $v0, 4  # loading up system procedure 4 - console output
	syscall # we give control back to the operating system

	la $a0, buf0 #loading the address of the buffer which holds our string as an argument for procedure which will read our string
	li $a1, 99 #the maximum amount of characters our string can hold - remember that each string ends with 0
	li $v0, 8 #loading up system procedure 8 - reading from the console
	syscall
	
	li $t1, 'A' # we hold these characters to tell whether the current char that we iterated to is upper or lower case.
	li $t2, 'Z'
	la $t3, buf0  # temporary "pointer" to the buffer with our string
	
loop_begin:
	lb $t4, ($t3) #we iterate over string loading bytes one by one
	beq $t4, $zero, loop_end #checks whether we have reached the end of the string, then we move onto loop_end code section
	
	blt $t4,$t1,increment_ptr # if true, the current char is not an uppercase letter, we move onto increment_ptr
	bgt $t4,$t2,increment_ptr # if true, the current char is not an uppercase letter, we move onto increment_ptr
	
	li $t4,'*' # otherwise the byte is an uppercase letter - we change it to '*'
	sb $t4, ($t3) # we save the char we changed in register t4 back to register t3

increment_ptr:
	add $t3, $t3, 1 #add 1 to move onto the next byte of the string
	b loop_begin #go back to the loop_begin part
loop_end:
	la $a0, buf0 # load the saved string
	li $v0, 4 # print the string in the console
	syscall
	
	li $v0, 10 #shutdown the program - procedure nr 10 does that
	syscall
	
	
	
