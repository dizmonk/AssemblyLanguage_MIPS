#demo1
                                                                                                        .data
howdy:												.asciiz "howdy!"
eimPrompt:											.asciiz "enter integer: "   
eisPrompt:                                                                                        .asciiz "enter name: "
name:                                                                                               .space 16 # hold up to 15 characters + \0             
                                                                                                        .text
                                                                                                        
                                                                                                        li $v0, 4
                                                                                                        la $a0, howdy
                                                                                                        syscall
                                                                                                        li $v0, 11
                                                                                                        li $a0, '\n'
                                                                                                        syscall
                                                                                                         li $v0, 4
                                                                                                        la $a0, eimPrompt
                                                                                                        syscall
                                                                                                        li $v0, 5
                                                                                                        syscall
                                                                                                        move $t1, $v0
                                                                                                        li $v0, 1
                                                                                                        move $a0, $t1
                                                                                                        syscall
                                                                                                        li $v0, 4
                                                                                                        la $a0, eisPrompt
                                                                                                        syscall

                                                                                                        li $v0, 8
                                                                                                        la $a0, name
                                                                                                        li $a1, 16
                                                                                                        syscall
                                                                                                        
                                                                                                        
                                                                                                        li $v0, 10
                                                                                                        syscall
                                                                                                        
                                                                                              