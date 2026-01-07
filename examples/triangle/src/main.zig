const ff = @import("firefly");

pub export fn render() void {
    ff.drawTriangle(
        .{ .x = 60, .y = 10 },
        .{ .x = 40, .y = 40 },
        .{ .x = 80, .y = 40 },
        .{
            .fill_color = .light_gray,
            .stroke_color = .dark_blue,
            .stroke_width = 1,
        },
    );
}
