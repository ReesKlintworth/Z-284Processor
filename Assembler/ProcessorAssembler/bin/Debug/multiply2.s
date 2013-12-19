	addi $2,$0,1
	addi $1,$0,2
	addi $3,$0,7
	addi $4,$0,5
	bne $1,$2,fuck
	addi $2,$1,3
fuck:	sw $3,0($0)