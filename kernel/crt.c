#include "mem.h"

#define TXTMODE_START 0x0780000
#define TXTMODE_COLOR_START 0x007812c0
#define TEXT_WIDTH 80
#define TEXT_HEIGHT 60

void scroll() {
  char *dst;
  char *src;
  unsigned long const size = TEXT_WIDTH * (TEXT_HEIGHT - 1);

  dst = (char *) TXTMODE_START;
  src = (char *) TXTMODE_START + TEXT_WIDTH;
  memcpy(src, dst, size);
  
  dst = dst + size;
  fillmem(dst, TEXT_WIDTH, 0x20); // 0x20 == space symbol
}