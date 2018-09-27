#include "strconv.h"

void dec(long i, char *dst)
{
  int digits = 0;
  int _i = i;
  while (_i / 10 > 0)
  {
    digits++;
    _i = _i / 10;
  }

  dst[digits + 1] = 0; // null-terminated
  while (digits >= 0)
  {
    printf("%d\n", digits);
    dst[digits] = 48 + (i % 10);
    i = i / 10;
    digits--;
  }
}

void hex(long i, char *dst)
{
  int digits = 0;
  int _i = i;
  while (_i / 16 > 0)
  {
    digits++;
    _i = _i / 16;
  }

  dst[digits + 1] = 0; // null-terminated
  while (digits >= 0)
  {
    printf("%d\n", digits);
    char value = i % 16;
    if (value < 10)
    {
      dst[digits] = 48 + value; // ("0") + value
    }
    else
    {
      dst[digits] = 55 + value; // 65("A") + value - 10
    }
    i = i / 16;
    digits--;
  }
}
