const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target: std.Target.Query = .{
        .cpu_arch = .wasm32,
        .os_tag = .freestanding,
    };
    const optimize: std.builtin.OptimizeMode = .ReleaseSmall;
    const dep_opts = .{ .target = target, .optimize = optimize };
    _ = dep_opts;
    _ = b.addModule("firefly", .{
        .root_source_file = b.path("src/root.zig"),
    });
}
