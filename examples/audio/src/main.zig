const ff = @import("firefly");

pub export fn boot() void {
    const gain = ff.audio.out.node.addGain(1.0);
    _ = gain.node.addSine(.a4, 0.0);
    const mod: ff.audio.LinearModulator = .{
        .start_at = .zero,
        .end_at = .seconds(2),
    };
    gain.modulate(0, 1, .{ .linear = mod });
}
