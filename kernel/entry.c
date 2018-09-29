#include "crt/crt.h"
#include "strconv/strconv.h"

void entry()
{
  crt_init();
  clear_screen();

  int y;

  for (int i = 0; i < 15; i++)
  {
    printf("This is a string number %d\n", i);
  }
  while (1)
  {
    // halt
  }
}