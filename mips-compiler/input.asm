j 0x00000008
halt
addi $0,$1,1
jal 0x00000080
and $7,$1,$2
move $8,$7
sw $8,4($0)
lw $9,4($0)
sub $3,$3,$2
sll $2,$2,1
slt $4,$2,$7
beq $1,$4,-2
add $4,$1,$2
halt

ori $5,$4,2048
or $7,$5,$1
jr $31