lw $1,0($0)		;; get the first input
;; prepare the board for a second input
lw $2,0($0)		;; get the second input


addi $7,$0,1	;; move 1 into $7 --> $7 is the shifting register (always 1)
addi $3,$0,1	;; move 1 into $3 --> $3 is the masking register
addi $5,$0,0	;; move 1 into $5 --> $5 is the index register

loop:

	and $4,$2,$3		;; get the ith bit of the second number and store into $4 --> temp value register
	beq $0,$4,mask		;; skip to 'mask' if the ith bit of the second number isnt 1

	sll $4,$1,$4		;; shift the first number left by the masked number and store into $4
	add $6,$4,$6		;; store running total into $6 --> register to return
	
mask:

	sll $3,$3,$7		;; shift the mask down for the next bit

	add $5,$5,$7		;; iterate register index

	sub $4,$4,$4		;; put 0 in register $4
	addi $4,$4,8		;; add 8 in register $4

	beq $8,$5,end		;; jumps to the end of the program
	j loop


overflow:
	beq 1($0),$0,loop
	sw $0,1($0)
	j mask

end:
	add $4,$0,$4		;; does nothing important, just at the need something at the end