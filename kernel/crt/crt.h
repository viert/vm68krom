#ifndef __CRT_H__
#define __CRT_H__

#define TXTMODE_START 0x0780000
#define TXTMODE_COLOR_START 0x007812c0
#define TEXT_WIDTH 80
#define TEXT_HEIGHT 60

#define CHR_RETURN 0x0D
#define CHR_SPACE 0x20

static unsigned char *cursor_x = (unsigned char *)0x0004000;
static unsigned char *cursor_y = (unsigned char *)0x0004001;

void crt_init();
void scroll();
void putc(char);
void puts(char *);
void clear_screen();
void next_cursor_pos();

#endif // __CRT_H__