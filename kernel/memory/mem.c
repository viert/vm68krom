#include "mem.h"

void *memcpy(void *src0, void *dst0, unsigned long size)
{
  char *src = src0;
  char *dst = dst0;
  for (unsigned int i = 0; i < size; i++)
  {
    *dst = *src;
    dst++;
    src++;
  }
  return dst0;
}

void *fillmem(void *dst0, unsigned long size, char value)
{
  char *dst = dst0;
  for (unsigned int i = 0; i < size; i++)
  {
    *dst = value;
    dst++;
  }
  return dst0;
}

void *zeromem(void *dst, unsigned long size)
{
  return fillmem(dst, size, 0);
}