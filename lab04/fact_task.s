.text              
# start code here
.globl main
main:
    la a0, num     # load address of num into a0
    lw t2,0(a0)    #for comparing with original
    jal factorial  # call factorial function
    la a1, result  # load address of result into a1
    sw a0, 0(a1)   # store result into result variable
    ecall
    j end          # jump to end of program

factorial:
    addi sp, sp, -12   # allocate space on stack for s0,s1 and ra
    sw s0, 0(sp)       # save s0 onto the stack
    sw ra, 4(sp)       #save ra onto stack
    sw s1, 8(sp)       # save s1 onto the stack
fact:
    # check if num is less than or equal to 1
    lw s0, 0(a0)       # load num into s0
    li t0,1            # to compare with s0
    ble s0, t0, if     # jump to base case if num <= 1

    # num > 1, so recursively call factorial function
    mv s1,s0           
    addi s0, s0, -1    # decrement num by 1
    sw s0,0(a0)        #storing num-1 in num
    sw s1,8(sp)        #storing num in s1
    addi sp,sp,-4      #decrementing to make a space for new num
    j fact  # call factorial function with new num
if:
    addi sp,sp,4
    lw s1,8(sp)
    bgt s1,t2, done   # if s1 == num jump to done
    mul s0, s0, s1    # multiply s0 with s1
    j if
done:
    mv a0,s0
    jr ra             # return to caller

end:
    lw s1, 8(sp)      #restore s1 from stack
    lw ra, 4(sp)      # restore ra from stack
    lw s0, 0(sp)      # restore s0 from stack
    addi sp, sp, 12   # deallocate stack space
 
# end code here

write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 

# start data section here
num: .word 5      # initialize num to 5
result: .word 0   # initialize result to 0
# end data section here

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 
