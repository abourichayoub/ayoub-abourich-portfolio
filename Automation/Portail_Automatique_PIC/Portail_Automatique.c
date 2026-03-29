unsigned char state ;
unsigned int time;
  void open();
  void close();
  void interrupt() {
    if (INTF_bit) {
        if (state == 0) state = 2; // Télécommande active l'ouverture
        INTF_bit = 0;
    }
    if (TMR0IF_bit) {
        time++;
        TMR0IF_bit = 0;
    }
}
 void open(){
     state=2;
     time = 0;
     PORTC.RC0=1;
     delay_ms(1000);
     PORTC.RC2=1;
   while (state == 2){
      if(PORTB.RB1 == 0) {PORTC.RC0 = 0; }
      if(PORTB.RB3 == 0) {PORTC.RC2 = 0; }
      if (PORTB.RB1 == 0 && PORTB.RB3 == 0) {
            state = 1;
     }
      if (time > 78) { // Sécurité 10s
            state = 4;
            PORTC = 0;
        }
    }
    }
 void close(){
      state=3;
      time = 0;
     PORTC.RC3=1;
     delay_ms(1000);
     PORTC.RC1=1;
     while (state == 3){
     if (PORTB.RB5 == 1) {
         PORTC = 0;
          open();
          return; }

      if(PORTB.RB2 == 0) {PORTC.RC1 = 0; }
      if(PORTB.RB4 == 0) {PORTC.RC3 = 0; }
      if (PORTB.RB2 == 0 && PORTB.RB4 == 0) {
            state = 0;
     }
      if (time > 78) { // Sécurité 10s
            state = 4;
            PORTC = 0;
        }
    }


 }

void main() {
   ADCON1=0b00000110;
    TRISA = 0b00010001;
    TRISB = 0xFF;
    TRISC = 0x00;

    PORTA = 0;
    PORTC = 0;

    GIE_bit = 1;
    INTE_bit = 1;
    INTF_bit = 0;
    TMR0IE_bit=1;
    TMR0IF_bit=0;
    T0CS_bit = 1;
    PSA_bit = 0;
    PS0_bit = 1;
    PS1_bit = 1;
    PS2_bit = 1;
   while(1) {
        if (state == 2) {open();  }
        if (state == 1) {
            time = 0;
            while(state == 1 && time < 39);
            if (state == 1) {close();}
        }

        if (state == 4) { // Gestion de l'alarme
            PORTA.RA0 = 1; // Allume LED/Buzzer (Q5)
            PORTC = 0;     // Arrêt de sécurité moteurs
        } else {
            PORTA.RA0 = 0;
        }



 }
}