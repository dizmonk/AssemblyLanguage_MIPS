##########################################################
# Kurt Lancaster, CS 2318-003, Assignment 2, Part 1C
##########################################################
#	The program will allocate a global array for storing four integers, display the initial contents and
#	swap 1st and 3rd & 2nd and 4th elements and display the new array 
##########################################################


			.data
intArr:			.word 111, 222, 333, 444	# global int array of size 3 initialized
			 			#   to 111, 222, 333 & 444 (from 1st to 4th)
outLabel:		.asciiz "The initial array 1st to 4th element is: \n"
swapLabel:		.asciiz "\nThe array,4th to 1st element, after the swaps is: \n"
			 			
			.text
			.globl main
main:
			la $t0, intArr		# $t0 has address of intArr
			lw $t1, 0($t0)		
			lw $t2, 4($t0)
			lw $t3, 8($t0)
			lw $t4, 12($t0)		
			
			li $v0, 4
			la $a0, outLabel
			syscall
			## print the initial array contents
			li $v0, 1
			move $a0, $t1		# should print 111
			syscall
			li $v0, 11				#newline
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t2		# should print 222
			syscall
			li $v0, 11				#newline
			li $a0, '\n'		
			syscall
			li $v0, 1
			move $a0, $t3		# should print 333
			syscall
			li $v0, 11				#newline
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t4		# should print 444
			syscall
			sw $t3, 0($t0)		#swap 1st and 3rd elements 
			sw $t1, 8($t0)
			sw $t2, 12($t0)		#swap 2nd and 4th elements
			sw $t4, 4($t0)
			li $v0, 4
			la $a0, swapLabel		#print label for output
			syscall
			lw $t1, 0($t0)		
			lw $t2, 4($t0)
			lw $t3, 8($t0)
			lw $t4, 12($t0)
			## print the initial array contents
			li $v0, 1
			move $a0, $t4		# should print 222
			syscall
			li $v0, 11				#newline
			li $a0, '\n'		
			syscall
			li $v0, 1
			move $a0, $t3		# should print 111
			syscall
			li $v0, 11				#newline
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t2		# should print 444
			syscall
			li $v0, 11				#newline
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t1		# should print 333
			syscall
			
			li $v0, 10				#graceful exit
			syscall
			
			
