module CPUTop(cpuout, hex, IMR, R1RD, R2RD, clk, rst, pcreset);
	output [31:0] cpuout;
	output [6:0] hex[3:0];
	output IMR;
	output [31:0] R1RD, R2RD;
	input clk, rst, pcreset;
	
	reg [25:0] tbase;
	reg [31:0] instMemDatain;
	reg [6:0] addrin;
	reg [6:0] state;
	reg instMuxSel, IMR, pcrst;
	
	wire[15:0] numout;
	
	always @(posedge clk)
		tbase=tbase+1;
	
	CPU mycpu(cpuout, numout, R1RD, R2RD, instMemDatain, addrin, instMuxSel, IMR, pcrst, tbase[23]);
	disp mydisp(hex, numout);
	
	always @(posedge tbase[23] or negedge rst or negedge pcreset) begin
		if(~rst) begin
			state=0;
			addrin=0;
			instMemDatain=0;
			pcrst=0;
			instMuxSel=0;
			IMR=1;
		end
		else if(~pcreset) begin
			pcrst=0;
		end
		else begin
			case(state)
				// initialize
				0: begin
					pcrst=0;
					instMuxSel=0;
					IMR=1;
					state=1;
				end
				
				// line 0
				1: begin
					addrin=0;
					instMemDatain=32'b11000000100000010000000000000111;
					state=2;
				end
				
				2: begin
					IMR=0;
					state=3;
				end
				
				3: begin
					IMR=1;
					state=4;
				end
				
				// line 1
				4: begin
					addrin=1;
					instMemDatain=32'b10100000100000010000000000000000;
					state=5;
				end
				
				5: begin
					IMR=0;
					state=6;
				end
				
				6: begin
					IMR=1;
					state=7;
				end
				
				// line 2
				7: begin
					addrin=2;
					instMemDatain=32'b11000000100000010000000000000101;
					state=8;
				end
				
				8: begin
					IMR=0;
					state=9;
				end
				
				9: begin
					IMR=1;
					state=10;
				end
				
				// line 3
				10: begin
					addrin=3;
					instMemDatain=32'b10100000100000010000000000000001;
					state=11;
				end
				
				11: begin
					IMR=0;
					state=12;
				end
				
				12: begin
					IMR=1;
					state=13;
				end
				
				// line 4
				13: begin
					addrin=4;
					instMemDatain=32'b11000000100000010000000000000010;
					state=14;
				end
				
				14: begin
					IMR=0;
					state=15;
				end
				
				15: begin
					IMR=1;
					state=16;
				end
				
				// line 5
				16: begin
					addrin=5;
					instMemDatain=32'b10100000100000010000000000000010;
					state=17;
				end
				
				17: begin
					IMR=0;
					state=18;
				end
				
				18: begin
					IMR=1;
					state=19;
				end
				
				// line 6
				19: begin
					addrin=6;
					instMemDatain=32'b11000000100000010000000000000100;
					state=20;
				end
				
				20: begin
					IMR=0;
					state=21;
				end
				
				21: begin
					IMR=1;
					state=22;
				end
				
				// line 7
				22: begin
					addrin=7;
					instMemDatain=32'b10100000100000010000000000000011;
					state=23;
				end
				
				23: begin
					IMR=0;
					state=24;
				end
				
				24: begin
					IMR=1;
					state=25;
				end
				
				// line 8
				25: begin
					addrin=8;
					instMemDatain=32'b00010000100000010000000000000011;
					state=26;
				end
				
				26: begin
					IMR=0;
					state=27;
				end
				
				27: begin
					IMR=1;
					state=28;
				end
				
				// line 9
				28: begin
					addrin=9;
					instMemDatain=32'b10100000100000010000000000000100;
					state=29;
				end
				
				29: begin
					IMR=0;
					state=30;
				end
				
				30: begin
					IMR=1;
					state=31;
				end
				
				// line 10
				31: begin
					addrin=10;
					instMemDatain=32'b10110000100000010000000000000000;
					state=32;
				end
				
				32: begin
					IMR=0;
					state=33;
				end
				
				33: begin
					IMR=1;
					state=34;
				end
				
				// line 11
				34: begin
					addrin=11;
					instMemDatain=32'b10110000110000010000000000000001;
					state=35;
				end
				
				35: begin
					IMR=0;
					state=36;
				end
				
				36: begin
					IMR=1;
					state=37;
				end
				
				// line 12
				37: begin
					addrin=12;
					instMemDatain=32'b00100010000001000000000000000011;
					state=38;
				end
				
				38: begin
					IMR=0;
					state=39;
				end
				
				39: begin
					IMR=1;
					state=40;
				end
				
				// line 13
				40: begin
					addrin=13;
					instMemDatain=32'b01100000100100010000000000000100;
					state=41;
				end
				
				41: begin
					IMR=0;
					state=42;
				end
				
				42: begin
					IMR=1;
					state=43;
				end
				
				// line 14
				43: begin
					addrin=14;
					instMemDatain=32'b11010000100000010000000000010111;
					state=44;
				end
				
				44: begin
					IMR=0;
					state=45;
				end
				
				45: begin
					IMR=1;
					state=46;
				end
				
				// line 15
				46: begin
					addrin=15;
					instMemDatain=32'b00000000000000000000000000000000;
					state=47;
				end
				
				47: begin
					IMR=0;
					state=48;
				end
				
				48: begin
					IMR=1;
					state=49;
				end
				
				// line 16
				49: begin
					addrin=16;
					instMemDatain=32'b11000000100000010000000000000110;
					state=50;
				end
				
				50: begin
					IMR=0;
					state=51;
				end
				
				51: begin
					IMR=1;
					state=52;
				end
				
				// line 17
				52: begin
					addrin=17;
					instMemDatain=32'b10100000100000010000000000000010;
					state=53;
				end
				
				53: begin
					IMR=0;
					state=54;
				end
				
				54: begin
					IMR=1;
					state=55;
				end
				
				// line 18
				55: begin
					addrin=18;
					instMemDatain=32'b10110000100000010000000000000011;
					state=56;
				end
				
				56: begin
					IMR=0;
					state=57;
				end
				
				57: begin
					IMR=1;
					state=58;
				end
				
				// line 19
				58: begin
					addrin=19;
					instMemDatain=32'b01110000110001010000000000000010;
					state=59;
				end
				
				59: begin
					IMR=0;
					state=60;
				end
				
				60: begin
					IMR=1;
					state=61;
				end
				
				// line 20
				61: begin
					addrin=20;
					instMemDatain=32'b10100000110000010000000000000011;
					state=62;
				end
				
				62: begin
					IMR=0;
					state=63;
				end
				
				63: begin
					IMR=1;
					state=64;
				end
				
				// line 21
				64: begin
					addrin=21;
					instMemDatain=32'b10000000000000010000000000011111;
					state=65;
				end
				
				65: begin
					IMR=0;
					state=66;
				end
				
				66: begin
					IMR=1;
					state=67;
				end
				
				// line 22
				67: begin
					addrin=22;
					instMemDatain=32'b00000000000000000000000000000000;
					state=68;
				end
				
				68: begin
					IMR=0;
					state=69;
				end
				
				69: begin
					IMR=1;
					state=70;
				end
				
				// line 23
				70: begin
					addrin=23;
					instMemDatain=32'b10110000100000010000000000000010;
					state=71;
				end
				
				71: begin
					IMR=0;
					state=72;
				end
				
				72: begin
					IMR=1;
					state=73;
				end
				
				// line 24
				73: begin
					addrin=24;
					instMemDatain=32'b01110000110001010000000000000011;
					state=74;
				end
				
				74: begin
					IMR=0;
					state=75;
				end
				
				75: begin
					IMR=1;
					state=76;
				end
				
				// line 25
				76: begin
					addrin=25;
					instMemDatain=32'b01110000100001110000000000000010;
					state=77;
				end
				
				77: begin
					IMR=0;
					state=78;
				end
				
				78: begin
					IMR=1;
					state=79;
				end
				
				// line 26
				79: begin
					addrin=26;
					instMemDatain=32'b10100000100000010000000000000010;
					state=80;
				end
				
				80: begin
					IMR=0;
					state=81;
				end
				
				81: begin
					IMR=1;
					state=82;
				end
				
				// line 27
				82: begin
					addrin=27;
					instMemDatain=32'b10110000100000010000000000000100;
					state=83;
				end
				
				83: begin
					IMR=0;
					state=84;
				end
				
				84: begin
					IMR=1;
					state=85;
				end
				
				// line 28
				85: begin
					addrin=28;
					instMemDatain=32'b11000000110000010000000000000111;
					state=86;
				end
				
				86: begin
					IMR=0;
					state=87;
				end
				
				87: begin
					IMR=1;
					state=88;
				end
				
				// line 29
				88: begin
					addrin=29;
					instMemDatain=32'b10100000110001010000000000000000;
					state=89;
				end
				
				89: begin
					IMR=0;
					state=90;
				end
				
				90: begin
					IMR=1;
					state=91;
				end
				
				// line 30
				91: begin
					addrin=30;
					instMemDatain=32'b00000000000000000000000000000000;
					state=92;
				end
				
				92: begin
					IMR=0;
					state=93;
				end
				
				93: begin
					IMR=1;
					state=94;
				end
				
				// RUN
				94: begin
					instMuxSel=1;
					pcrst=1;
				end
				
			endcase
		end
	end
	
endmodule

module CPU(cpuout, numout, R1RD, R2RD, instMemDatain, addrin, instMuxSel, IMR, pcrst, clk);
	output [31:0] cpuout;
	output [15:0] numout, R1RD, R2RD;
	input clk, pcrst, IMR, instMuxSel;
	input [31:0] instMemDatain;
	input [6:0] addrin;
	
	wire [2:0] ALUFS;
	wire [4:0] R1RS, R2RS, WRS, WRS2Buf1, WRS2Buf2;
	wire [6:0] IMA, pcInAddr, instMuxout, incout, jbMuxout;
	wire [31:0] instMemDataout, instMem2Buf, R1RD2Mux, R1RD2Buf, R2RD2Buf, RFWD;
	wire [15:0] aluResult, aluin1, aluin2, R1RD, R2RD, sramDataout, constBufout, dataout2Buf;
	wire instMuxSel, jbMuxSel, branchMuxSel, datainMuxSel, reg2ALUMux1Sel, reg2ALUMux2Sel, rnw;
	wire zero, overflow, carryout, negative, dataoutMuxSel;
	
	// output
	assign cpuout=IMA;
	assign numout=RFWD[15:0];
	
	// modules
	// Data Mem
	assign RFWD[31:16]=16'b0;
	RegisterFile myregfile(R1RD2Mux, R2RD2Buf, R1RS, R2RS, WRS, RFWD, clk);
	SRAM mysram(sramDataout, R1RD[15:0], aluResult, rnw);
	
	// Compute
	mux2_1 reg2ALUMux1[15:0](aluin1, R1RD[15:0], R2RD[15:0], reg2ALUMux1Sel);
	mux2_1 reg2ALUMux2[15:0](aluin2, R2RD[15:0], constBufout, reg2ALUMux2Sel);
	ALU myalu(aluResult, zero, overflow, carryout, negative, aluin1, aluin2, ALUFS);
	mux2_1 dataoutMux[15:0](dataout2Buf, sramDataout, aluResult, dataoutMuxSel);
	
	// Control
	PC mypc(IMA, pcInAddr, clk, pcrst);
	mux2_1 instMux[6:0](instMuxout, addrin, IMA, instMuxSel);
	instructionMem myinstmem(instMem2Buf, instMemDatain, instMuxout, IMR);
	Increment myinc(incout, IMA);
	mux2_1 jbMux[6:0](jbMuxout, instMemDataout[6:0], aluResult[6:0], jbMuxSel);
	mux2_1 branchMux[6:0](pcInAddr, incout, jbMuxout, branchMuxSel);
	instDecoder mydecoder(rnw, reg2ALUMux1Sel, reg2ALUMux2Sel, ALUFS, dataoutMuxSel, jbMuxSel, branchMuxSel, datainMuxSel,
						instMemDataout[31:28], instMemDataout[16], zero, clk);
	mux2_1 datainMux1[4:0](WRS2Buf1, 5'b0, instMemDataout[26:22], datainMuxSel);
	mux2_1 datainMux2[4:0](R1RS, instMemDataout[26:22], instMemDataout[21:17], datainMuxSel);
	mux2_1 datainMux3[4:0](R2RS, instMemDataout[21:17], instMemDataout[4:0], datainMuxSel);
	
	
	mux2_1 fbMux[15:0](R1RD2Buf, dataout2Buf, R1RD2Mux, fbMuxSel);
	// Bufs
	reg32 instBuf(instMemDataout, , instMem2Buf, clk, pcrst);
	reg16 reg2ALUBuf1(R1RD, , R1RD2Buf, clk, pcrst);
	reg16 reg2ALUBuf2(R2RD, , R2RD2Buf, clk, pcrst);
	reg16 constBuf(constBufout, , instMemDataout[15:0], clk, pcrst);
	reg16 dataoutBuf(RFWD[15:0], , dataout2Buf, clk, pcrst);
	//////////////////////////////////
	reg16 ctrlBuf(q, , D, clk, pcrst);
	//////////////////////////////////
	reg5 WRSBuf1(WRS2Buf2, , WRS2Buf1, clk, pcrst);
	reg5 WRSBuf2(WRS, , WRS2Buf2, clk, pcrst);
	
	// flags buf
	DFlipFlop zeroBuf(zeroBufout, zeroBufoutBar, zero, clk, pcrst);
	DFlipFlop ofBuf(ofBufout, ofBufoutBar, overflow, clk, pcrst);
	DFlipFlop coBuf(coBufout, coBufoutBar, carryout, clk, pcrst);
	DFlipFlop negBuf(negBufout, negBufoutBar, negative, clk, pcrst);

endmodule

module instructionMem(dataout, datain, addr, IMR);
	output [31:0] dataout;
	input [31:0] datain;
	input [6:0] addr;
	input IMR;
	reg [31:0] mem [127:0];
	
	assign dataout=IMR? mem[addr]: 32'hzzzzzzzz;
	
	always
		if(~IMR)
			mem[addr]=datain;
endmodule

module PC(IMA, addr, clk, rst);
	output [6:0] IMA;
	input [6:0] addr;
	input clk, rst;
	
	wire [6:0] qBar;
	
	DFlipFlop dffs[6:0](IMA, qBar, addr, clk, rst);
endmodule

module Increment(out, in);
	output [6:0] out;
	input [6:0] in;
	
	wire [6:0] C;
	wire G;
	
	parameter GND=0;
	
	assign out=in^C^7'b1;
	
	assign G=in[0];
	
	assign C[0]=GND;
	assign C[1]=G;
	assign C[2]=G & in[1];
	assign C[3]=G & in[1] & in[2];
	assign C[4]=G & in[1] & in[2] & in[3];
	assign C[5]=G & in[1] & in[2] & in[3] & in[4];
	assign C[6]=G & in[1] & in[2] & in[3] & in[4] & in[5];
endmodule

module instDecoder(rnw, reg2ALUMux1Sel, reg2ALUMux2Sel, ALUFS, dataoutMuxSel, jbMuxSel,
							branchMuxSel, datainMuxSel, opcode, constbit, zero, clk);

	output rnw, reg2ALUMux1Sel, reg2ALUMux2Sel, dataoutMuxSel, jbMuxSel;
	output branchMuxSel, datainMuxSel;
	output [2:0] ALUFS;
	input [3:0] opcode;
	input constbit, zero, clk;
	
	assign rnw=clk | ~(opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0]);
	assign reg2ALUMux1Sel=opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
	
	assign reg2ALUMux2Sel=(~opcode[3] & constbit) | (opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) |
									(opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0]) | (opcode[3] & ~opcode[2] & opcode[1] & opcode[0]) |
									(opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0]);
									
	assign ALUFS=(~opcode[3] | (opcode[3] & opcode[2] & ~opcode[1] & opcode[0]))? opcode[2:0]: 4'b0001;
	assign dataoutMuxSel= ~(opcode[3] & ~opcode[2] & opcode[1] & opcode[0]);
	assign jbMuxSel=opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0];
	
	assign branchMuxSel=(opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) | (opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0]) |
								(opcode[3] & opcode[2] & ~opcode[1] & opcode[0] & ~zero);
	
	assign datainMuxSel=(opcode[2] & ~opcode[1] & ~opcode[0]) | (~opcode[3] & opcode[2]) | (~opcode[3] & opcode[0]) |
								(~opcode[3] & opcode[1]) | (~opcode[2] & opcode[1] & opcode[0]);
	
endmodule

//////////////register file/////////////////

module RegisterFile(R1RD, R2RD, R1RS, R2RS, WRS, WD, WE);
	output [31:0] R1RD, R2RD;
	input [4:0] R1RS, R2RS, WRS;
	input [31:0] WD;
	input WE;
	
	wire [31:0] decoder_out, regclk;
	wire [31:0]q[31:0];
	wire [31:0]qBar[31:0];
	
	parameter regrst=32'hFFFFFFFF;
	
	// write
	decoder5_32 mydecoder(decoder_out, WRS);
	and andn[31:0](regclk, decoder_out, WE);
	reg32 myreg[31:0](q, qBar, WD, regclk, regrst);
	
	// read
	mux1024_32 mux1(R1RD, q, R1RS, WE);
	mux1024_32 mux2(R2RD, q, R2RS, WE);
	
endmodule

module decoder5_32(out, in);
	output [31:0] out;
	input [4:0] in;
	assign out=31'b1<<in;
endmodule

module mux1024_32(out, in, sel, rst);
	output [31:0] out;
	input [31:0] in [31:0];
	input [4:0] sel;
	input rst;
	assign out=(!rst)? ((sel==0)? 32'h0: in[sel]):32'hzzzzzzzz;
endmodule

module reg32(q, qBar, D, clk, rst);
	input [31:0] D;
	input clk, rst;
	output [31:0] q, qBar;
	DFlipFlop mydff[31:0](q, qBar, D, clk, rst);
endmodule

module reg16(q, qBar, D, clk, rst);
	input [15:0] D;
	input clk, rst;
	output [15:0] q, qBar;
	DFlipFlop mydff[15:0](q, qBar, D, clk, rst);
endmodule

module reg5(q, qBar, D, clk, rst);
	input [4:0] D;
	input clk, rst;
	output [4:0] q, qBar;
	DFlipFlop mydff[4:0](q, qBar, D, clk, rst);
endmodule

module mux2_1(out, in0, in1, sel);
	output out;
	input in0, in1, sel;
	assign out=sel? in1: in0;
endmodule

module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
	always@ (negedge rst or posedge clk)
	begin
		if(!rst)
			q = 0;
		else
			q = D;
	end
endmodule

////////////////////////////////////////////////////////

module SRAM(dataout, datain, addr, IMR);
	output [15:0] dataout;
	input [15:0] datain;
	input [7:0] addr;
	input IMR;
	reg [15:0] mem [255:0];
	
	assign dataout=IMR? mem[addr]: 16'hzzzz;
	
	always
		if(~IMR)
			mem[addr]=datain;
endmodule

module ALU(result, zero, overflow, carryout, negative, busa, busb, control);
	output [15:0] result;
	output zero, overflow, carryout, negative;
	input [15:0] busa, busb;
	input [2:0] control;
	wire[15:0] tempres [7:0];
	
///////////////////////////////////add & subtraction/////////////////
	wire[15:0] newbusb;
	wire[15:0] calculation;
	
	assign newbusb = control[1]? ~busb : busb;
	
	assign tempres[0] = tempres[control];
	assign tempres[1] = calculation;
	assign tempres[2] = calculation;
	AdderSubtractor addsub(calculation,CO,busa,newbusb,control[1]);
	
////////////////////////////////////and or xor lst//////////////////////////////////////////////
	assign tempres[3]=busa & busb;
	assign tempres[4]=busa | busb;
	assign tempres[5]=busa ^ busb;
	func_slt funcslt(tempres[6],busa[15],busb[15],calculation[15]);
	Shifter shif(tempres[7], busa, busb);

//////////////////////////////////////////////////////////////////	
	
	assign result = tempres[control];
	
/////////////////////four flags///////////////////////////
	assign zero=(result==0)? 1: 0;
	assign negative = result[15];
	assign overflow_a = (~busa[15] & ~busb[15] & calculation[15]) | (busa[15] & busb[15] & ~calculation[15]);
	assign overflow_s = (~busa[15] & busb[15] & calculation[15]) | (busa[15] & ~busb[15] & ~calculation[15]);
	assign overflow = (control==2)? overflow_s: ((control==1)? overflow_a: overflow);
	assign carryout = (control==1 | control==2)? CO: carryout;

//////////////////////////////////////////////////////

endmodule

module AdderSubtractor(out, CO, A, B, CI);
	output [15:0] out;
	output CO;
	input [15:0] A, B;
	input CI;
	
	wire [15:0] C, P, G;
	
	assign out=A^B^C;
	
	assign G=A & B;
	assign P=A | B;
	
	assign C[0]=CI;
	assign C[1]=G[0] | (C[0] & P[0]);
	assign C[2]=G[1] | (G[0] & P[1]) | (C[0] & P[0] & P[1]);
	assign C[3]=G[2] | (G[1] & P[2]) | (G[0] & P[1] & P[2]) | (C[0] & P[0] & P[1] & P[2]);
	assign C[4]=G[3] | (G[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (C[0] & P[0] & P[1] & P[2] & P[3]);
	assign C[5]=G[4] | (G[3] & P[4]) | (G[2] & P[3] & P[4]) | (G[1] & P[2] & P[3] & P[4]) | (G[0] & P[1] & P[2] & P[3] & P[4]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4]);
	assign C[6]=G[5] | (G[4] & P[5]) | (G[3] & P[4] & P[5]) | (G[2] & P[3] & P[4] & P[5]) | (G[1] & P[2] & P[3] & P[4] & P[5]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5]);
	assign C[7]=G[6] | (G[5] & P[6]) | (G[4] & P[5] & P[6]) | (G[3] & P[4] & P[5] & P[6]) | (G[2] & P[3] & P[4] & P[5] & P[6]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6]);
	assign C[8]=G[7] | (G[6] & P[7]) | (G[5] & P[6] & P[7]) | (G[4] & P[5] & P[6] & P[7]) | (G[3] & P[4] & P[5] & P[6] & P[7]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7]);
	assign C[9]=G[8] | (G[7] & P[8]) | (G[6] & P[7] & P[8]) | (G[5] & P[6] & P[7] & P[8]) | (G[4] & P[5] & P[6] & P[7] & P[8]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8]);
	assign C[10]=G[9] | (G[8] & P[9]) | (G[7] & P[8] & P[9]) | (G[6] & P[7] & P[8] & P[9]) | (G[5] & P[6] & P[7] & P[8] & P[9]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9]) | 	(G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9]);
	assign C[11]=G[10] | (G[9] & P[10]) | (G[8] & P[9] & P[10]) | (G[7] & P[8] & P[9] & P[10]) | (G[6] & P[7] & P[8] & P[9] & P[10]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10]);
	assign C[12]=G[11] | (G[10] & P[11]) | (G[9] & P[10] & P[11]) | (G[8] & P[9] & P[10] & P[11]) | (G[7] & P[8] & P[9] & P[10] & P[11]) | (G[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11]);
	assign C[13]=G[12] | (G[11] & P[12]) | (G[10] & P[11] & P[12]) | (G[9] & P[10] & P[11] & P[12]) | (G[8] & P[9] & P[10] & P[11] & P[12]) | (G[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12]);
	assign C[14]=G[13] | (G[12] & P[13]) | (G[11] & P[12] & P[13]) | (G[10] & P[11] & P[12] & P[13]) | (G[9] & P[10] & P[11] & P[12] & P[13]) | (G[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13]);
	assign C[15]=G[14] | (G[13] & P[14]) | (G[12] & P[13] & P[14]) | (G[11] & P[12] & P[13] & P[14]) | (G[10] & P[11] & P[12] & P[13] & P[14]) | (G[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14]);
	assign CO=G[15] | (G[14] & P[15]) | (G[13] & P[14] & P[15]) | (G[12] & P[13] & P[14] & P[15]) | (G[11] & P[12] & P[13] & P[14] & P[15]) | (G[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (G[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]) | (C[0] & P[0] & P[1] & P[2] & P[3] & P[4] & P[5] & P[6] & P[7] & P[8] & P[9] & P[10] & P[11] & P[12] & P[13] & P[14] & P[15]);
	
endmodule

module func_slt (out,num1,num2,calculation);
	output out;
	input num1,num2;
	input calculation;
	
	wire situation1 = num1 & ~num2; // busa is negative and busb is positive
	wire situation2 = num1 & num2 & calculation; //except for situation 1, two negative numbers and the subtraction result is still negative
	wire situation3 = ~num1 & ~num2 & calculation; //except for situation 1, two positive numbers and the result is negative
	
	assign out = (situation1 | situation2 | situation3)? 1: 0;
endmodule

module Shifter(out, in, sel);
	output [15:0] out;
	input [15:0] in;
	input [1:0] sel;
	
	wire [15:0] out_L1, in_L1, in_L2;
	
	parameter GND=0;
	
	assign in_L1[0]=GND;
	assign in_L1[15:1]=in[14:0];
	
	assign in_L2[1:0]=GND;
	assign in_L2[15:2]=out_L1[13:0];
	
	// first level
	assign out_L1=sel[0]? in_L1: in;
	
	// second level
	assign out=sel[1]? in_L2: out_L1;
	
endmodule

module disp(hex, num);
	output[6:0] hex[3:0];
	input[15:0] num;
	integer i;
	reg[6:0] hex[3:0];
	reg[15:0] rax;
	
	initial begin
		rax=0;
		hex[0]=7'b0;
		hex[1]=7'b0;
		hex[2]=7'b0;
		hex[3]=7'b0;
	end
	
	always begin
		rax=num;
		for (i=0; i<4; i=i+1)begin
			case(rax & 'hF)
				0: hex[i]=7'b1000000;
				1: hex[i]=7'b1111001;
				2: hex[i]=7'b0100100;
				3: hex[i]=7'b0110000;
				4: hex[i]=7'b0011001;
				5: hex[i]=7'b0010010;
				6: hex[i]=7'b0000010;
				7: hex[i]=7'b1111000;
				8: hex[i]=7'b0000000;
				9: hex[i]=7'b0010000;
				10: hex[i]=7'b0001000;
				11: hex[i]=7'b0000011;
				12: hex[i]=7'b1000110;
				13: hex[i]=7'b0100001;
				14: hex[i]=7'b0000110;
				15: hex[i]=7'b0001110;
			endcase
			rax=rax>>4;
		end
		
	end
	
endmodule
