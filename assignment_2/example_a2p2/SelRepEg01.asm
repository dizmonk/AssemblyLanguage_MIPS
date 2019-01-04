#include <iostream>
#using namespace std;
						.data
#int iArr[10];
iArr:						.space 40	#allocate for storing 10 ints
#need to put these variables in registers, need to consider space, go through and translate in the program 
einMSG:					.asciiz	"Enter integer number: "
#int oneInt,
 #   used,
  #  minInt,
   # maxInt;
#char reply;
#bool hasDup;
#int* hopPtr1;
#int* hopPtr2;
#int* endPtr1;
#int* endPtr2;
#
						.text
						.globl main
main:
#int main()
#{
  #              // do
begDW1:  #//                   {
                
                    #used = 0;
                    				li $v1, 0
 #                   hopPtr1 = iArr;
 						la $t1, iArr		#load the address of the array $t1			
 
 begDW2: #                                      do
                   # {
                      # cout << "Enter integer #" << (used + 1) << ": ";
                      				li $v0, 4
                      				la $v0, einMSG
                      				syscall
                      				li $v0, 1
                      				addi $a0, $v1, 1
                      				li $v0, 11
                      				li $a0, ' '
                      				syscall
                       #                     cin >> oneInt;
                      				li $v0, 5
                      				syscall
                      				move $a3, $v0		#oneInt is now loaded into $a3

  						
  #                     /* if ( (oneInt % 2) != 0 ) */
  #                    // if ( (oneInt & 1) != 0 )
#                       if ( (oneInt & 1) == 0 ) goto endI1;

						andi $t9, $a3, 1
						beqz $t9, endI1
					#	beq $t9, $0, endI1		#this is the same as the line above it
begI1://                 {
#                          cout << "Odd value entered... 1 added to evenize..." << endl;
   #                       ++oneInt;
   						addi $a3, $a3, 1
   				
endI1:#//                       }
  			#                    *hopPtr1 = oneInt;		#storing the value of oneInt ($a3) into memory pointed to by hopPtr1($t1)
  						sw $a3, 0($t1)		#store $a3 in 0 offset so in $t1
                     #  ++used;
                     				addi $v1, 1
                      # ++hopPtr1;
                      				addi $t1, 4
                      #// if (used == 10) //use the negative of the condition!
		            #         if (used != 10) goto else2;
		            			li $t9, 10
		            			bne $v1, $t9, else2
begI2:  				
     # //                 {
                       #   cout << "Maximum of " << 10 << " values entered..." << endl;
                 #         reply = 'n';
                 				li $a2, 'n'
#                          goto endI2; //skip over next body
						j endI2
						
       # //               }
else2:# //                      else
        #//               {
           #               cout << "Enter another? (n or N = no, anything else = yes) ";
              #            cin >> reply;
endI2:#//                       }
;                    }
                    while (reply != 'n' && reply != 'N');
                    cout << endl;

                    cout << used << " values entered: ";
                    endPtr1 = iArr + used;
                   // for (hopPtr1 = iArr; hopPtr1 < endPtr1; ++hopPtr1)
                    hopPtr1 = iArr;
                    goto FTest1;

begF1://                    {
                       if (hopPtr1 < endPtr1 - 1)
                       {
                          cout << *hopPtr1 << "  ";
                       }
                       else
                       {
                          cout << *hopPtr1 << endl;
                       }
                       ++hopPtr1;
                    }
FTest1:             if(hopPtr1 < endPtr1) goto begF!;
                    hopPtr1 = iArr;
                    endPtr1 = iArr + used;
                    minInt = *iArr;
                    maxInt = minInt;
                    ++hopPtr1;
                    while (hopPtr1 < endPtr1)
                    {
                       if (*hopPtr1 < minInt)
                       {
                          minInt = *hopPtr1;
                       }
                       else
                       {
                          if (*hopPtr1 > maxInt)
                          {
                             maxInt = *hopPtr1;
                          }
                       }
                       ++hopPtr1;
                    }
                    cout << "Minimum is " << minInt << endl;
                    cout << "Maximum is " << maxInt << endl;
                    hasDup = false;
                    endPtr1 = iArr + used - 1;
                    endPtr2 = iArr + used;
                    for (hopPtr1 = iArr; !hasDup && hopPtr1 < endPtr1; ++hopPtr1)
                    {
                       oneInt = *hopPtr1;
                       for (hopPtr2 = hopPtr1 + 1; hopPtr2 < endPtr2; ++hopPtr2)
                       {
                          if (*hopPtr2 == oneInt)
                          {
                             hasDup = true;
                             break;
                          }
                       }
                    }
                    if (hasDup)
                    {
                       cout << "There's at least a duplicate..." << endl;
                    }
                    else
                    {
                       cout << "There's no duplicate..." << endl;
                    }

                    cout << "Do another case? (n or N = no, others = yes) ";
                    cin >> reply;
endDW1://                 }
                // while (reply != 'n' && reply != 'N');
DWTest1:                 if (reply != 'n' && reply != 'N') goto begDW1;

                 return 0;
}
