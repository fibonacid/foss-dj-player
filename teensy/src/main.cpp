#include <Arduino.h>
#include <Bounce2.h>
#include "config.h"

Bounce buttons[buttons::NUM_BUTTONS];

void setup() {

    for (int i = 0; i < buttons::NUM_BUTTONS; i++) {
        buttons[i].attach(buttons::BUTTON_PINS[i], INPUT_PULLUP);
        buttons[i].interval(buttons::DEBOUNCE_MS);
    }    
}

void loop() {
    

    for (int i = 0; i < buttons::NUM_BUTTONS; i++) {    
        
        buttons[i].update();
        
        if(buttons[i].fell()) {
            usbMIDI.sendNoteOn(midi_config::MIDI_NOTES[i], 127, midi_config::MIDI_CHANNEL);
        }

        if(buttons[i].rose()) {
            usbMIDI.sendNoteOff(midi_config::MIDI_NOTES[i], 0, midi_config::MIDI_CHANNEL);
        }

    }

    while (usbMIDI.read()) {}
}