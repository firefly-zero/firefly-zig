const ff = @import("firefly");

pub export fn boot() void {
    const gain = ff.audio.out.addGain(1.0);
    _ = gain.addSine(ff.audio.Freq.a4, 0.0);
    const mod = ff.audio.LinearModulator(
        0,
        1,
        ff.audio.Time.zero,
        ff.audio.Time.seconds(2),
    );
    gain.modulate(mod);
}
