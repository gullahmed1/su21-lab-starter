.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    add t0,x0,a0 #t0=n
    addi t1,x0,1 #k=1
    addi t2,x0,0 #i=0
for:
    ble t2,t0,if #i<=n
    j done
if:
    ble t0,x0,done
    mul t1,t1,t0
    addi t0,t0,-1
    j for
done:
    add a0,t1,x0
    jr ra 