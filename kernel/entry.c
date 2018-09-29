#include "crt/crt.h"

void entry()
{
  crt_init();
  puts("Hello from C kernel");
  //  clear_screen();
  // printf("Hello from C kernel %d", 384);
  // puti(384);
  while (1)
  {
    // halt
  }
}