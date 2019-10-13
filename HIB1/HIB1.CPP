#include <stdio.h>

int main() {
    int a,b,r;

    printf("Executing...\n");
    printf("Insert an Integer value for (a): ");
    scanf("%d",&a);
    printf("Insert an Integer value for (b): ");
    scanf("%d",&b);
    printf("Executing (a+b)...\n");
    asm {
        MOV AX,[a]
        MOV BX,[b]
        ADD BX,AX
        MOV [r],BX
    }
    printf("Result: %d\n", r);

    printf("Executing (a-b)...\n");
    asm {
        MOV AX,[a]
        MOV BX,[b]
        SUB AX,BX
        MOV [r],AX
    }
    printf("Result: %d\n", r);

    printf("Executing (a*b)...\n");
    asm {
        MOV AX,[a]
        MOV BX,[b]
        MUL BX
        MOV [a],AX
    }
    printf("Result: %d", a);

    return 0;
}
