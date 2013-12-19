lw $1,0($0)
lw $2,0($0)	
addi $7,$0,1
addi $3,$0,1	
addi $5,$0,0	

loop:
	and $4,$2,$3		
	beq $0,$4,mask
	sll $4,$1,$4		
	add $6,$4,$6		
	
mask:
	sll $3,$3,$7		
	add $5,$5,$7		
	sub $4,$4,$4
	addi $4,$4,8			
	beq $8,$5,end		
	j loop

overflow:
	beq 1($0),$0,loop
	sw $0,1($0)
	j mask

end:
	add $4,$0,$4