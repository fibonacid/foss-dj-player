class FossDjPlayer {
  readonly tempoRanges = [0.06, 0.1, 0.16, 0.25];

  // Jog wheel constraints
  vinylMode = true;
  alpha = 1.0 / 8;
  beta = this.alpha / 32;
  bendScale = 0.8;

  init(_id: number, _debugging: boolean) {
    // turn on all LEDs
    for (let i = 1; i <= 40; i++) {
      // Repeat the following code for the numbers 1 through 40
      // see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for
      midi.sendShortMsg(0x90, i, 0x7f);
    }
  }

  shutdown() {
    // turn off all LEDs
    for (let i = 1; i <= 40; i++) {
      midi.sendShortMsg(0x90, i, 0x00);
    }
  }

  cycleTempoRange(
    _channel: number,
    _control: number,
    value: number,
    _status: number,
    group: string,
  ) {
    if (value === 0) {
      return;
    } // ignore release

    const currRange = engine.getValue(group, "rateRange");
    let idx = 0;

    for (let i = 0; i < this.tempoRanges.length; i++) {
      if (currRange === this.tempoRanges[i]) {
        // idx get the index of the value in tempoRanges following the currently configured one
        // or cycle back to 0 if the current is the last value of the list.
        idx = (i + 1) % this.tempoRanges.length;
        break;
      }
    }
    engine.setValue(group, "rateRange", this.tempoRanges[idx]);
  }

  jogTurn(
    channel: number,
    _control: number,
    value: number,
    _status: number,
    group: string,
  ) {
    const deckNum = channel + 1;
    // wheel center at 64; <64 rew >64 fwd
    let newVal = value - 64;

    // loop_in / out adjust
    // const loopEnabled = engine.getValue(group, "loop_enabled");
    // if (loopEnabled > 0) {
    //   if (this.loopAdjustIn[channel]) {
    //     newVal =
    //       newVal * this.loopAdjustMultiply +
    //       engine.getValue(group, "loop_start_position");
    //     engine.setValue(group, "loop_start_position", newVal);
    //     return;
    //   }
    //   if (this.loopAdjustOut[channel]) {
    //     newVal =
    //       newVal * this.loopAdjustMultiply +
    //       engine.getValue(group, "loop_end_position");
    //     engine.setValue(group, "loop_end_position", newVal);
    //     return;
    //   }
    // }

    if (engine.isScratching(deckNum)) {
      engine.scratchTick(deckNum, newVal);
    } else {
      // fallback
      engine.setValue(group, "jog", newVal * this.bendScale);
    }
  }
}
