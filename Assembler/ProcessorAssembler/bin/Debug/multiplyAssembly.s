	addi $5,$0,9
	addi $6,$0,9
	addi $1,$0,1
loop:	beq $6,$0,end
	and $2,$6,$1
	beq $2,$0,shift
	add $7,$7,$5
shift:	sll $5,$5,$1
	srl $6,$6,$1
	j loop
end:	sw $7,0($0)
	addi $7,$0,0