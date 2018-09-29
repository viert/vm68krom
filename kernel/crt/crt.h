#ifndef __CRT_H__
#define __CRT_H__
#include "../vars.h"

#define TXTMODE_START 0x0780000
#define TXTMODE_COLOR_START 0x007812c0
#define TEXT_WIDTH 80
#define TEXT_HEIGHT 60

#define CHR_RETURN 0x0D
#define CHR_SPACE 0x20

void crt_init();
void clear_screen();

void putc(char);
void puts(const char *);
void puti(long);

// cursor manipulation
void next_cursor_pos();
void next_line();
void scroll();
void set_color(unsigned const char);

void printf(const char *, ...);

#endif // __CRT_H__