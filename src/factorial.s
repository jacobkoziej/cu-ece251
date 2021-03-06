/*
 * factorial.s -- iterative factorial
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

.arch armv8-a

.text
.section .rodata

.Loutput_fmtstr:
	.string "%lu\n"

.Lusage_fmtstr:
	.string	"usage: %s number\n"

.text

.global main
.type   main, %function
main:
	stp	fp, lr, [sp, -16]!
	mov	fp, sp

	// factorial number is argv[1]
	mov	w9, 2
	cmp	w0, w9
	b.lt	.Lmain_err

	// convert argv[1] to an unsigned long
	ldr	x0, [x1, 8]
	mov	x1, 0
	mov	w2, 10
	bl	strtoul

	// print factorial output
	bl	factorial
	mov	x1, x0
	adrp	x0, .Loutput_fmtstr
	add	x0, x0, :lo12:.Loutput_fmtstr
	bl	printf

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


.global factorial
.type   factorial, %function
factorial:
	// 0! == 1
	cmp	x0, 0
	cinc	x0, x0, eq

	// 1! == 1
	cmp	x0, 1
	b.eq	.Lfactorial_ret

	mov	x9, x0

.Lfactorial_loop:
	sub	x9, x9, 1
	mul	x0, x0, x9

	// stopping at 2 avoids a multiplication by 1
	cmp	x9, 2
	b.gt	.Lfactorial_loop

.Lfactorial_ret:
	ret
