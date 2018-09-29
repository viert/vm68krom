#include "stdlib.h" // abs() is inline so doesn't need actual library linking
#include "strconv.h"

static const char alpha8[] = {'0', '1', '2', '3', '4', '5', '6', '7'};
static const char alpha10[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
static const char alpha16[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

void conv(long i, char *dst, int base, const char *alphabeth)
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

  _c = base;
  while (_i >= _c)
  {
    _c = _c * base;
    digits++;
  }

  // digits now contains num of chars, termninating at that point
  dst[digits] = 0;

  if (i < 0)
  {
    dst[0] = '-';
    _ind = 1;
  }
  else
  {
    _ind = 0;
  }
  while (_ind < digits)
  {
    _c = _c / base;
    _curr = _i / _c;
    _i = _i % _c;
    dst[_ind++] = alphabeth[_curr];
  }
}

void dec(long i, char *dst)
{
  conv(i, dst, 10, alpha10);
}

void hex(long i, char *dst)
{
  conv(i, dst, 16, alpha16);
}

void oct(long i, char *dst)
{
  conv(i, dst, 8, alpha8);
}
