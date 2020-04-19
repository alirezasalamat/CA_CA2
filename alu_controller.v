module alu_controller(alu_op , func , alu_operation);
    input [1:0] alu_op;
    input [5:0] func;
    output reg [2:0] alu_operation;

    parameter MTYPE = 2'b00; // Memorey accses
    parameter BTYPE = 2'b01; // Branch
    parameter RTYPE = 2'b10; // Register

    parameter ADD = 6'b100000;
    parameter SUb = 6'b100010;
    parameter AND = 6'b100100;
    parameter OR = 6'b100101;
    parameter SLT = 6'b101010;

    always @(alu_op or func)begin
        case(alu_op)
            MTYPE: begin
                alu_operation = `ADD;
            end

            BTYPE: begin
                alu_operation = `SUB;
            end

            RTYPE: begin
                case(func)
                    ADD: begin
                        alu_operation = `ADD;
                    end

                    SUB: begin
                        alu_operation = `SUB;
                    end

                    AND: begin 
                        alu_operation = `AND;
                    end

                    OR: begin
                        alu_operation = `OR;
                    end

                    SLT: begin
                        alu_operation = `SLT;
                    end

                    default : break // it is for jr instruct because jr opcode is 0000000 and func is 001000
                endcase
            end
        endcase

endmodule