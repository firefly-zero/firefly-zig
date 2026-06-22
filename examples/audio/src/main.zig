const ff = @import("firefly");

pub export fn boot() void {
    const gain = ff.audio.out.add.gain(1.0);
    _ = gain.add.sine(.a4, 0.0);
    const mod: ff.audio.LinearModulator = .{
        .start_at = .zero,
        .end_at = .seconds(2),
    };
    gain.modulate(0, 1, mod);
}
