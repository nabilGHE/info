.data
A : .float  4.6
B : .float 5.7

.text
main:
l.s $f0,A
l.s $f1, B

add.s $f2 ,$f0, $f1
mov.s $f12, $f2


li $v0 , 2
syscall

li $v0 ,10

syscall
