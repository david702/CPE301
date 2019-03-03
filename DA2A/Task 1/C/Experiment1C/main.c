/*
 * Experiment1C.c
 *
 * Created: 3/15/2018 12:42:47 PM
 * Author : pajard1
 */ 


#include <avr/io.h>
#include <avr/delay.h>

int main(void)
{
	DDRB = 32;		
	TCCR1B = 13;	//set prescaler to 1024
	TCNT1 = 0;		
	OCR1A = 0x00F3;	//set value to count to
	
	while(1)
	{
		if((TIFR1 & 0b00000001) == 0b000000001)	
		{
			PORTB = 0xFF;		//set output of PORTB to 1
			_delay_ms(250);		
			TCNT1 = 0;			//reset counter to 0
		}
		else
		PORTB = 0x00;		
	}
}