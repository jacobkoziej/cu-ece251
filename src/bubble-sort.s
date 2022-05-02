/*
 * bubble-sort.s -- generalized bubble sort
 * Copyright (C) 2022  Jacob Koziej <jacobkoziej@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

.include "stddef.s"

.arch armv8-a

.text
.section .rodata

.Lusage_fmtstr:
	.string	"usage: %s array_size\n"

.Lint_fmtstr:
	.string "%d\n"

.text

.global main
.type   main, %function
main:
	stp	fp, lr, [sp, -16]!
	mov	fp, sp

	// array size is argv[1]
	mov	w9, 2
	cmp	w0, w9
	b.lt	.Lmain_err

	// convert argv[1] to an unsigned long
	ldr	x0, [x1, 8]
	mov	x1, 0
	mov	w2, 10
	bl	strtoul

	stp	x19, x20, [sp, -16]!
	mov	x20, x0
	bl	gen_rand_int_arr
	mov	x19, x0

	mov	x0, x19
	mov	x1, x20
	bl	print_rand_int_arr

	stp	x21, x22, [sp, -16]!
	bl	clock
	mov	x21, x0

	mov	x0, x19
	mov	x1, x20
	adrp	x2, cmp_int
	add	x2, x2, :lo12:cmp_int
	bl	bubble_sort

	bl	clock
	mov	x22, x0
	ldp	x21, x22, [sp], 16

	mov	x0, x19
	mov	x1, x20
	bl	free_rand_int_arr
	ldp	x19, x20, [sp], 16

	ldp	fp, lr, [sp], 16
	mov	w0, 0
	ret

.Lmain_err:
	// argv[0]
	ldr	x2, [x1]

	// FILE *stderr
	adrp	x0, :got:stderr
	ldr	x0, [x0, :got_lo12:stderr]
	ldr	x0, [x0]

	// format string
	adrp	x1, .Lusage_fmtstr
	add	x1, x1, :lo12:.Lusage_fmtstr
	bl	fprintf

	ldp	fp, lr, [sp], 16
	mov	w0, 1
	ret


// static int **gen_rand_int_arr(size_t nmemb);
.type	gen_rand_int_arr, %function
gen_rand_int_arr:
	stp	fp, lr, [sp, -16]!
	mov	fp, sp
	stp	x19, x20, [sp, -16]!

	// store nmemb
	mov	x19, x0

	// generate pointer array
	mov	x1, 8
	bl	calloc
	cbz	x0, .Lgen_rand_int_arr_ret

	stp	x21, x22, [sp, -16]!
	stp	x23, x24, [sp, -16]!

	// store pointer array somewhere safe
	mov	x21, x0
	mov	x22, x0

	// set a random seed using returned pointer
	bl	srand

	mov	x20, 0
.Lgen_rand_int_arr_loop:
	mov	x0, 4
	bl	malloc
	cbz	x0, .Lgen_rand_int_arr_err

	// generate random int
	mov	x23, x0
	bl	rand
	str	w0, [x23]
	str	x23, [x21], 8

	add	x20, x20, 1
	cmp	x20, x19
	b.lo	.Lgen_rand_int_arr_loop

	// restore pointer array
	mov	x0, x22

	ldp	x23, x24, [sp], 16
	ldp	x21, x22, [sp], 16

.Lgen_rand_int_arr_ret:
	ldp	x19, x20, [sp], 16
	ldp	fp, lr, [sp], 16
	ret

.Lgen_rand_int_arr_err:
	ldr	x0, [x21], -8
	bl	free
	sub	x20, x20, 1
	cbnz	x20, .Lgen_rand_int_arr_err

	mov	x0, x21
	bl	free

	mov	x0, NULL
	ldp	x19, x20, [sp], 16
	ldp	fp, lr, [sp], 16
	ret


// static void free_rand_int_arr(int **arr, size_t nmemb);
.type	free_rand_int_arr, %function
free_rand_int_arr:
	// can't free zero elements
	cbz	x1, .Lfree_rand_int_arr_ret

	stp	lr, fp, [sp, -16]!
	mov	fp, sp
	stp	x19, x20, [sp, -16]!
	stp	x21, x22, [sp, -16]!

	mov	x19, x0
	mov	x20, x0
	mov	x21, x1
.Lfree_rand_int_arr_loop:
	ldr	x0, [x19], 8
	bl	free

	sub	x21, x21, 1
	cbz	x21, .Lfree_rand_int_arr_loop

	mov	x0, x20
	bl	free

	ldp	x21, x22, [sp], 16
	ldp	x19, x20, [sp], 16
	ldp	lr, fp, [sp], 16
.Lfree_rand_int_arr_ret:
	ret


// static void print_rand_int_arr(const void **x, size_t n);
.type	print_rand_int_arr, %function
print_rand_int_arr:
	cbz	x1, .Lprint_rand_int_arr_ret

	stp	lr, fp, [sp, -16]!
	mov	fp, sp
	stp	x19, x20, [sp, -16]!
	mov	x19, x0
	mov	x20, x1
	stp	x21, x22, [sp, -16]!

	adrp	x21, .Lint_fmtstr
	add	x21, x21, :lo12:.Lint_fmtstr

.Lprint_rand_int_arr_loop:
	mov	x0, x21
	ldr	x1, [x19], 8
	ldr	w1, [x1]
	bl	printf
	sub	x20, x20, 1
	cbnz	x20, .Lprint_rand_int_arr_loop

	ldp	x21, x22, [sp], 16
	ldp	x19, x20, [sp], 16
	ldp	lr, fp, [sp], 16
.Lprint_rand_int_arr_ret:
	ret


// static int cmp_int(const void *a, const void *b);
.type	cmp_int, %function
cmp_int:
	ldr	w0, [x0]
	ldr	w1, [x1]
	sub	w0, w0, w1
	ret


// void bubble_sort(void **x, size_t n, int (cmp*) (const void *a, const void *b));
.global bubble_sort
.type   bubble_sort, %function
bubble_sort:
	ret
