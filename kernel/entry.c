#include "crt/crt.h"

void entry()
{
  crt_init();
  //  clear_screen();
  printf("Hello from C kernel %d ", 384);
  while (1)
  {
    // halt
  }
}