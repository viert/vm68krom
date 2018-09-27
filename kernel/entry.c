#include "crt/crt.h"

void entry()
{
  crt_init();
  clear_screen();
  putc("Hello from C kernel");
  while (1)
  {
    // halt
  }
}