main:

	li $2,7 			# load 0x7 to reg 2
	sw $2,0($0)			# store data in reg 2 to sram address (0+0)
	li $2,5 			# load 0x5 to reg 2
	sw $2,1($0)			# store data in reg 2 to sram address (1+0)
	li $2,2 			# load 0x2 to reg 2
	sw $2,2($0)			# store data in reg 2 to sram address (2+0)
	li $2,4 			# load 0x4 to reg 2
	sw $2,3($0)			# store data in reg 2 to sram address (3+0)
	add $2,$0,3         # load address of 3+0 to reg 2
	sw $2,4($0)			# store data in reg 2 to sram address (4+0)

	lw $2,0($0)         # load A(addr 0) to register 2
	lw $3,1($0)			# load B(addr 1) to register 3
	sub $8,$2,$3        # Calculate A(reg 2) - B(reg 3) and load the result to reg 8
	slt $2,$8,4			# compare data in reg8 and 0x4,(a-b and 4) store the result at reg 2
	bne $2,$0,$L2
	nop
	li $2,6 			# load 0x6 to reg 2
	sw $2,2($0)			# store data in reg 2 to sram address (2+0)
	lw $2,3($0)			# load data in sram addr 3 (int D) to reg 2
	sll $3,$2,2			# shift data in reg2 by 2 bits and store to reg3
	sw $3,3($0)			# store data in reg 2 to sram address (3+0)

	j $L3
	nop

$L2:
	lw $2,2($0)			# load C(addr 2+0) to reg2
	sll $3,$2,3         # shift data in reg2 by 3 bits and store to reg3
	sll $2,$3,2			# shift data in reg3 by 2 bits and store to reg2
	sw $2,2($0)			# store data in reg2 to sram addr (2+0)
	lw $2,4($0)			# load the pointer to reg2
	li $3,7				# load 0x7 to reg3
	sw $3,0($2)			# store 0x7 in reg3 to the address location pointed by dPtr

$L3:
	nop
