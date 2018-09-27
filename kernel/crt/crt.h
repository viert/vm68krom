#ifndef __CRT_H__
#define __CRT_H__

#define TXTMODE_START 0x0780000
#define TXTMODE_COLOR_START 0x007812c0
#define TEXT_WIDTH 80
#define TEXT_HEIGHT 60
#define CRT_VAR_START 0x00004000

#define CHR_RETURN 0x0D
#define CHR_SPACE 0x20

static unsigned char *crtv_cursor_x = (unsigned char *)(CRT_VAR_START + 0);
static unsigned char *crtv_cursor_y = (unsigned char *)(CRT_VAR_START + 1);
static unsigned char *crtv_color = (unsigned char *)(CRT_VAR_START + 2);

void crt_init();
void scroll();
void putc(char);
void puts(char *);
void clear_screen();
void next_cursor_pos();

#endif // __CRT_H__