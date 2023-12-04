.file "rotate_right.s"
.section .rodata                 
.data
.global rotate_right
	.type rotate_right, @function
.text

rotate_right:
    pushq %rbp                  
    movq %rsp, %rbp             
    movb %dil, %dl              # Copy value to %dl
    andb $1, %dl                # Get the least significant bit
    shlb $7, %dl                # Shift it to the most significant position
    shrb $1, %al                # Shift value right by 1 bit
    orb %dl, %al                # Combine the shifted value and the rotated bit
    popq %rbp                   
    ret                         
.size rotate_right, .-rotate_right
