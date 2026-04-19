#include "Arduino.h"
#include "USB_MIDI.h"

const int ledPin = 13;
const int playButton = 0x0B;
const int cueButton = 0x0C;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, HIGH);        // Turn LED on
  usbMIDI.sendNoteOn(playButton, 99, 1);    // Send MIDI note ON
  delay(1000);                       // Wait 1 second
  
  digitalWrite(ledPin, LOW);         // Turn LED off
  usbMIDI.sendNoteOff(playButton, 0, 1);    // Send MIDI note OFF
  delay(1000);                       // Wait 1 second

  digitalWrite(ledPin, HIGH);        // Turn LED on
  usbMIDI.sendNoteOn(cueButton, 99, 1);    // Send MIDI note ON
  delay(1000);                       // Wait 1 second
  
  digitalWrite(ledPin, LOW);         // Turn LED off
  usbMIDI.sendNoteOff(cueButton, 0, 1);    // Send MIDI note OFF
  delay(1000);                       // Wait 1 second
}
