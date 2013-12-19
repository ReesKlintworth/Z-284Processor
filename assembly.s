	;; get the first input
	lw $1,0($0)

	;; prepare the board for a second input

	;; get the second input
	lw $2,0($0)

	;; move 1 into $7 --> $7 is the shifting register
	addi $7,$0,1;

	;; move 1 into $3 --> $3 is the masking register
	addi $3,$0,1;

	;; begin loop

		;; get the ith bit of the second number and store into $4 --> temp value register
		and $4,$2,$3

		;; shift the first number left by the masked number and store into $4
		sll $4,$1,$4

		;; store running total into $6 --> register to return
		add $6,$4,$6

		;; shift the mask down for the next bit
		sll $3,$3,$7

	;; end loop

	;; if overflow occurs, have an output pin mapped to board (decimal point)
	;; have or-er on board that keeps overflow bit and outputs to pin
	;; this needs to happen in the loop, and if set to 1, persist
	sw $5,1($0)
