#ifndef CONFIG_H
#define CONFIG_H

#include <Arduino.h>

// ----- pins -----

namespace buttons {
    
    constexpr int NUM_BUTTONS   = 16; 
    constexpr int BUTTON_PINS[NUM_BUTTONS] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16};
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
    // constexpr int PREV_TRACK    = 14;
    // constexpr int SKIP_AHEAD    = 15;
    // constexpr int SKIP_BACK     = 16;    
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


// ----- MIDI config -----

namespace midi_config {

    constexpr int NOTES[NUM_BUTTONS] = {60, 61, 62, 63, 64, 65, 70, 71, 72, 73, 74, 75};    // to be mapped from note to play, cue, etc
    constexpr int BUTTON_CHANNEL = 1;
    constexpr int FADER_CC = 10;

}


#endif