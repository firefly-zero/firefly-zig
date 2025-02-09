const std = @import("std");
const bindings = @import("./bindings.zig");

pub const width: i32 = 240;
pub const height: i32 = 160;

const pi: f32 = 3.14159265358979323846264338327950288;
const tau: f32 = 6.28318530717958647692528676655900577;

pub const Point = struct {
    x: i32,
    y: i32,
};

pub const Size = struct {
    width: i32,
    height: i32,
};

pub const Angle = struct {
    radians: f32,

    /// The 360° angle.
    pub const full_circle: Angle = Angle(tau);
    /// The 180° angle.
    pub const half_circle: Angle = Angle(pi);
    /// The 90° angle.
    pub const quarter_circle: Angle = Angle(pi / 2.0);
    /// The 0° angle.
    pub const zero: Angle = Angle(0.0);

    /// An angle in radians where Tau (doubled Pi) is the full circle.
    pub fn from_radians(r: f32) Angle {
        return Angle{r};
    }

    /// An angle in degrees where 360.0 is the full circle.
    pub fn from_degrees(d: f32) Angle {
        return Angle{d * pi / 180.0};
    }
};

pub const RGB = struct {
    r: u8,
    g: u8,
    b: u8,
};

pub const Color = enum(i32) {
    /// No color (100% transparency).
    none,
    /// Black color: #1A1C2C.
    black,
    /// Purple color: #5D275D.
    purple,
    /// Red color: #B13E53.
    red,
    /// Orange color: #EF7D57.
    orange,
    /// Yellow color: #FFCD75.
    yellow,
    /// Light green color: #A7F070.
    light_green,
    /// Green color: #38B764.
    green,
    /// Dark green color: #257179.
    dark_green,
    /// Dark blue color: #29366F.
    dark_blue,
    /// Blue color: #3B5DC9.
    blue,
    /// Light blue color: #41A6F6.
    light_blue,
    /// Cyan color: #73EFF7.
    cyan,
    /// White color: #F4F4F4.
    white,
    /// Light gray color: #94B0C2.
    light_gray,
    /// Gray color: #566C86.
    gray,
    /// Dark gray color: #333C57.
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

pub const File = []u8;
pub const Font = File;
pub const Image = File;
pub const Canvas = Image;
pub const String = []const u8;

pub const SubImage = struct {
    point: Point,
    size: Size,
    raw: []u8,
};

pub const Pad = struct {
    x: i32,
    y: i32,
};

pub const Buttons = struct {
    s: bool,
    e: bool,
    w: bool,
    n: bool,
    menu: bool,
};

pub const Peer = u32;

/// Fill the whole frame with the given color.
pub fn clearScreen(c: Color) void {
    bindings.clear_screen(@intFromEnum(c));
}

/// Set a color value in the palette.
pub fn setColor(c: Color, v: RGB) void {
    bindings.set_color(@intFromEnum(c), v.r, v.g, v.b);
}

/// Set a single point (1 pixel is scaling is 1) on the frame.
pub fn drawPoint(p: Point, c: Color) void {
    bindings.draw_point(p.x, p.y, @intFromEnum(c));
}

/// Draw a straight line from point a to point b.
pub fn drawLine(a: Point, b: Point, s: LineStyle) void {
    bindings.draw_line(a.x, a.y, b.x, b.y, s.color, s.width);
}

/// Draw a rectangle filling the given bounding box.
pub fn drawRect(p: Point, b: Size, s: Style) void {
    bindings.draw_rect(
        p.x,
        p.y,
        b.width,
        b.height,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Draw a rectangle with rounded corners.
pub fn drawRoundedRect(p: Point, b: Size, corner: Size, s: Style) void {
    bindings.draw_rounded_rect(
        p.x,
        p.y,
        b.width,
        b.height,
        corner.width,
        corner.height,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Draw a circle with the given diameter.
pub fn drawCircle(p: Point, d: i32, s: Style) void {
    bindings.draw_circle(
        p.x,
        p.y,
        d,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Draw an ellipse (oval).
pub fn drawEllipse(p: Point, b: Size, s: Style) void {
    bindings.draw_ellipse(
        p.x,
        p.y,
        b.width,
        b.height,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Draw a triangle.
///
/// The order of points doesn't matter.
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

/// Draw an arc.
pub fn drawArc(p: Point, d: i32, start: Angle, sweep: Angle, s: Style) void {
    bindings.draw_arc(
        p.x,
        p.y,
        d,
        start.radians,
        sweep.radians,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Draw a sector.
pub fn drawSector(p: Point, d: i32, start: Angle, sweep: Angle, s: Style) void {
    bindings.draw_sector(
        p.x,
        p.y,
        d,
        start.radians,
        sweep.radians,
        @intFromEnum(s.fill_color),
        @intFromEnum(s.stroke_color),
        s.stroke_width,
    );
}

/// Render text using the given font.
///
/// Unlike in the other drawing functions, here [Point] points not to the top-left corner
/// but to the baseline start position.
pub fn drawText(t: String, f: Font, p: Point, c: Color) void {
    bindings.draw_text(
        t.ptr,
        t.len,
        f.ptr,
        f.len,
        p.x,
        p.y,
        @intFromEnum(c),
    );
}

/// Render an image using the given colors.
pub fn drawImage(i: Image, p: Point) void {
    bindings.draw_image(i.ptr, i.len, p.x, p.y);
}

/// Draw a subregion of an image.
///
/// Most often used to draw a sprite from a sprite atlas.
pub fn drawSubImage(i: SubImage, p: Point) void {
    bindings.draw_sub_image(
        i.raw.ptr,
        i.raw.len,
        p.x,
        p.y,
        i.point.x,
        i.point.y,
        i.size.width,
        i.size.height,
    );
}

/// Set canvas to be used for all subsequent drawing operations.
pub fn setCanvas(c: Canvas) void {
    bindings.set_canvas(c.ptr, c.len);
}

/// Unset canvas set by [`set_canvas`]. All subsequent drawing operations will target frame buffer.
pub fn unsetCanvas() void {
    bindings.unset_canvas();
}

/// Get the current touchpad state.
pub fn readPad(p: Peer) ?Pad {
    const raw = bindings.read_pad(p);
    if (raw == 0xffff) {
        return null;
    }
    return Pad{
        .x = (raw >> 16),
        .y = raw,
    };
}

/// Get the currently pressed buttons.
pub fn readButtons(p: Peer) Buttons {
    const raw = bindings.read_buttons(p);
    return Buttons{
        .s = raw & 1 != 0,
        .e = (raw >> 1) & 1 != 0,
        .w = (raw >> 2) & 1 != 0,
        .n = (raw >> 3) & 1 != 0,
        .menu = (raw >> 4) & 1 != 0,
    };
}

/// Get a file size in the rom or data dir.
///
/// If the file does not exist, 0 is returned.
pub fn getFileSize(path: String) u32 {
    return bindings.get_file_size(path.ptr, path.len);
}

/// Read the whole file with the given name into the given buffer.
///
/// If the file size is not known in advance (and so the buffer has to be allocated
/// dynamically), consider using loadFileBuf() instead.
pub fn loadFile(path: String, buf: []const u8) []u8 {
    const size = bindings.load_file(path.ptr, path.len, buf.ptr, buf.len);
    return buf[0..size];
}

/// Read the whole file with the given name.
///
/// If you have a pre-allocated buffer of the right size, use loadFile() instead.
///
/// null is returned if the file does not exist.
pub fn loadFileBuf(path: String, alloc: std.mem.Allocator) ?[]u8 {
    const size = bindings.get_file_size(path.ptr, path.len);
    if (size == 0) {
        return null;
    }
    const buf = try alloc.alloc(u8, size);
    bindings.load_file(path.ptr, path.len, buf.ptr, buf.len);
    return buf;
}

/// Write the buffer into the given file in the data dir.
///
/// If the file exists, it will be overwritten.
/// If it doesn't exist, it will be created.
pub fn dumpFile(path: String, buf: []const u8) void {
    bindings.dump_file(path.ptr, path.len, buf.ptr, buf.len);
}

/// Remove file (if exists) with the given name from the data dir.
pub fn removeFile(path: String) void {
    bindings.remove_file(path.ptr, path.len);
}

/// Add a custom item on the app menu.
///
/// The `i` index is the value passed into the `handle_menu` callback
/// when the menu item is selected by the user.
/// Its value doesn't have to be unique or continious.
pub fn add_menu_item(i: u8, t: String) void {
    bindings.add_menu_item(i, t.ptr, t.len);
}

/// Remove a custom menu item with the given index.
pub fn remove_menu_item(i: u8) void {
    bindings.remove_menu_item(i);
}

/// Open the app menu.
///
/// It will be opened before the next update.
/// The current update and then render will proceed as planned.
pub fn open_menu() void {
    bindings.open_menu();
}
