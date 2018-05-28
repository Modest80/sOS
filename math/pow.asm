pow:
    // Написать функцию pow, которая принимает на вход два беззнаковых 
	// числа x и p (в регистрах RDI и RSI соответственно) и возвращает 
	// значение x в степени p в регистре RAX. Гарантируется, что x и p 
	// не могут быть равны 0 одновременно (по отдельности они все еще 
	// могут быть равны 0). Также гарантируется, что ответ помещается 
	// в 64 бита.
	
	// RDI - x
	// RSI - p
	
    cmpq $0, %RDI
    jz to_null
    
    cmpq $0, %RSI
    jz to_one

    movq   $0, %RBX
    movq   $1, %RAX
    movq %RDI, %RCX		// Число

mult:
    mulq %RCX
    incq %RBX
	cmpq %RBX, %RSI
    jz result
	jmp mult

to_one:
    movq   $1, %RAX
    jmp result

to_null:
    movq   $0, %RAX
result:
    ret