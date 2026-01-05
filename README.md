![FOSS DJ PLAYER](.github/assets/banner.png 'FOSS DJ PLAYER')

[![Join our Discord](https://img.shields.io/badge/Discord-Join%20Chat-7289DA?logo=discord&logoColor=white)](https://discord.gg/WABteAtQdq)

DJ players are very expensive for no good reason. This project aims to fix this by providing resources for building one yourself.

> This repository will eventually contain documentation, guides, schematics, 3D models and software for assembling a standalone DJ player.
Until a first prototype is developed, we can use it to brainstorm ideas and explain the project goals

## Product requirements

- must be [standalone](#standalone)
- must be [cheap](#cheap)
- must be [easy to assemble](#easy-to-assemble)
- must be [compatible with rekordbox USB sticks](#compatible-with-rekordbox-usb-sticks)
- must be [DJ software agnostic](#dj-software-agnostic)

### Standalone

The player embeds the software and hardware required for playback, instead of relying of software on a separate device/computer
In simple terms: it's a player not a controller.

### Cheap

Pioneer has a monopoly that allows it to charge ridiculus amounts of money. This project aims to make DJ players affordable for the average person.
A good price point would be around the cost of a entry level DJ controller or a bit more. 
The price should not get too close to the entry level DJ player for Pioneer (XDJ-700) which costs around 700 euros.

### Easy to Assemble

The player must be simple enough for someone with basic electronics skills to assemble it in a few hours or so.
The electronics connections should be done with a custom PCB
The PCB should include slots for external modules like microcontrollers and periferals
Soldering should be required but fairly easy, not too many components

### Compatible with rekordbox USB sticks

The Pioneer monopoly forces you to use rekordbox to store your media, cues etc.
Sadly we cannot ditch completely the pioneer ecosystem without making the alternative feel like a toy.
I have not tested it yet, but i heard that [Mixxx](https://github.com/mixxxdj/mixxx) allows it.

### DJ Software agnostic

The cool part about open source DJ players is that you own it completely. This means you can decide what kind of software should run on the player.
This means that the hardware is not tied to any specific DJ software.
You can flash a micro SD card with a custom linux ISO, including the DJ software pre-configured with Midi mappings and UI skins for the embedded touchscreen.

## How does it work

The FOSS dj player is build of several parts, which can be ordered and assembled using the resources provided in this repo.

| Component                       | Notes                                                                                |
|---------------------------------|--------------------------------------------------------------------------------------|
| 3D printed case                 | to hold everything together                                                          |
| Custom PCB                      | to hold the electronic connections without running cables al over the placT          |
| Buttons, Faders, Jog Wheel etc. | to interact with the player                                                          |
| MIDI controller module          | to expose sensor input to the dj software as MIDI                                    |
| Raspberry PI                    | to host the operating system and dj software + peripherals (usb, ethernet)           |
| Audio DAC module                | to output good quality audio from the raspberry pi + RCA connector output for mixers |
| Touch Screen Display            | to interact with dj software controls that don't fit the physical buttons/sensors.   |
| 3D printed inserts              | stuff to cover buttons, encoders etc.                                                |

## Help needed

This project requires help in the following fields:

- Electronics
    - Designing PCBs
    - Finding components
    - Testing and Prototyping
- Software
    - Embedded development
    - Linux Ricing (raspbian)
- Product
    - Research on features and pricing
    - Industrial Design for 3D printing

If you want to help out in any way or simply provide feedback/support, join the [discord server](https://discord.gg/WABteAtQdq)

## References

- [XDJ100SX](https://github.com/marcmonka/XDJ100SX) Primary inspiration for this project
- [MIXXX](https://github.com/mixxxdj/mixxx) A FOSS DJ Software compatible with Linux
