const ff = @import("firefly");

pub export fn boot() void {
    const gain = ff.audio.out.node.addGain(1.0);
    _ = gain.node.addSine(.a4, 0.0);
    const mod: ff.audio.LinearModulator = .{
        .start = 0,
        .end = 1,
        .start_at = .zero,
        .end_at = .seconds(2),
    };
    gain.modulate(.{ .linear = mod });
}
