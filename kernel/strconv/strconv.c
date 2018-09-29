#include "stdlib.h" // abs() is inline so doesn't need actual library linking
#include "strconv.h"

void dec(long i, char *dst)
{
  int _i;
  int _c;
  int _ind;  // current digit index
  int _curr; // current digit

  // string contains 1 char min
  int digits = 1;

  _i = abs(i);
  if (i < 0)
  {
    // minus sign gives additional digit
    digits++;
  }

  _c = 10;
  while (_i > _c)
  {
    _c = _c * 10;
    digits++;
  }

  // digits now contains num of chars, termninating at that point
  dst[digits] = 0;

  if (i < 0)
  {
    dst[0] = "-";
    _ind = 1;
  }
  else
  {
    _ind = 0;
  }
  while (_ind < digits)
  {
    _curr = _i / _c;
    dst[_ind++] = 48 + _curr; // 48 is the '0' symbol code
    _c = _c / 10;
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
