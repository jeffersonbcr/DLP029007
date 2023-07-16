#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include "altera_up_avalon_character_lcd.h"

static alt_u8 count;

int main(void)
{
    char member[] = "Arthur          ";
    char member2[] = "Jefferson       ";

    char *m1, *m2;

    m1 = &member;
    m2 = &member2;

    alt_up_character_lcd_dev * char_lcd_dev;
    char_lcd_dev = alt_up_character_lcd_open_dev (CHARACTER_LCD_0_NAME);
    count = 0;

    while( 1 ){

        //Liga leds vermelho
        IOWR_ALTERA_AVALON_PIO_DATA(LED_R_BASE, IORD_ALTERA_AVALON_PIO_DATA(SW_OPERATOR_BASE));
        if( IORD_ALTERA_AVALON_PIO_DATA(ENTER_BASE) == 1)
        {
        	alt_up_character_lcd_init (char_lcd_dev);
        	alt_up_character_lcd_string(char_lcd_dev, m1);
        	(*(alt_u8 *)(0x00011020)) = count;
        	IOWR_ALTERA_AVALON_PIO_DATA(LED_G_BASE,count);
			count++;
        }
        else
        {
        	alt_up_character_lcd_init (char_lcd_dev);
			alt_up_character_lcd_string(char_lcd_dev, m2);
			(*(alt_u8 *)(0x00011020)) = count;
			IOWR_ALTERA_AVALON_PIO_DATA(LED_G_BASE,count);
			count--;
        }

        usleep(100000); /* Sleep for 0.1s. */

    }


    return 0;
}
