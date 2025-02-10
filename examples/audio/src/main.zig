const ff = @import("firefly");

pub export fn boot() void {
    const sine = ff.audio.out.addSine(440.0, 0.0);
    const mod = ff.audio.LinearModulator(0, 440, 0, 4 * 44100);
    sine.modulate(mod);
}
