foo.o: foo.c
	gcc foo.c -c

foo.bin: foo.o main.c
	gcc foo.o main.c -o foo.bin

clean:
	rm -f *.bin *.o
