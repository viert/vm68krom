#include "../memory/mem.h"
#include "crt.h"

void crt_init()
{
  *cursor_x = 0;
  *cursor_y = 0;
}

void scroll()
{
  char *dst;
  char *src;
  unsigned long const size = TEXT_WIDTH * (TEXT_HEIGHT - 1);

  dst = (char *)TXTMODE_START;
  src = (char *)TXTMODE_START + TEXT_WIDTH;
  memcpy(src, dst, size);

  dst = dst + size;
  fillmem(dst, TEXT_WIDTH, CHR_SPACE); // 0x20 == space symbol
}

void clear_screen()
{
  fillmem((void*)TXTMODE_START, TEXT_HEIGHT * TEXT_WIDTH, CHR_SPACE);
}

char *get_current_screen_addr()
{
  return TXTMODE_START + (TEXT_WIDTH * (unsigned int)cursor_y) + cursor_x;
}

void next_cursor_pos()
{
  *cursor_x++;
  if (*cursor_x >= TEXT_WIDTH)
  {
    *cursor_x = 0;
    *cursor_y++;
    if (*cursor_y >= TEXT_HEIGHT)
    {
      scroll();
      *cursor_y--;
    }
  }
}

void putc(char sym)
{
  char *addr = get_current_screen_addr();
  *addr = sym;
  next_cursor_pos();
}

void puts(char *str)
{
  while (*str != 0)
  {
    putc(*str);
    str++;
  }
}
