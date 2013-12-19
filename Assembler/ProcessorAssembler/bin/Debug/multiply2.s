	addi $1,$0,3
	addi $2,$0,2
start:	addi $7,$0,1
	addi $3,$0,1        
	addi $5,$0,0        
loop:	and $4,$2,$3                
	beq $0,$4,mask
	sll $4,$1,$4                
	add $6,$4,$6
mask:	sll $3,$3,$7                
	add $5,$5,$7                
	add $4,$0,$0
	addi $4,$4,8
	beq $4,$5,end                
	j loop
end:	sw $6,0($0)
	addi $6,$0,0