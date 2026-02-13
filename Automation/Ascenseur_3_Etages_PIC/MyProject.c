#define CP0         PORTC.F0
#define CP1         PORTC.F1
#define CP2         PORTC.F2

#define BTN_E0      PORTB.F1
#define BTN_E1      PORTB.F2
#define BTN_E2      PORTB.F3
#define BTN_INIT    PORTB.F4

#define MOTEUR_UP   PORTD.F0
#define MOTEUR_DOWN PORTD.F1
#define LED_ALARME  PORTD.F2

#define AFF_BIT0    PORTD.F3
#define AFF_BIT1    PORTD.F4

int State = 0;
int Destination = 0;
int Etage = 0;

void Demarrage() {
    if (Destination > Etage) {
        MOTEUR_UP = 1;
        MOTEUR_DOWN = 0;
        State = 1;
    }
    else if (Destination < Etage) {
        MOTEUR_UP = 0;
        MOTEUR_DOWN = 1;
        State = 1;
    }
}

void Arret() {
    if (Etage == Destination) {
        MOTEUR_UP = 0;
        MOTEUR_DOWN = 0;
        State = 0;
    }
}

void Affichage() {
    if (Etage == 0) {
        AFF_BIT0 = 0;
        AFF_BIT1 = 0;
    }
    else if (Etage == 1) {
        AFF_BIT0 = 1;
        AFF_BIT1 = 0;
    }
    else if (Etage == 2) {
        AFF_BIT0 = 0;
        AFF_BIT1 = 1;
    }
}

void interrupt() {
    if (INTCON.INTF == 1) {
        MOTEUR_UP = 0;
        MOTEUR_DOWN = 0;
        State = 0;

        while (BTN_INIT == 1) {
            LED_ALARME = 1;
            Delay_ms(500);
            LED_ALARME = 0;
            Delay_ms(500);
        }

        LED_ALARME = 0;
        Destination = 0;
        INTCON.INTF = 0;
    }
}

void main() {
    TRISB = 0xFF;
    TRISC = 0xFF;
    TRISD = 0x00;
    PORTD = 0x00;

   OPTION_REG = 0x00;
   
    State = 0;
    INTCON.INTE = 1;
    INTCON.GIE = 1;

    while(1) {
        if (BTN_E0 == 0) Destination = 0;
        if (BTN_E1 == 0) Destination = 1;
        if (BTN_E2 == 0) Destination = 2;

        if (CP0 == 0) Etage = 0;
        if (CP1 == 0) Etage = 1;
        if (CP2 == 0) Etage = 2;

        Demarrage();
        Arret();
        Affichage();
    }
}