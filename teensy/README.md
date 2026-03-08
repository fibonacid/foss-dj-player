# Firmware

## Sensor's list

Exlimb E6B2-CWZ1X 
So far we selected some sensors to tesst a possible layout of I/O we'd like to include. These are the sensors directly read by the teensy (few others directly interface with the raspberry pi).
Exlimb E6B2-CWZ1X 
- 1000PR jog wheel encoder [Exlimb E6B2-CWZ1X Incremental Rotary Encoder](https://it.aliexpress.com/item/1005006632253177.html).
- 1 track selection encoder
- 1 fader potentiometer 10KOhm 13 cm []()
- buttons (16 buttons, pull-up resistor integrated into teensy)
    - 1 play
    - 1 cue
    - 5 hot cue
    - 1 master tempo
    - 3 loop (start, end, exit)
    - 1 fader scale
    - 2 next/prev track
    - 2 skip ahead/back
- leds (3 leds)
    - 1 play
    - 1 cue
    - 1 loop active (to be integrated with loop start/end button)

