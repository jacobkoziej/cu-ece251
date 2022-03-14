/*
 * factorial.s -- recursive factorial
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

.Lusage_fmtsrt:
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
	adrp	x1, .Lusage_fmtsrt
	add	x1, x1, :lo12:.Lusage_fmtsrt
	bl	fprintf

	ldp	fp, lr, [sp], 16
	mov	w0, 1
	ret
