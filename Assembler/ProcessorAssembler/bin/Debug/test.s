	addi $1,$0,1
init:	add $7,$0,$1
loop:	sw $7,0($0)
	lw $2,1($0)
	lw $4,2($0)
	beq $4,$1,addone
	beq $3,$1,init
	j loop
addone:	lw $2,0($0)
	add $7,$7,$6
	sw $7,0($0)
wait:	lw $2,1($0)
	beq $3,$1,wait
	j loop