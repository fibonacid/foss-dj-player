#include <Arduino.h>
#include <Bounce2.h>
#include <Encoder.h>
#include "config.h"

Bounce butts[buttons::NUM_BUTTONS];
Encoder browse_enc(browse_encoder::BROWSE_ENC_A, browse_encoder::BROWSE_ENC_B);
Bounce browse_button = Bounce();
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
        butts[i].attach(buttons::BUTTON_PINS[i], INPUT_PULLUP);
        butts[i].interval(buttons::DEBOUNCE_MS);
    }    

    // leds
    for (int i = 0; i < leds::NUM_LEDS; i++) {
        pinMode(leds::LED_PINS[i], OUTPUT); 
    }


    // browse encoder
    browse_button.attach(browse_encoder::BROWSE_BTN, INPUT_PULLUP);
    browse_button.interval(5);

    // callback for leds
    usbMIDI.setHandleNoteOn(note_on);
    usbMIDI.setHandleNoteOff(note_on);

}

void loop() {
    
    // read led event
    while (usbMIDI.read()) {}

    // buttons
    for (int i = 0; i < buttons::NUM_BUTTONS; i++) {    
        
        butts[i].update();
        
        if(butts[i].fell()) {
            usbMIDI.sendNoteOn(midi_config::NOTES[i], 127, midi_config::BUTTON_CHANNEL);
        }

        if(butts[i].rose()) {
            usbMIDI.sendNoteOff(midi_config::NOTES[i], 0, midi_config::BUTTON_CHANNEL);
        }

    }

    // fader
    int curr_fader = analogRead(fader::PIN) >> 3; // filter by cutting down 3 bits to 7 (128 pos)
    if (abs(curr_fader - last_fader) > fader::THRESH) { 
        usbMIDI.sendControlChange(midi_config::FADER_CC, curr_fader, 1);
        last_fader = curr_fader;
    }


    // browse encoder (rotation)
    static long oldBrowsePos = 0;
    long newBrowsePos = browse_enc.read() / 4; 
    if (newBrowsePos != oldBrowsePos) {
        int delta = (newBrowsePos > oldBrowsePos) ? 65 : 63;
        usbMIDI.sendControlChange(browse_encoder::BROWSE_CC, delta, 1);
        oldBrowsePos = newBrowsePos;
    }

    // browse encoder (load track button)
    browse_button.update();
    if (browse_button.fell()) usbMIDI.sendNoteOn(browse_encoder::BROWSE_LOAD_NOTE, 127, 1);
    if (browse_button.rose()) usbMIDI.sendNoteOff(browse_encoder::BROWSE_LOAD_NOTE, 0, 1);




}