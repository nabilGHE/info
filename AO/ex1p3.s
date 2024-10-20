.data
CH  : .asciiz "SALEM"

.text
main:

li $v0,4
la  $a0, CH
syscall

li $v0 ,10
syscall

