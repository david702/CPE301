/*
 * Experiment2C.c
 *
 * Created: 3/15/2018 12:50:57 PM
 * Author : pajard1
 */ 

#include <avr/io.h>
#include <avr/delay.h>

int main(void)
{
	DDRD = 0x00;	
	DDRB = 0xFF;	//set DDRB to output
	
	while(1)
	{
		if((PIND & 0b00000001) == 0b00000001)	
		{
			PORTB |= 0b00000010;	
			_delay_ms(250);			
		}
		else
		PORTB &= 0b11111101;	//toggle PORTB output
	}
}