#Emilio Volpe
#CSE 3666 FALL 2015
#Interest Programming Assignment #2

.data
principal: .asciiz"Enter the principal: "
interest: .asciiz"Enter the interest rate: "
time: .asciiz"Enter the amount of time: "
balance: .asciiz"The ending balance is "
dot: .asciiz"."
.text

main:

#principal Input
li $v0, 4					# Put 4 into $v0 as the parameter for syscall
la $a0, principal			# Address of principal
syscall						# Print Principal

li $v0, 5					# Put 5 into $v0 for syscall to read integer from console
syscall						# Read integer from console and store in $v0
move $s0, $v0				# Copy a from the console to $s0

#interest Input
li $v0, 4					# Put 4 into $v0 as the parameter for syscall
la $a0, interest			# Address of principal
syscall						# Print Interest

li $v0, 5					# Put 5 into $v0 for syscall to read integer from console
syscall						# Read integer from console and store in $v0
move $s1, $v0				# Copy a from the console to $s1

#time Input
li $v0, 4					# Put 4 into $v0 as the parameter for syscall
la $a0, time				# Address of principal
syscall						# Print time

li $v0, 5					# Put 5 into $v0 for syscall to read integer from console
syscall						# Read integer from console and store in $v0
move $s2, $v0				# Copy a from the console to $s2

#Arithmetic
add $t0, $s1, 100           # $t0 = 100 + interest
move $t3, $s0               # Put Balance into $t3
move $t1, $s2				#Put the time into $t0 for number of for loop iterations
li $t2, 0                   #$t2 is the counter (i)
li $t5, 100                 # Penny --> dollar converter

loop:						#Begin Loop
beq $t2, $t1, endloop       #if $t1 == time, end
mul $t3, $t3, $t0           #$t3 = $t3 * $t0 --> balance = balance * interest
addi $t2, $t2, 1            #$t2 = $t2 + 1
div $t3, $t5                #Convert from pennies to dollars: balance/100
mflo $t3
mfhi $s3
	j       loop			#jump to top of loop
endloop:					#End Loop

li $v0, 4                   # Loads Print input into $v0
la $a0, balance				# Load Prints balance string to address
syscall						# Print balance string

li $v0, 1 					# Loads print integer to syscall parameter
move $a0, $t3				# Address of balance
syscall						# Put Balance into Console

li $v0, 4                   # Print input into $v0
la $a0, dot                 # Print dot to console
syscall						# Print dot to console

li $v0, 1                   # Load print Integer Parameter
move $a0, $s3				# Print Cents
syscall						# Prints cents to console

li $v0, 10					# Quit Program
syscall






