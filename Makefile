gcc_Copt = -ansi -pedantic -g -Wimplicit-function-declaration -Wreturn-type -Wformat -c
gcc_Sopt = -lc -m64 -c -g
all: lab6.zip bit_decode

lab6.zip: Makefile bit_decode.c create_key.s rotate_left.s rotate_right.s lab6Readme
	zip lab6.zip Makefile bit_decode.c create_key.s rotate_left.s rotate_right.s lab6Readme 

bit_decode: bit_decode.o create_key.o rotate_right.o rotate_left.o
	gcc bit_decode.o -o bit_decode create_key.o rotate_right.o rotate_left.o

bit_decode.o: bit_decode.c
	gcc $(gcc_Copt) bit_decode.c

create_key.o: create_key.s
	gcc $(gcc_Sopt) create_key.s 

rotate_left.o: rotate_left.s
	gcc $(gcc_Sopt) rotate_left.s

rotate_right.o: rotate_right.s
	gcc $(gcc_Sopt) rotate_right.s

clean:
	rm -rf *.o bit_decode lab6.zip
