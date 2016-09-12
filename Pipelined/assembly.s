main:
	li $2, 7			#A=7
	sw $2, 0($0)
	li $2, 5			#B=5
	sw $2, 1($0)
	li $2, 3			#C=3
	sw $2, 2($0)
	li $2, 5			#D=5
	sw $2, 3($0)
	add $2, $0, 3		#dPtr
	sw $2, 4($0)
	li $2, 0x5a5a		#E=0x5a5a
	sw $2, 5($0)
	li $2, 0x6767		#F=0x6767
	sw $2, 6($0)
	li $2, 0x3c			#G=0x3c
	sw $2, 7($0)
	li $2, 0xff			#H=0xff
	sw $2, 8($0)
	lw $3, 1($0)		#B
	nop
	lw $2, 0($0)		#A
	sub $8, $2, $3		#A-B
	slt $2, $8, 4
	bne $0, $2, $L2
	nop
	lw $2, 2($0)		#C
	add $3, $2, 4		#C+4
	sw $3, 2($0)
	sub $3, $2, 3		#C-3
	sw $3, 3($0)
	lw $2, 5($0)		#E
	nop
	lw $3, 6($0)		#F
	or $8, $3, $2		#E|F
	sw $8, 7($0)
	j $L3
	nop
$L2:
	lw $2, 2($0)		#C
	sll $3, $2, 3		#C<<3
	sw $3, 2($0)
	lw $2, 4($0)		#dPtr
	nop
	li $3, 7
	sw $3, 0($2)
	lw $2, 5($0)		#E
	nop
	lw $3, 6($0)		#F
	and $8, $3, $2		#E&F
	sw $8, 7($0)
$L3:
	lw $2, 0($0)		#A
	nop
	lw $3, 1($0)		#B
	add $8, $3, $2		#A+B
	sw $8, 0($0)
	lw $2, 5($0)		#E
	nop
	lw $3, 6($0)		#F
	xor $8, $3, $2		#E^F
	nop
	lw $2, 8($0)		#H
	and $3, $2, $8		#(E^F)&H
	sw $3, 7($0)
