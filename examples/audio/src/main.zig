const ff = @import("firefly");

pub export fn boot() void {
    const gain = ff.audio.out.addGain(1.0);
    _ = gain.addSine(ff.audio.Freq.a4, 0.0);
    const mod = ff.audio.LinearModulator{
        .start = 0,
        .end = 1,
        .start_at = ff.audio.Time.zero,
        .end_at = ff.audio.Time.seconds(2),
    };
    gain.modulate(ff.audio.Modulator{ .linear = mod });
}
