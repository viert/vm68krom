#include "stdlib.h" // abs() is inline so doesn't need actual library linking
#include "strconv.h"

void dec(long i, char *dst)
{
  int _i;
  int digits = 0;

  if (i < 0)
  {
    _i = abs(i);
    digits = 1;
  }
  else
  {
    _i = i;
  }

  while (_i / 10 > 0)
  {
    digits++;
    _i = _i / 10;
  }

  dst[digits + 1] = 0; // null-terminated

  if (i < 0)
  {
    dst[0] = '-';
    i = abs(i);
  }

  while (i > 0)
  {
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
