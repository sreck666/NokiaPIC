#include <NokiaPIC.h>

long Segundos;
long Minutos;

int1 flag_Call;
int1 flag_trigger;

void nk_version(void)
{
     putc(0x1E);
     putc(0x00);
     putc(0x0C);
     putc(0xD1);
     putc(0x00);
     putc(0x07);
     putc(0x00);
     putc(0x01);
     putc(0x00);
     putc(0x03);
     putc(0x00);
     putc(0x01);
     putc(0x60);
     putc(0x00);
     putc(0x72);
     putc(0xD5);
}
void nk_call(void)
{
// 1E 00 10 01 00 11 00 01 00 01 01 00 32 05 01 05 00 02 00 00 01 01 45 00 78 13     
//   delay_ms(100);
     putc(0x1E);
     putc(0x00);
     putc(0x10);
     putc(0x01);
     putc(0x00);
     putc(0x11);
     putc(0x00);
     putc(0x01);
     putc(0x00);
     putc(0x01);
     putc(0x01);
     putc(0x00);
     putc(0x32);
     putc(0x05);
     putc(0x01);
     putc(0x05);
     putc(0x00);
     putc(0x02);
     putc(0x00);
     putc(0x00);
     putc(0x01);
     putc(0x01);
     putc(0x45);
     putc(0x00);
     putc(0x78);
     putc(0x13);
}
void nk_reset(void)
{ 
// 1E 00 0C 40 00 06 00 01 64 03 01 60 77 24
//1E-00-0C-40-00-06-00-01-64-03-01-60-77-24
//   delay_ms(100);
     putc(0x1E); 
     putc(0x00); 
     putc(0x0C); 
     putc(0x40); 
     putc(0x00); 
     putc(0x06); 
     putc(0x00); 
     putc(0x01); 
     putc(0x64); 
     putc(0x03); 
     putc(0x01); 
     putc(0x60); 
     putc(0x77); 
     putc(0x24); 
}
void nk_break(void)
{ 
// 1E 00 0C 01 00 07 00 01 00 08 60 01 63 00 11 0E
//   delay_ms(100);
     putc(0x1E); 
     putc(0x00); 
     putc(0x0C); 
     putc(0x01); 
     putc(0x00); 
     putc(0x07); 
     putc(0x00); 
     putc(0x01); 
     putc(0x00); 
     putc(0x08); 
     putc(0x60);
     putc(0x01); 
     putc(0x63); 
     putc(0x00); 
     putc(0x11); 
     putc(0x0E); 
}
void nk_sync(void)
{
   long i;
   //delay_ms(100);
   for (i=1;i<129;i++)
   {  putc(0x55); }
}
void Alarm_ON (void)
{
   //if (input(!IN_LED)) 
   {
   output_high(OUT_KEY);
   output_high(LED_2);
   
   delay_ms(2000);
   output_low(LED_2);
   output_low(OUT_KEY);
   }
}
void Alarm_OFF (void)
{
   //if (input(IN_LED)) 
   {
   
   output_high(OUT_KEY);
   output_high(LED_1);
   
   delay_ms(2000);
   output_low(LED_1);
   output_low(OUT_KEY);
   }

}
void button_1(void)
{  
   output_high(LED_1);
   nk_sync();
   nk_reset();
   nk_sync();
   nk_version();
   nk_call();
   delay_ms(2000);
   output_low(LED_1);
   
 }
void button_2(void)
{

   output_high(LED_2);
   nk_sync();
   nk_reset();
   nk_sync();
   nk_version();
   nk_break();
   delay_ms(2000);
   output_low(LED_2);
    
}
void Init_Var(Void)
{ 
   segundos = 0 ;
   minutos = 0 ;
   flag_Call = 1;
   flag_trigger = 0;
}

void Init_Main(Void)
{
 
   output_high(LED_1);
   output_high(LED_2);
   
   disable_interrupts(GLOBAL);
   enable_interrupts(INT_TIMER1);
  
   Init_Var();  
  
   delay_ms(2000);
   
   output_low(LED_1);
   output_low(LED_2);   
   
   
}

void DTMF_Dec(void)
{
int8 aux_dtmf;

aux_dtmf = 0;

   if (input(IN_DTMF0)) { bit_set(aux_dtmf, 0); };
   if (input(IN_DTMF1)) { bit_set(aux_dtmf, 1); };
   if (input(IN_DTMF2)) { bit_set(aux_dtmf, 2); };
   
if (Aux_dtmf==1) { 
   Alarm_ON(); 
   Init_Main();
   }



if (Aux_dtmf==3) { 
   Alarm_OFF(); 
   Init_Main();
   }

}
#INT_TIMER1
void timer1_isr(void)
{
if (input(IN_SIRENA))
   {
   output_toggle(LED_1);
   ++ segundos;
   if (segundos >= 1080)
      { 
      output_toggle(LED_2);
      ++ minutos;
      segundos = 0 ;   
      }
   if (minutos >= 30)
      {
      segundos = 0 ;
      minutos = 0 ;
      flag_Call = 1;
      flag_trigger = 0;
      }
   set_timer1(30360);
   enable_interrupts(INT_TIMER1);
   enable_interrupts(GLOBAL);
   }
}

void main()
{
   setup_timer_0(RTCC_INTERNAL|RTCC_DIV_1);
   setup_timer_1(T1_INTERNAL|T1_DIV_BY_8);
   setup_timer_2(T2_DISABLED,0,1);
   setup_ccp1(CCP_OFF);
   setup_comparator(NC_NC_NC_NC);
   set_tris_a(0xF7);
   set_tris_b(0xCF);
   
   disable_interrupts(GLOBAL);
   
   set_uart_speed(115200);
   
   nk_sync();
   nk_reset();
   
   Init_Main();
   
   do{
      if (input(switch_1))
         {
         button_1();
         Init_Main(); }

     if (input(switch_2))
         { button_2();
         Init_Main();
         }
      
     if (input(IN_SIRENA))  {if (flag_call) { 
         if (flag_trigger) {
            
            disable_interrupts(GLOBAL);
            
            output_high(LED_1);
            output_high(LED_2);
            button_2();
            delay_ms(100);
            button_1();
            flag_call = 0;
            flag_trigger = 0;

            output_low(LED_1);
            output_low(LED_2);

            enable_interrupts(GLOBAL);
            enable_interrupts(INT_TIMER1);
            set_timer1(30360);
           
            } else { flag_trigger = 1; }
            } else { flag_trigger = 0; }
            } else { flag_trigger = 0; }

     if (flag_trigger) {
       delay_ms(50000);
     } else {
     flag_trigger = 0; }
   

      if (input(IN_DTMF_STD))
         {
         
         DTMF_Dec();
         //delay_ms(5000);
         //Init_Main();
         }
      
      
      if (input(IN_SIRENA)==0) { Init_Var(); }      
  
  
   }while(true);
   
}

