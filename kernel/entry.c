#include "crt/crt.h"
#include "strconv/strconv.h"

void entry()
{
  crt_init();
  clear_screen();

  int y;

  for (int i = 0; i < 1500; i++)
  {
    printf("%x ", i);
  }
  while (1)
  {
    // halt
  }
}