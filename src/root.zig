const bindings = @import("./bindings.zig");

pub const width: i32 = 240;
pub const height: i32 = 160;

pub const Point = struct {
    x: i32,
    y: i32,
};

pub const Size = struct {
    width: i32,
    height: i32,
};

pub const RGB = struct {
    r: u8,
    g: u8,
    b: u8,
};

pub const Color = enum(i32) {
    none,
    black,
    purple,
    red,
    orange,
    yellow,
    light_green,
    green,
    dark_green,
    dark_blue,
    blue,
    light_blue,
    cyan,
    white,
    light_gray,
    gray,
    dark_gray,
};

pub const Style = struct {
    fill_color: Color,
    stroke_color: Color,
    stroke_width: i32,
};

pub const LineStyle = struct {
    color: Color,
    width: i32,
};

pub fn clearScreen(c: Color) void {
    bindings.clear_screen(@intFromEnum(c));
}

pub fn drawTriangle(a: Point, b: Point, c: Point, s: Style) void {
    bindings.draw_triangle(
        a.x,
        a.y,
        b.x,
        b.y,
        c.x,
        c.y,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}
