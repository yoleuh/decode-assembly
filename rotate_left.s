.file "rotate_left.s"
.section .rodata                 
.data
.global rotate_left
        .type rotate_left, @function
.text

rotate_left:
    pushq %rbp                  
    movq %rsp, %rbp             
    movb %dil, %dl              # Copy value to %dl
    andb $0x80, %dl             # Get the most significant bit
    shrb $7, %dl                # Shift it to the least significant position
    shlb $1, %al                # Shift value left by 1 bit
    orb %dl, %al                # Combine the shifted value and the rotated bit
    popq %rbp                   
    ret                         
.size rotate_left, .-rotate_left
