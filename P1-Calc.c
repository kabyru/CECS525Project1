#include<stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


int calc_add(int l, int r); //This function will use assembly code to add two numbers.
int calc_sub(int l, int r); //This function will use assembly code to subtract two numbers.
long long calc_mul(int l, int r); //This function will use assembly code to multiply two numbers.
int calc_div(int* rem, int l, int r); //This function will use assembly code to divide two numbers and provide ther remainder

int main(int argc, const char** argv)
{
f:
	for(;;) //Unending for loop to ensure user interface never ends unless specified by the user.
	{
		printf("Calculator\n==========\n\t(1) Add\n\t(2) Subtract\n\t(3) Multiply\n\t(4) Divide\n\t(0) Exit\n");

		char input[100] = ""; //Stores input choice provided by user.
		int length = 0; //Initializes input length to zero.
		scanf("%s", input); //Scans for input.
		length = strlen(input); //Stores the length of the user input
		for (int i = 0; i < length; i++)
		{
			if (!isdigit(input[i])) //Scans through input to determine if input is a valid number.
			{
				printf("Please enter a number.\n");
				goto f; //Resets program to beginning if input is not a number.
			}
		}

		int val = atoi(input); //Converts the user input (taken as a string) into an integer
		printf("You input: %d\n",val); //Confirms success of previous code by printing back to the user their input, in integer form

		if (val == 0)
			return 0; //If user inputs 0, the program ends, breaking the for loop.
		int l; //l and r store the two numbers the user wishes to perform an operation with.
		int r;
		printf("First Number: "); 
		if (scanf("%d", &l) != 1) //Prompts user for first number, if it is not an integer it will ask the user to provide an integer and reset the interface.
		{
			fflush(stdin);
			printf("Not a number.\nTry Again: ");
			continue; //Resets to the beginning of the user interface
		}

		printf("Second Number: ");
		if (scanf("%d", &r) != 1) //Prompts the user for the second number, if it is not an integer, it will ask the user to provide an integer and reset the interface.
		{
			fflush(stdin);
			printf("Not a number.\nTry Again: ");
			continue;
		}

		int rem; //Stores the remainder of the division operation
		int res; //Stores the result of the division operation

		switch (val)
		{
		case 1:
			printf("Answer: %d\n", calc_add(l, r)); //Returns the result of the assembly subroutine calc_add
			break;
		case 2:
			printf("Answer: %d\n", calc_sub(l, r)); //Returns the result of the assembly subroutine calc_sub
			break;
		case 3:
			printf("Answer: %lld\n", calc_mul(l, r)); //Returns the result of the assembly subroutine calc_mul
			break;
		case 4:
			if (!r) //Checks to see if the divisor is zero, and forces the user to reinput operands if so.
			{
				printf("Can't have a 0 as a divisor.");
				break;
			}
			res = calc_div(&rem, l, r); //Values of res and rem are retrieved.
			printf("Answer: Result %d Remainder %d\n", res, rem);  //Returns the result of the assembly subroutine calc_div
			break;
		default:
			printf("Not an operation."); //If any integer value not specified in the menu options is chosen, then the user will have to try again.
		}
	}
}
