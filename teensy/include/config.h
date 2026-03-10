#ifndef CONFIG_H
#define CONFIG_H

#include <Arduino.h>

// ----- pins -----

// buttons
namespace buttons {
    
    constexpr int NUM_BUTTONS   = 12; 
    constexpr int BUTTON_PINS[NUM_BUTTONS] = {0, 1, 2, 3, 4, 5, 14, 15, 16, 17, 18, 19};
    constexpr int DEBOUNCE_MS = 5;
    
    // constexpr int PLAY          = 0; 
    // constexpr int CUE           = 1;
    // constexpr int HOT_CUE       = 2;
    // constexpr int MASTER_TEMPO  = 3;
    // constexpr int LOOP_START    = 4;
    // constexpr int LOOP_END      = 5;
    // constexpr int LOOP_EXIT     = 14;
    // constexpr int FADER_SCALE   = 15;
    // constexpr int NEXT_TRACK    = 16;
    // constexpr int PREV_TRACK    = 17;
    // constexpr int SKIP_AHEAD    = 18;
    // constexpr int SKIP_BACK     = 19;    
} 



// ----- MIDI config -----

namespace midi_config {

    constexpr int MIDI_NOTES[NUM_BUTTONS] = {60, 61, 62, 63, 64, 65, 70, 71, 72, 73, 74, 75};    // to be mapped from note to play, cue, etc
    constexpr int MIDI_CHANNEL = 1;

}


#endif