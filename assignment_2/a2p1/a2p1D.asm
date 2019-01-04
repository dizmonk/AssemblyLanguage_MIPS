
##########################################################
# Kurt Lancaster, CS 2318-003, Assignment 2, Part 1D
##########################################################
#	The program will prompt a user for input and calculate a weighted average  and display
#	labeled output 
##########################################################


			.data

es1Prompt:		.asciiz "Enter score for Exam 1: \n"
es2Prompt:		.asciiz "Enter score for Exam 2: \n"
es3Prompt:		.asciiz "Enter score for Final Exam: \n"
outLabel:		.asciiz "The weighted avg score is: "
		 					 			
			.text
			.globl main
main:

			li $v0,4					#get user input 
			la $a0, es1Prompt
			syscall
			li $v0, 5
			syscall
			move $t0, $v0			#$t0 has exam 1 score
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0,4
			la $a0, es2Prompt
			syscall
			li $v0, 5
			syscall
			move $t2, $v0			#$t2 has exam 2 score
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0,4
			la $a0, es3Prompt
			syscall
			li $v0, 5
			syscall
			move $t4, $v0			#$t4 has final exam score
			li $v0, 11
			li $a0, '\n'
			syscall
			#################################
			sll $t0, $t0, 9				#$t0 has exam1* 512
			li $t1, 2558				
			div $t0, $t1				
			mflo $t0					#$t0 has  exam 1*512/ 2558
			#################################
			li $t3, 614
			mult $t2, $t3				
			mflo $t2					#$t2 has  exam2 * 614
			sra $t2, $t2, 11			#$t2 has exam2*614/2048	
			#################################
			sra $t4, $t4,1				#$t4 has final exam/2
			#################################
			add $t4, $t4, $t2			#$t4 has final exam/2 + exam2/2048 * 614
			#################################
			add $t4, $t4, $t0			#$t4 has final exam/2 + exam2/2048 * 614 +exam1/2558 * 512
			#################################
			li $v0,4
			la $a0, outLabel			#Label the output
			syscall
			li $v0, 1
			move $a0, $t4			
			syscall					#print results
			
			li $v0, 10
			syscall					#graceful exit

