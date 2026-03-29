void interrupt(){
PORTB.RB0=0;
PORTB.RB1=0;
TMR0IF_bit=0;
}

void main() {
INTCON=0b10100000;        //Configuration Timer0 comme source d'interruption
OPTION_REG=0b10100111;   //Configuration de la source du TIMER0 (RA4/TOCKL) et le Prescaler 256
ADCON1=0b00000110;       //Configuration RA0 jusqu'à RA3 et RE0 jusqu'à RE2 comme I/Os
TRISA=0x07;
TRISB=0x00;
PORTB=0x00;

while(1){

if(RA0_bit==1){
PORTB.RB0=0;
PORTB.RB1=0;
}
else{

if(RA1_bit==1&&RA2_bit==0){
PORTB.RB0=1;
PORTB.RB1=0;
TMR0=217;
}

if(RA1_bit==0&&RA2_bit==1){
PORTB.RB0=0;
PORTB.RB1=1;
TMR0=217;
}

if(RA1_bit==1&&RA2_bit==1){
PORTB.RB0=0;
PORTB.RB1=0;
}
}

}
}