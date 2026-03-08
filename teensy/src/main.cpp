#include <Arduino.h>

// Definizione dell'intervallo: 2Hz -> 500ms periodo totale -> 250ms per stato
const long interval = 250; 
unsigned long previousMillis = 0;
bool ledState = LOW;

void setup() {
    // Il LED integrato del Teensy 4.1 è sul pin 13
    pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
    unsigned long currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {
        // Salva l'ultimo momento in cui hai blinkato
        previousMillis = currentMillis;

        // Inverte lo stato del LED
        ledState = !ledState;
        digitalWrite(LED_BUILTIN, ledState);
    }
}