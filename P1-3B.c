//Written by Kaleb Byrum, code by Eugene Rockey, 2018.
//Project 1 Part 3B
//Compile the program by entering 'gcc P1-3B.c P1-3BASM.s' and check for errors.
//Run the program by entering './a.out' at the command line
//Generate Assembly listing by entering 'gcc -S P1-3B P1-3BASM.s'
//Open the generated equivalent Assembly file 'P1-3B.s' and fulfill the part 3B requirements.

#include <stdio.h>
unsigned char next_char(char in);
void main()
{
	printf("Next character= %c\n",next_char('A'));
}
