loop:	lw $1,0($0)
	lw $2,2($0)
	beq $2,$0,start
	j loop
start:	sw $1,0($0)