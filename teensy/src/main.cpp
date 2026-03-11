#include <Arduino.h>
#include <Bounce2.h>
#include "config.h"

Bounce buttons[buttons::NUM_BUTTONS];

int last_fader = -1;

// functions to handle leds
void note_on(byte channel, byte note, byte velocity) {
    for (int i = 0; i < leds::NUM_LEDS; i++) {
        if (note == leds::LED_NOTES[i]) {
            digitalWrite(leds::LED_PINS[i], velocity > 0 ? HIGH : LOW);
        }
    }
}

void note_off(byte channel, byte note, byte velocity) {
    for (int i = 0; i < leds::NUM_LEDS; i++) {
        if (note == leds::LED_NOTES[i]) {
            digitalWrite(leds::LED_PINS[i], LOW);
        }
    }
}



void setup() {

    // buttons
    for (int i = 0; i < buttons::NUM_BUTTONS; i++) {
        buttons[i].attach(buttons::BUTTON_PINS[i], INPUT_PULLUP);
        buttons[i].interval(buttons::DEBOUNCE_MS);
    }    

    // leds
    for (int i = 0; i < leds::NUM_LEDS; i++) {
        pinMode(leds::LED_PINS[i], OUTPUT); 
    }

    usbMIDI.setHandleNoteOn(note_on);
    usbMIDI.setHandleNoteOff(note_on);

}

void loop() {
    
    // read led event
    while (usbMIDI.read()) {}

    // buttons
    for (int i = 0; i < buttons::NUM_BUTTONS; i++) {    
        
        buttons[i].update();
        
        if(buttons[i].fell()) {
            usbMIDI.sendNoteOn(midi_config::NOTES[i], 127, midi_config::BUTTON_CHANNEL);
        }

        if(buttons[i].rose()) {
            usbMIDI.sendNoteOff(midi_config::NOTES[i], 0, midi_config::BUTTON_CHANNEL);
        }

    }

    // fader
    int curr_fader = analogRead(fader::PIN) >> 3; // filter by cutting down 3 bits to 7 (128 pos)
    if (abs(curr_fader - last_fader) > fader::THRESH) { 
        usbMIDI.sendControlChange(midi_config::FADER_CC, curr_fader, 1);
        last_fader = curr_fader;
    }
}