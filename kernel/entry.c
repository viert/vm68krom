#include "crt/crt.h"
// #include "stdarg.h"
#include "strconv/strconv.h"

// void blah(int count, ...)
// {
//   va_list args;
//   int a;
//   va_start(args, count);
//   while (count > 0)
//   {
//     a = va_arg(args, int);
//     count--;
//     puti(a);
//     putc(' ');
//   }
//   va_end(args);
// }

void entry()
{
  crt_init();
  clear_screen();
  printf("Hello, %d", 1);
  while (1)
  {
    // halt
  }
}