.file "create_key.s"             
.section .rodata                 
printf_line:                     
.string "enter 4 bit: "          
.global create_key               

create_key:                     
    movq $printf_line, %rdi      # address of string to %rdi
    movq $0, %rax                # C library ABI says %rax should be zero b4 call to printf
    call printf                  # print
    pushq %rbp                   
    movq %rsp, %rbp              
    subq $8, %rsp                # create space for key
    movq $0, %rax                

loop1:
    call getchar                 # get next char
    andq $1, %rax                # bitwise AND with 1
    movq %rax, %rbx              # copy original to %rbx
    salq $4, %rax                # shift left by 4
    orq %rbx, %rax               # bitwise OR the result with the original
    salq $3, %rax                # shift left by 3
    orq %rax, -4(%rbp)           # bitwise OR the result with the key to save 


loop2:
    call getchar                 # get next char
    andq $1, %rax                # bitwise AND with 1
    movq %rax, %rbx              # copy original to %rbx
    salq $4, %rax                # shift left by 4
    orq %rbx, %rax               # bitwise OR the result with the original
    salq $2, %rax                # shift left by 2
    orq %rax, -4(%rbp)           # bitwise OR the result with the key to save 

loop3:
    call getchar                 # get next char
    andq $1, %rax                # bitwise AND with 1
    movq %rax, %rbx              # copy original to %rbx
    salq $4, %rax                # shift left by 4
    orq %rbx, %rax               # bitwise OR the result with the original
    salq $1, %rax                # shift left by 1
    orq %rax, -4(%rbp)           # bitwise OR the result with the key to save 

loop4:
    call getchar                 # get next char
    andq $1, %rax                # bitwise AND with 1
    movq %rax, %rbx              # copy original to %rbx
    salq $4, %rax                # shift left by 4
    orq %rbx, %rax               # bitwise OR the result with the original
    orq %rax, -4(%rbp)           # bitwise OR the result with the key to save 


end:
    movq -4(%rbp), %rax          # move the key to the return register
    addq $8, %rsp                
    popq %rbp                    
    ret                          

.size create_key, .-create_key
