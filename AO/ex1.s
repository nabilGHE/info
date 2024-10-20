.data
A : .word 6
B : .word 8


.text

main:
lw $t0,A
lw $t1, B

add $t2 ,$t0, $t1
move $a0, $t2

li $v0 ,1

syscall



li $v0 ,10

syscall
