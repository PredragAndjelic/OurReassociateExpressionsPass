#include <stdio.h>
#include <math.h>

int x = 0;

int next() {

  return ++x;

}

int f() {

  return next() + next();

}

int p() {
    int a,b,c;

    a = b*c + b*c + c + b;

    return 3+2;
}

double q() {
    int a = 17;
    double b = 4*a;
    printf("da");
    return b;
}

int main() {


    int y = p() + p() + p() + p();

    int z = q() + q() + y + 1 + y + pow(y,4) + q() + pow(y,4);

    int a, b, c;

    int r = pow(a,b) + pow(a,b);

    int v = next() + a + b + next()*a + 3*a + next() + next() + 0 + next()*a;

    int o = pow(a, 3) + pow(a,3) + pow(a,3);

    int k = ((((3+4) * 0))) * (int)(pow(a,pow(b,c))) * 7000*a*a | c;

    int l = (a+b) + 7 +(a+b);

    a = log(10) + c + b + c + 4 + b + c + 2 + 3;

    b = 1 + 1 + b*a*b*a*b*b*b * 1 + a + 2 + a + 4 * b*k * 16 & -1;

    c = a*b*a*b*5 * 0;

    int x = 4*(int)(pow(c,a))*1 | -1;

    int p = 3*a*400 + 0 + 1 + 0 + 0;

    if(a + 0 < c)
        printf("\n");

    printf("%d\n", f());


    return 0;
}
