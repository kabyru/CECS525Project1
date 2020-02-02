//Written by Kaleb Byrum, code by Eugene Rockey. 2018.
//Project 1 Part 2
//Compile on Raspberry Pi using the command 'gcc P1-2.c' to make sure there are no errors.
//Compile on Raspberry Pi using the command 'gcc -S P1-2.c' to generate Assembly listing.
//Open the generated Assembly file P1-2.s abd fulfill part 2 requirements.

//Volatile modifier for variables that change due to hardware interrupts, RTC, etc...
volatile int var;

//Function with pointers
void swap(int *x, int *y)
{
	int temp;
	temp = *x;
	*x = *y;
	*y = temp;
}
//A stack frame (fp) is used here for the subroutine (function) call.
//Also, the stack is used when switching between OS and main() too.
int main()
{
	//Local variables
	int a, b;
	a = 10;
	b = 20;
	swap(&a, &b);
	return 0;
}
