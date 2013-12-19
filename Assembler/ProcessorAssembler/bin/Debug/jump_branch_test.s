	beq $0,$0,2
here:	jr $1
	addi $1,$0,4
	j here
	add $2,$0,$1