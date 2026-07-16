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


    return 3+2+x;
}

int new_p() {

  int a,b;

  int c;

  int v = a*b*(++x);
  int g = v + v;
  int h = a*b*(x++) + a*b*(x++);

  return 3 + 2 + (++x);
}


int new_f () {
  printf("x");
  int a = 3 + 4;
  int b = a + a;
  return b + a;
}

int q() {
    int a = 17;
    double b = 4*a;
    int m = x;
    return m+2;
}

int main() {


    int y = p() + q() + p() + q();

    int y_1 = + new_p() + p() + new_p() + p();

    int z = q() + q() + y + 1 + y + q() + pow(y,4) + pow(y,4);

    int z_1 = new_f() + p() + p() + 4 + y*z + p() + new_f() + p();

    int a, b, c;

    int x_1 = pow(c, b) + p() + pow(c,b) + p() + p() + p();

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
