.data 
A: .word 86
B: .float 45.2
msg1: .asciiz "somme de A et B :"
msg2: .asciiz "\nsoustraction A et B :"

.text
main:
    lw $t0, A
    mtc1 $t0, $f4
    l.s $f0, B

    add.s $f2, $f4, $f0

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 2
    mov.s $f12, $f2
    syscall

    sub.s $f3, $f4, $f0

    li $v0, 4
    la $a0, msg2
    syscall
	

    li $v0, 2
    mov.s $f12, $f3
    syscall

    li $v0, 10
    syscall
