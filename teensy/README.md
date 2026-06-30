# Firmware

## Sensor's list

So far we selected some sensors to tesst a possible layout of I/O we'd like to include. These are the sensors directly read by the teensy (few others directly interface with the raspberry pi).

- [ ] 1 1000PR jog wheel encoder [Exlimb E6B2-CWZ1X Incremental Rotary Encoder](https://it.aliexpress.com/item/1005006632253177.html).
- [ ] 1 track selection encoder [KY-040 360° rotary encoder module](https://it.aliexpress.com/item/1005010541982030.html)
- [x] 1 fader linear potentiometer [B10K 130 mm](https://it.aliexpress.com/item/1005006848969427.html)
- [x] buttons (16 buttons, pull-up resistor integrated into teensy)
    - 1 play
    - 1 cue
    - 5 hot cue
    - 1 master tempo
    - 3 loop (start, end, exit)
    - 1 fader scale
    - 2 next/prev track
    - 2 skip ahead/back
- [x] leds (3 leds)
    - 1 play
    - 1 cue
    - 2 loop active (to be integrated with loop start/end button)

## Libraries

- [bounce2](https://github.com/thomasfre) to implement automatic debouncing. 
- USBmidi is native and included in the .ini