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
            const color = if (peer == me) me_color else peer_color;
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
        const stroke_color = if (peer == me) me_color else peer_color;
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
