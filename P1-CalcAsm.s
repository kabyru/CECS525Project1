.section ".text"
.global calc_add
.global calc_sub
.global calc_mul
.global calc_div

calc_add:								@int calc_add(int l, int r)
	add r0, r0, r1						@int a = l + r
	bx lr								@return a

calc_sub:								@int calc_add(int l, int r)
	sub r0, r0, r1						@int a = l - r
	bx lr								@return a

calc_mul: 								@long long calc_div(int l, int r)
	smull r0, r1, r0, r1				@long long a = (long long) l*r
	bx lr								@return a

calc_div:								@int calc_div(int* rem, int n, int d)
	cmp r2, #0							@
	bge calc_div_after_divisor_check	@if d >= 0 goto calc_div_after_divisor
	neg r2, r2							@d = -d
	push {lr}							@
	bl calc_div_after_divisor_check		@int a = calc_div_after_divisor_check(rem,n,d)
	pop {lr}							@
	neg r0, r0							@a = -a
	bx lr								@return a
calc_div_after_divisor_check:			@int calc_div_after_divisor_check(int* rem, int n, int d)
	cmp r1, #0							@
	bge calc_div_after_num_check		@if n >= 0 goto calc_div_after_num_check
	neg r1, r1							@n = -n
	push {lr}							@
	bl calc_div_after_num_check			@int a = calc_div_after_num_check(rem,n,d)
	pop {lr}							@
	neg r0, r0							@a = -a
	bx lr								@return a
calc_div_after_num_check:				@int calc_div_after_num_check(int* rem, int n, int d)
	mov r3, #0							@int q = 0
	mov r4, r1							@int r = n
	b calc_div_loop_cond				@while r >= d
calc_div_loop:							@
	add r3, r3, #1						@q += 1
	sub r4, r4, r2						@r -= d
calc_div_loop_cond:						@
	cmp r4, r2							@
	bge calc_div_loop					@end while
	stm r0, {r4}						@*rem = r
	mov r0, r3							@
	bx lr								@return q
