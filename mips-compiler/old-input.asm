j 0x00000100
addi  $1,$0,8
ori  $2,$0,2
add  $3,$1,$2
sub  $5,$3,$1
and  $4,$3,$2
or  $8,$1,$2
move  $11,$8
jal  0x00000134
slt  $6,$1,$2
slt  $7,$2,$1
sll  $2,$2,2
beq  $1,$2,-2
halt
sw  $11,2($1)
lw  $10,2($1)
jr  $31