const bindings = @import("./bindings.zig").audio;

pub const Freq = f32;
pub const Time = u32;

fn Node(comptime T: type) type {
    return struct {
        id: u32,
        usingnamespace T;

        /// Add sine wave oscillator source (`∿`).
        pub fn addSine(self: BaseNode, f: Freq, phase: f32) Sine {
            const id = bindings.add_sine(self.id, f, phase);
            return Sine{ .id = id };
        }
    };
}

pub const Modulator = fn (node_id: u32, param: u32) void;

pub fn LinearModulator(start: f32, end: f32, start_at: Time, end_at: Time) Modulator {
    return struct {
        fn mod(node_id: u32, param: u32) void {
            bindings.mod_linear(node_id, param, start, end, start_at, end_at);
        }
    }.mod;
}

pub const BaseNode = Node(struct {});

pub const Sine = Node(struct {
    pub fn modulate(self: Sine, mod: Modulator) void {
        mod(self.id, 0);
    }
});

pub const out = BaseNode{ .id = 0 };
