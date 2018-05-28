min:
    // Put your code here
    movq %RSI, %RAX
    cmpq %RSI, %RDI
    ja in_min
    movq %RDI, %RAX
    retq
in_min:
    retq