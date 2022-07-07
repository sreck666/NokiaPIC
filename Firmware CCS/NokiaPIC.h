#include <16F628A.h>

#FUSES NOWDT                    //No Watch Dog Timer
#FUSES HS                       //High speed Osc (> 4mhz for PCM/PCH) (>10mhz for PCD)
#FUSES PUT                      //Power Up Timer
#FUSES NOPROTECT                //Code not protected from reading
#FUSES NOBROWNOUT               //No brownout reset
#FUSES NOMCLR                   //Master Clear pin enabled
#FUSES NOLVP                    //No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES NOCPD                    //No EE protection


#define SWITCH_1   PIN_A2
#define SWITCH_2   PIN_A3
#define OUT_KEY   PIN_A4
#define IN_SIRENA   PIN_B0
#define IN_LED   PIN_B3
#define LED_1   PIN_B4
#define LED_2   PIN_B5
#define IN_DTMF1  PIN_B6
#define IN_DTMF2  PIN_B7
#define IN_DTMF0  PIN_A1
#define IN_DTMF_STD  PIN_A5



#use fast_io(B)
#use delay(clock=20000000)
#use rs232(baud=115200,parity=N,xmit=PIN_B2,rcv=PIN_B1,bits=8,stop=1)

