volatile int *a = 0, *b = 0;
void foo (void);
int main () { volatile int y = 7; a = &y; foo (); return b > a; }
void foo (void) { volatile int x = 5; b = &x; }
