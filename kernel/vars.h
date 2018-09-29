#ifndef __VARS_H__
#define __VARS_H__

#define VARS_START 0x007F5600

static unsigned char *crtv_cursor_x = (unsigned char *)(VARS_START + 0);
static unsigned char *crtv_cursor_y = (unsigned char *)(VARS_START + 1);
static unsigned char *crtv_color = (unsigned char *)(VARS_START + 2);

#endif // __VARS_H__