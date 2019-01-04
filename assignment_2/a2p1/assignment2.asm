#Kurt Lancaster, CS 2318-003, Assignment 2 Part 1 Program A

							.data
eimPrompt:					.asciiz "Enter an integer: "
ieiLab:						.asciiz "integer entered is: "
eisPrompt:					.asciiz "Enter a string of up to 30 characters: "
seiLab:						.asciiz "string entered is: "
string:						.space 31                         #up to 30 chars + '\0'
eicPrompt:					.asciiz "Enter a character: "
ceiLab:						.asciiz "the character is: "


							.text 
							.globl main
main:
							li $v0, 4				#display prompt to enter int
							la $a0, eimPrompt 
							syscall
							li $v0, 5				#read in the int
							syscall
							move $t1, $v0			#copy int entered to $t1
							li $v0, 4				
							la $a0, ieiLab			#print output string message
							syscall
							li $v0, 1				#print out the int entered by user
							move $a0, $t1
							syscall
							li $v0, 11				#new line
							li $a0, '\n'
							syscall
							li $v0, 4				#display prompt for user input for string			
							la $a0, eisPrompt
							syscall
							li $v0, 8				#read in user string
							la $a0, string
							li $a1, 31
							syscall
							li $v0, 4				#print the sting output message
							la $a0, seiLab
							syscall
							la $a0, string			#print the string
							syscall	
							li $v0, 4				#print the prompt message for user
							la $a0, eicPrompt
							syscall
							li $v0, 12				#read in the char entered
							syscall
							move $t2, $v0			#copy char entered to $t2
							li $v0, 11				#new line
							li $a0, '\n'
							syscall
							li $v0, 4				#print the output message 
							la $a0, ceiLab
							syscall
							li $v0, 11
							move $a0, $t2
							syscall
							
							li $v0, 10				#graceful exit
							syscall
							
							