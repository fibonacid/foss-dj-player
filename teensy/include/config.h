#ifndef CONFIG_H
#define CONFIG_H
#include <Arduino.h>


// ----- pins -----

namespace buttons {
    
    constexpr int NUM_BUTTONS   = 16; 
    constexpr int BUTTON_PINS[NUM_BUTTONS] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17};
    constexpr int DEBOUNCE_MS = 5;
    
    // constexpr int PLAY          = 0; 
    // constexpr int CUE           = 1;
    // constexpr int HOT_CUE       = 2;
    // constexpr int HOT_CUE       = 3;
    // constexpr int HOT_CUE       = 4;
    // constexpr int HOT_CUE       = 5;
    // constexpr int HOT_CUE       = 6;
    // constexpr int MASTER_TEMPO  = 7;
    // constexpr int LOOP_START    = 8;
    // constexpr int LOOP_END      = 9;
    // constexpr int LOOP_EXIT     = 10;
    // constexpr int FADER_SCALE   = 11;
    // constexpr int NEXT_TRACK    = 12;
    // constexpr int PREV_TRACK    = 15; // 14 is A0
    // constexpr int SKIP_AHEAD    = 16;
    // constexpr int SKIP_BACK     = 17;    
} 

namespace leds {

    constexpr int NUM_LEDS = 4;
    constexpr int LED_PINS[NUM_LEDS] = {0, 1, 4, 5}; 
    constexpr int LED_NOTES[NUM_LEDS] = {60, 61, 64, 65}; 

} 

namespace fader {

    constexpr int PIN = A0;
    constexpr int THRESH = 5; 

} 

namespace browse_encoder {
    
    constexpr int BROWSE_ENC_A = 26;
    constexpr int BROWSE_ENC_B = 27;
    constexpr int BROWSE_BTN = 28;    
    constexpr int BROWSE_CC = 12;     
    constexpr int BROWSE_LOAD_NOTE = 75;

}

namespace jogwheel {
    // pins for the encoder (E6B2-CWZ1X)
    constexpr int JOG_PIN_A = 24; 
    constexpr int JOG_PIN_B = 25;
    
    constexpr int JOG_CC = 11;
    constexpr int MIDI_CH = 1;
}

// ----- MIDI config -----

namespace midi_config {
    constexpr int NOTES[buttons::NUM_BUTTONS] = {60, 61, 62, 63, 64, 65, 70, 71, 72, 73, 74, 75};    // to be mapped from note to play, cue, etc
    constexpr int BUTTON_CHANNEL = 1;
    constexpr int FADER_CC = 10;

}


#endif