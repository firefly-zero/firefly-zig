const ff = @import("firefly");

const pad_radius = 60;
const touch_radius = 10;
const me_color = ff.Color.dark_blue;
const peer_color = ff.Color.blue;
const combined_color = ff.Color.light_blue;

const p_s = ff.Point{ .x = 160, .y = 100 };
const p_e = ff.Point{ .x = 190, .y = 90 };
const p_w = ff.Point{ .x = 160, .y = 70 };
const p_n = ff.Point{ .x = 190, .y = 60 };

const u_a: ff.Point = .{ .x = 60, .y = 55 };
const u_b: ff.Point = .{ .x = 80, .y = 55 };
const u_c: ff.Point = .{ .x = 70, .y = 40 };

const d_a: ff.Point = .{ .x = 60, .y = 85 };
const d_b: ff.Point = .{ .x = 80, .y = 85 };
const d_c: ff.Point = .{ .x = 70, .y = 100 };

const l_a: ff.Point = .{ .x = 55, .y = 60 };
const l_b: ff.Point = .{ .x = 55, .y = 80 };
const l_c: ff.Point = .{ .x = 40, .y = 70 };

const r_a: ff.Point = .{ .x = 85, .y = 60 };
const r_b: ff.Point = .{ .x = 85, .y = 80 };
const r_c: ff.Point = .{ .x = 100, .y = 70 };

pub export fn render() void {
    drawBg();
    drawPad();
    drawButtons();
}

fn drawBg() void {
    ff.clearScreen(ff.Color.white);
    const style = ff.Style{
        .fill_color = ff.Color.none,
        .stroke_color = ff.Color.light_gray,
        .stroke_width = 2,
    };
    ff.drawCircle(ff.Point{ .x = 10, .y = 10 }, pad_radius * 2, style);

    const style2 = ff.Style{
        .fill_color = ff.Color.none,
        .stroke_color = ff.Color.gray,
        .stroke_width = 2,
    };
    ff.drawCircle(p_s, touch_radius * 2, style2);
    ff.drawCircle(p_e, touch_radius * 2, style2);
    ff.drawCircle(p_w, touch_radius * 2, style2);
    ff.drawCircle(p_n, touch_radius * 2, style2);
}

fn drawPad() void {
    const maybePad = ff.readPad(ff.Peer.combined);
    if (maybePad) |pad| {
        const dpad = pad.toDPad();
        const t_style: ff.Style = .{
            .fill_color = ff.Color.green,
            .stroke_color = ff.Color.black,
            .stroke_width = 3,
        };
        if (dpad.left) {
            ff.drawTriangle(l_a, l_b, l_c, t_style);
        }
        if (dpad.right) {
            ff.drawTriangle(r_a, r_b, r_c, t_style);
        }
        if (dpad.up) {
            ff.drawTriangle(u_a, u_b, u_c, t_style);
        }
        if (dpad.down) {
            ff.drawTriangle(d_a, d_b, d_c, t_style);
        }
        const touch_pos = ff.Point{
            .x = pad_radius + @divTrunc(pad.x, 20),
            .y = pad_radius - @divTrunc(pad.y, 20),
        };
        const style = ff.Style{
            .fill_color = combined_color,
            .stroke_color = ff.Color.none,
            .stroke_width = 2,
        };
        ff.drawCircle(touch_pos, touch_radius * 2, style);
    }
    const me = ff.getMe();
    var peers = ff.getPeers().iter();
    while (peers.next()) |peer| {
        const maybePeerPad = ff.readPad(peer);
        if (maybePeerPad) |peerPad| {
            const touch_pos = ff.Point{
                .x = pad_radius + @divTrunc(peerPad.x, 20),
                .y = pad_radius - @divTrunc(peerPad.y, 20),
            };
            const color = if (peer.eq(me)) me_color else peer_color;
            const style = ff.Style{
                .fill_color = ff.Color.none,
                .stroke_color = color,
                .stroke_width = 2,
            };
            ff.drawCircle(touch_pos, touch_radius * 2, style);
        }
    }
}

fn drawButtons() void {
    {
        const buttons = ff.readButtons(ff.Peer.combined);
        const style = ff.Style{
            .fill_color = combined_color,
            .stroke_color = ff.Color.none,
            .stroke_width = 2,
        };
        if (buttons.s) {
            ff.drawCircle(p_s, touch_radius * 2, style);
        }
        if (buttons.e) {
            ff.drawCircle(p_e, touch_radius * 2, style);
        }
        if (buttons.w) {
            ff.drawCircle(p_w, touch_radius * 2, style);
        }
        if (buttons.n) {
            ff.drawCircle(p_n, touch_radius * 2, style);
        }
    }

    const me = ff.getMe();
    var peers = ff.getPeers().iter();
    while (peers.next()) |peer| {
        const buttons = ff.readButtons(peer);
        const stroke_color = if (peer.eq(me)) me_color else peer_color;
        const style = ff.Style{
            .fill_color = ff.Color.none,
            .stroke_color = stroke_color,
            .stroke_width = 2,
        };
        if (buttons.s) {
            ff.drawCircle(p_s, touch_radius * 2, style);
        }
        if (buttons.e) {
            ff.drawCircle(p_e, touch_radius * 2, style);
        }
        if (buttons.w) {
            ff.drawCircle(p_w, touch_radius * 2, style);
        }
        if (buttons.n) {
            ff.drawCircle(p_n, touch_radius * 2, style);
        }
    }
}
