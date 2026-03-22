---
title: RPI Setup
description: Guide to prepare a Raspberry Pi with fdjp os image
---

## Prerequisites

### Hardware

- 1 Raspberry Pi 5 (8 gb recommended)
- 1 Waveshare 7 inch touch display
- 1 Raspberry Pi DAC Pro/+ Hat
- 1 microSD Card
- 1 GPIO ribbon cable

### Software

- Balena Etcher

## Preparing SD Card

Go to the [Releases](https://github.com/fibonacid/foss-dj-player/releases) page and scroll down until you see the _Assets_ list.
Click on the link for `foss-dj-player.zip` to download the disk image.
Open _Balena Etcher_ and insert microSD card into your computer to flash it with the file you just downloaded.
After flashing is done, remove the microSD card from your computer and put it in the Raspberry Pi.
When you turn on the RPI, you should expect the following:

1. splash screen with fjdp logo
2. tty screen with fdjp logo
3. mixxx opens automatically at fullscreen
