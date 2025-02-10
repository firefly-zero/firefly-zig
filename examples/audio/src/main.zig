const ff = @import("firefly");

pub export fn boot() void {
    _ = ff.audio.out.addSine(440.0, 0.0);
}
