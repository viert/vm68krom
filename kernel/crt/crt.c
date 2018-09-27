#include "../memory/mem.h"
#include "crt.h"

void crt_init()
{
  *crtv_cursor_x = 0;
  *crtv_cursor_y = 0;
  *crtv_color = 0x0F;
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
  fillmem((void *)TXTMODE_START, TEXT_HEIGHT * TEXT_WIDTH, CHR_SPACE);
}

char *get_current_screen_addr()
{
  return TXTMODE_START + (TEXT_WIDTH * (unsigned int)*crtv_cursor_y) + *crtv_cursor_x;
}

char *get_current_color_addr()
{
  return TXTMODE_COLOR_START + (TEXT_WIDTH * (unsigned int)*crtv_cursor_y) + *crtv_cursor_x;
}

void next_cursor_pos()
{
  *crtv_cursor_x++;
  if (*crtv_cursor_x >= TEXT_WIDTH)
  {
    *crtv_cursor_x = 0;
    *crtv_cursor_y++;
    if (*crtv_cursor_y >= TEXT_HEIGHT)
    {
      scroll();
      *crtv_cursor_y--;
    }
  }
}

void putc(char sym)
{
  char *addr = get_current_screen_addr();
  *addr = sym;
  char *color_addr = get_current_color_addr();
  *color_addr = *crtv_color;
  next_cursor_pos();
}

void puts(const char *str)
{
  while (*str != 0)
  {
    putc(*str);
    str++;
  }
}

void set_color(unsigned const char color)
{
  *crtv_color = color;
}
