#include "stdarg.h"
#include "../memory/mem.h"
#include "../strconv/strconv.h"
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
  return (char *)(TXTMODE_START + (TEXT_WIDTH * *crtv_cursor_y) + *crtv_cursor_x);
}

char *get_current_color_addr()
{
  return (char *)(TXTMODE_COLOR_START + (TEXT_WIDTH * *crtv_cursor_y) + *crtv_cursor_x);
}

void next_cursor_pos()
{
  (*crtv_cursor_x)++;
  if (*crtv_cursor_x >= TEXT_WIDTH)
  {
    *crtv_cursor_x = 0;
    (*crtv_cursor_y)++;
    if (*crtv_cursor_y >= TEXT_HEIGHT)
    {
      scroll();
      (*crtv_cursor_y)--;
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

void printf(const char *format, ...)
{
  long iarg;
  char *sarg;
  char num_str[8];
  int num_args = 0;
  char *curr = (char *)format;

  // calculating number of arguments according to format string
  while ((*curr) != 0)
  {
    if ((*curr) == '%')
    {
      curr++;
      if ((*curr) == 'd' || (*curr) == 's' || (*curr) == 'h')
      {
        curr++;
        num_args++;
        continue;
      }
    }
    else
    {
      curr++;
    }
  }

  if (!num_args)
  {
    puts(format);
    return;
  }

  va_list args;
  va_start(args, format);
  curr = (char *)format;
  while ((*curr) != 0)
  {
    if ((*curr) == '%')
    {
      curr++;
      switch (*curr)
      {
      case 'd':
        iarg = va_arg(args, long);
        dec(iarg, num_str);
        puts(num_str);
        break;
      case 's':
        sarg = va_arg(args, char *);
        puts(sarg);
        break;
      case 'h':
        iarg = va_arg(args, long);
        hex(iarg, num_str);
        puts(num_str);
        break;
      default:
        putc('%');
        putc(*curr);
        break;
      }
    }
    else
    {
      putc(*curr);
    }
    curr++;
  }
  va_end(args);
}

void puti(long num)
{
  char num_str[10];
  puts(num_str);
}