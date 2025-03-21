pub extern "graphics" fn clear_screen(color: i32) void;
pub extern "graphics" fn set_color(index: i32, r: i32, g: i32, b: i32) void;
pub extern "graphics" fn draw_point(x: i32, y: i32, color: i32) void;
pub extern "graphics" fn draw_line(
    p1_x: i32,
    p1_y: i32,
    p2_x: i32,
    p2_y: i32,
    color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_rect(
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_rounded_rect(
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    corner_width: i32,
    corner_height: i32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_circle(
    x: i32,
    y: i32,
    diameter: i32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_ellipse(
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_triangle(
    p1_x: i32,
    p1_y: i32,
    p2_x: i32,
    p2_y: i32,
    p3_x: i32,
    p3_y: i32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_arc(
    x: i32,
    y: i32,
    diameter: i32,
    angle_start: f32,
    angle_sweep: f32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_sector(
    x: i32,
    y: i32,
    diameter: i32,
    angle_start: f32,
    angle_sweep: f32,
    fill_color: i32,
    stroke_color: i32,
    stroke_width: i32,
) void;
pub extern "graphics" fn draw_text(
    text_ptr: u32,
    text_len: u32,
    font_ptr: u32,
    font_len: u32,
    x: i32,
    y: i32,
    color: i32,
) void;
pub extern "graphics" fn draw_qr(
    ptr: u32,
    len: u32,
    x: i32,
    y: i32,
    black: i32,
    white: i32,
) void;
pub extern "graphics" fn draw_sub_image(
    ptr: u32,
    len: u32,
    x: i32,
    y: i32,
    sub_x: i32,
    sub_y: i32,
    sub_width: i32,
    sub_height: i32,
) void;
pub extern "graphics" fn draw_image(ptr: u32, len: u32, x: i32, y: i32) void;
pub extern "graphics" fn set_canvas(ptr: u32, len: u32) void;
pub extern "graphics" fn unset_canvas() void;

pub extern "input" fn read_pad(peer: u32) i32;
pub extern "input" fn read_buttons(peer: u32) u32;

pub extern "fs" fn get_file_size(path_ptr: u32, path_len: u32) u32;
pub extern "fs" fn load_file(path_ptr: u32, path_len: u32, buf_ptr: u32, buf_len: u32) u32;
pub extern "fs" fn dump_file(path_ptr: u32, path_len: u32, buf_ptr: u32, buf_len: u32) u32;
pub extern "fs" fn remove_file(path_ptr: u32, path_len: u32) void;

pub extern "menu" fn add_menu_item(index: u32, text_ptr: u32, text_len: u32) void;
pub extern "menu" fn remove_menu_item(index: u32) void;
pub extern "menu" fn open_menu() void;

pub extern "misc" fn log_debug(ptr: u32, len: u32) void;
pub extern "misc" fn log_error(ptr: u32, len: u32) void;
pub extern "misc" fn set_seed(seed: u32) void;
pub extern "misc" fn get_random() u32;
pub extern "misc" fn quit() void;

pub extern "net" fn get_me() u32;
pub extern "net" fn get_peers() u32;
pub extern "net" fn save_stash(peer: u32, ptr: u32, len: u32) void;
pub extern "net" fn load_stash(peer: u32, ptr: u32, len: u32) u32;

pub extern "stats" fn add_progress(peer_id: u32, badge_id: u32, val: i32) u32;
pub extern "stats" fn add_score(peer_id: u32, board_id: u32, new_score: i32) i32;

pub const sudo = struct {
    pub extern "sudo" fn list_dirs_buf_size(path_ptr: u32, path_len: u32) u32;
    pub extern "sudo" fn list_dirs(path_ptr: u32, path_len: u32, buf_ptr: u32, buf_len: u32) u32;
    pub extern "sudo" fn run_app(author_ptr: u32, author_len: u32, app_ptr: u32, app_len: u32) void;
    pub extern "sudo" fn load_file(path_ptr: u32, path_len: u32, buf_ptr: u32, buf_len: u32) u32;
    pub extern "sudo" fn get_file_size(path_ptr: u32, path_len: u32) u32;
};

pub const audio = struct {
    // generators
    pub extern "audio" fn add_sine(parent_id: u32, freq: f32, phase: f32) u32;
    pub extern "audio" fn add_square(parent_id: u32, freq: f32, phase: f32) u32;
    pub extern "audio" fn add_sawtooth(parent_id: u32, freq: f32, phase: f32) u32;
    pub extern "audio" fn add_triangle(parent_id: u32, freq: f32, phase: f32) u32;
    pub extern "audio" fn add_noise(parent_id: u32, seed: i32) u32;
    pub extern "audio" fn add_empty(parent_id: u32) u32;
    pub extern "audio" fn add_zero(parent_id: u32) u32;
    pub extern "audio" fn add_file(parent: u32, ptr: u32, len: u32) u32;

    // nodes
    pub extern "audio" fn add_mix(parent_id: u32) u32;
    pub extern "audio" fn add_all_for_one(parent_id: u32) u32;
    pub extern "audio" fn add_gain(parent_id: u32, lvl: f32) u32;
    pub extern "audio" fn add_loop(parent_id: u32) u32;
    pub extern "audio" fn add_concat(parent_id: u32) u32;
    pub extern "audio" fn add_pan(parent_id: u32, lvl: f32) u32;
    pub extern "audio" fn add_mute(parent_id: u32) u32;
    pub extern "audio" fn add_pause(parent_id: u32) u32;
    pub extern "audio" fn add_track_position(parent_id: u32) u32;
    pub extern "audio" fn add_low_pass(parent_id: u32, freq: f32, q: f32) u32;
    pub extern "audio" fn add_high_pass(parent_id: u32, freq: f32, q: f32) u32;
    pub extern "audio" fn add_take_left(parent_id: u32) u32;
    pub extern "audio" fn add_take_right(parent_id: u32) u32;
    pub extern "audio" fn add_swap(parent_id: u32) u32;
    pub extern "audio" fn add_clip(parent_id: u32, low: f32, high: f32) u32;

    pub extern "audio" fn reset(node_id: u32) void;
    pub extern "audio" fn reset_all(node_id: u32) void;
    pub extern "audio" fn clear(node_id: u32) void;

    pub extern "audio" fn mod_linear(node_id: u32, param: u32, start: f32, end: f32, start_at: u32, end_at: u32) void;
    pub extern "audio" fn mod_hold(node_id: u32, param: u32, v1: f32, v2: f32, time: u32) void;
    pub extern "audio" fn mod_sine(node_id: u32, param: u32, freq: f32, low: f32, high: f32) void;
};
