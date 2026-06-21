const std = @import("std");
const bindings = @import("./bindings.zig").audio;

// Execute all branches of code at compile-time to find all type errors.
comptime {
    compile(@This());

    compile(Freq);
    compile(Time);
    compile(LinearModulator);
    compile(HoldModulator);
    compile(AdsrModulator);
    compile(SineModulator);
    compile(SquareModulator);
    compile(SawtoothModulator);
    compile(Sine);
    compile(Gain);
    compile(Pan);
    compile(Mute);
    compile(Pause);
    compile(LowPass);
    compile(HighPass);
    compile(Clip);
    compile(Square);
    compile(Sawtooth);
    compile(Triangle);
}

fn compile(T: type) void {
    const decls = @typeInfo(T).@"struct".decls;
    for (decls) |decl| {
        _ = &@field(T, decl.name);
    }
}

pub const sample_rate: u32 = 44_100;

pub const Freq = struct {
    h: f32,

    pub const zero: Freq = .{ .h = 0 };
    /// C0, MIDI note #12
    pub const c0: Freq = .{ .h = 16.351 };
    pub const cs0: Freq = .{ .h = 17.324 };
    pub const d0: Freq = .{ .h = 18.354 };
    pub const ds0: Freq = .{ .h = 19.445 };
    pub const e0: Freq = .{ .h = 20.601 };
    pub const f0: Freq = .{ .h = 21.827 };
    pub const fs0: Freq = .{ .h = 23.124 };
    pub const g0: Freq = .{ .h = 24.499 };
    pub const gs0: Freq = .{ .h = 25.956 };
    /// A0, the lowest note of a piano
    pub const a0: Freq = .{ .h = 27.5 };
    pub const as0: Freq = .{ .h = 29.135 };
    /// B0, the lowest note of a 5 string bass
    pub const b0: Freq = .{ .h = 30.868 };
    /// C1, the lowest note of double bass with C extension
    pub const c1: Freq = .{ .h = 32.703 };
    pub const cs1: Freq = .{ .h = 34.648 };
    pub const d1: Freq = .{ .h = 36.708 };
    pub const ds1: Freq = .{ .h = 38.891 };
    /// E1, the lowest note of a bass
    pub const e1: Freq = .{ .h = 41.203 };
    pub const f1: Freq = .{ .h = 43.654 };
    pub const fs1: Freq = .{ .h = 46.249 };
    pub const g1: Freq = .{ .h = 48.999 };
    pub const gs1: Freq = .{ .h = 51.913 };
    pub const a1: Freq = .{ .h = 55.0 };
    pub const as1: Freq = .{ .h = 58.27 };
    pub const b1: Freq = .{ .h = 61.735 };
    pub const c2: Freq = .{ .h = 65.406 };
    pub const cs2: Freq = .{ .h = 69.296 };
    pub const d2: Freq = .{ .h = 73.416 };
    pub const ds2: Freq = .{ .h = 77.782 };
    /// E2, the lowest note of a guitar.
    pub const e2: Freq = .{ .h = 82.407 };
    pub const f2: Freq = .{ .h = 87.307 };
    pub const fs2: Freq = .{ .h = 92.499 };
    pub const g2: Freq = .{ .h = 97.999 };
    pub const gs2: Freq = .{ .h = 103.826 };
    pub const a2: Freq = .{ .h = 110.0 };
    pub const as2: Freq = .{ .h = 116.541 };
    pub const b2: Freq = .{ .h = 123.471 };
    pub const c3: Freq = .{ .h = 130.813 };
    pub const cs3: Freq = .{ .h = 138.591 };
    pub const d3: Freq = .{ .h = 146.832 };
    pub const ds3: Freq = .{ .h = 155.563 };
    pub const e3: Freq = .{ .h = 164.814 };
    pub const f3: Freq = .{ .h = 174.614 };
    pub const fs3: Freq = .{ .h = 184.997 };
    /// G3, the lowest note of a violin.
    pub const g3: Freq = .{ .h = 195.998 };
    pub const gs3: Freq = .{ .h = 207.652 };
    pub const a3: Freq = .{ .h = 220.0 };
    pub const as3: Freq = .{ .h = 233.082 };
    pub const b3: Freq = .{ .h = 246.942 };
    /// C4, the "middle C".
    pub const c4: Freq = .{ .h = 261.626 };
    pub const cs4: Freq = .{ .h = 277.183 };
    pub const d4: Freq = .{ .h = 293.665 };
    pub const ds4: Freq = .{ .h = 311.127 };
    pub const e4: Freq = .{ .h = 329.628 };
    pub const f4: Freq = .{ .h = 349.228 };
    pub const fs4: Freq = .{ .h = 369.994 };
    pub const g4: Freq = .{ .h = 391.995 };
    pub const gs4: Freq = .{ .h = 415.305 };
    /// A4, the tuning reference note.
    pub const a4: Freq = .{ .h = 440.0 };
    pub const as4: Freq = .{ .h = 466.164 };
    pub const b4: Freq = .{ .h = 493.883 };
    pub const c5: Freq = .{ .h = 523.251 };
    pub const cs5: Freq = .{ .h = 554.365 };
    pub const d5: Freq = .{ .h = 587.33 };
    pub const ds5: Freq = .{ .h = 622.254 };
    pub const e5: Freq = .{ .h = 659.255 };
    pub const f5: Freq = .{ .h = 698.456 };
    pub const fs5: Freq = .{ .h = 739.989 };
    pub const g5: Freq = .{ .h = 783.991 };
    pub const gs5: Freq = .{ .h = 830.609 };
    pub const a5: Freq = .{ .h = 880.0 };
    pub const as5: Freq = .{ .h = 932.328 };
    pub const b5: Freq = .{ .h = 987.767 };
    pub const c6: Freq = .{ .h = 1046.502 };
    pub const cs6: Freq = .{ .h = 1108.731 };
    pub const d6: Freq = .{ .h = 1174.659 };
    pub const ds6: Freq = .{ .h = 1244.508 };
    pub const e6: Freq = .{ .h = 1318.51 };
    pub const f6: Freq = .{ .h = 1396.913 };
    pub const fs6: Freq = .{ .h = 1479.978 };
    pub const g6: Freq = .{ .h = 1567.982 };
    pub const gs6: Freq = .{ .h = 1661.219 };
    pub const a6: Freq = .{ .h = 1760.0 };
    pub const as6: Freq = .{ .h = 1864.655 };
    pub const b6: Freq = .{ .h = 1975.533 };
    pub const c7: Freq = .{ .h = 2093.005 };
    pub const cs7: Freq = .{ .h = 2217.461 };
    pub const d7: Freq = .{ .h = 2349.318 };
    pub const ds7: Freq = .{ .h = 2489.016 };
    pub const e7: Freq = .{ .h = 2637.021 };
    pub const f7: Freq = .{ .h = 2793.826 };
    pub const fs7: Freq = .{ .h = 2959.955 };
    pub const g7: Freq = .{ .h = 3135.964 };
    pub const gs7: Freq = .{ .h = 3322.438 };
    pub const a7: Freq = .{ .h = 3520.0 };
    pub const as7: Freq = .{ .h = 3729.31 };
    pub const b7: Freq = .{ .h = 3951.066 };
    /// C8, the highest note of a piano.
    pub const c8: Freq = .{ .h = 4186.009 };
    pub const cs8: Freq = .{ .h = 4434.922 };
    pub const d8: Freq = .{ .h = 4698.636 };
    pub const ds8: Freq = .{ .h = 4978.032 };
    pub const e8: Freq = .{ .h = 5274.042 };
    pub const f8: Freq = .{ .h = 5587.652 };
    pub const fs8: Freq = .{ .h = 5919.91 };
    pub const g8: Freq = .{ .h = 6271.928 };
    pub const gs8: Freq = .{ .h = 6644.876 };
    pub const a8: Freq = .{ .h = 7040.0 };
    pub const as8: Freq = .{ .h = 7458.62 };
    pub const b8: Freq = .{ .h = 7902.132 };
    pub const c9: Freq = .{ .h = 8372.018 };
    pub const cs9: Freq = .{ .h = 8869.844 };
    pub const d9: Freq = .{ .h = 9397.272 };
    pub const ds9: Freq = .{ .h = 9956.064 };
    pub const e9: Freq = .{ .h = 10548.084 };
    pub const f9: Freq = .{ .h = 11175.304 };
    pub const fs9: Freq = .{ .h = 11839.82 };
    pub const g9: Freq = .{ .h = 12543.856 };
    /// G#9, MIDI note #128, the top of the MIDI tuning range.
    pub const gs9: Freq = .{ .h = 13289.752 };
    pub const a9: Freq = .{ .h = 14080.0 };
    pub const as9: Freq = .{ .h = 14917.24 };
    /// B9. For most of adults, it is already beyond the hearing range.
    pub const b9: Freq = .{ .h = 15804.264 };

    pub fn hz(h: f32) Freq {
        return .{ .h = h };
    }

    pub fn midi(note: u8) Freq {
        // https://inspiredacoustics.com/en/MIDI_note_numbers_and_center_frequencies
        // https://en.wikipedia.org/wiki/Musical_note#MIDI
        var f: f32 = switch (note % 12) {
            0 => 8.1758,
            1 => 8.66,
            2 => 9.18,
            3 => 9.72,
            4 => 10.30,
            5 => 10.91,
            6 => 11.56,
            7 => 12.25,
            8 => 12.98,
            9 => 13.75,
            10 => 14.57,
            else => 15.43,
        };
        const oct: u4 = @intCast(note / 12);
        f *= @floatFromInt(@as(u16, 1) << oct);
        return .{ .h = f };
    }
};

pub const Time = struct {
    s: u32,

    pub const zero: Time = .{ .s = 0 };

    pub fn samples(s: u32) Time {
        return .{ .s = s };
    }

    pub fn seconds(s: u32) Time {
        return .{ .s = s * sample_rate };
    }

    pub fn ms(s: u32) Time {
        return .{ .s = s * sample_rate / 1000 };
    }
};

fn NodeMixin(comptime T: type) type {
    return struct {
        const Self = @This();

        fn nodeId(self: *const Self) u32 {
            const parent: *const T = @alignCast(@fieldParentPtr("node", self));
            return parent.id;
        }

        /// Reset the node state to how it was when it was just added.
        pub fn reset(self: *const Self) void {
            bindings.reset(self.nodeId());
        }

        /// Reset the node and all child nodes to the state to how it was when they were just added.
        pub fn resetAll(self: *const Self) void {
            bindings.reset_all(self.nodeId());
        }

        /// Remove all child nodes.
        ///
        /// After it is called, you should make sure to discard all references to the old
        /// child nodes.
        pub fn clear(self: *const Self) void {
            bindings.clear(self.nodeId());
        }
    };
}

/// Linear (ramp up or down) envelope.
///
/// It looks like this: `⎽╱⎺` or `⎺╲⎽`.
///
/// The value before `start_at` is `start`, the value after `end_at` is `end`,
/// and the value between `start_at` and `end_at` changes linearly from `start` to `end`.
pub const LinearModulator = struct {
    start_at: Time,
    end_at: Time,

    pub fn modulate(self: LinearModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_linear(node_id, param, low, high, self.start_at.s, self.end_at.s);
    }
};

/// Hold envelope.
///
/// It looks like this: `⎽│⎺` or `⎺│⎽`.
///
/// The value before `time` is `before` and the value after `time` is `after`.
/// Equivalent to [`LinearModulator`] with `start_at` being equal to `end_at`.
pub const HoldModulator = struct {
    time: Time,

    fn modulate(self: HoldModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_hold(node_id, param, low, high, self.time.s);
    }
};

/// ADSR envelope.
///
/// It looks like this: `🭋🭍🬹🬿`
///
///  1. Until `attack`, the value goes from 0 to 1;
///  2. Until `decay`, it goes from 1 to `sustain_level`;
///  3. Until `sustain`, it holds `sustain_level`;
///  4. Until `release`, it goes from `sustain_level` to 0;
///  5. After `release`, it holds 0.
///
/// Most commonly used with [`Gain`].
pub const AdsrModulator = struct {
    /// When the value reaches 1.
    attack: Time,
    /// When the value reaches `sustain_level`.
    decay: Time,
    /// Until when the value holds `sustain_level`.
    sustain: Time,
    /// The value generated from `decay` until `sustain`.
    sustain_level: f32,
    /// When the value drops to 0.
    release: Time,

    fn modulate(self: AdsrModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_adsr(
            node_id,
            param,
            low,
            high,
            self.attack.s,
            self.decay.s,
            self.sustain.s,
            self.sustain_level,
            self.release.s,
        );
    }
};

/// Sine wave low-frequency oscillator.
///
/// It looks like this: `∿`.
///
/// `low` is the lowest produced value, `high` is the highest.
pub const SineModulator = struct {
    f: Freq,

    fn modulate(self: SineModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_sine(node_id, param, self.f.h, low, high);
    }
};

/// Square wave low-frequency oscillator.
///
/// It looks like this: `🭿🭾🭿🭾🭿🭾🭿🭾`.
pub const SquareModulator = struct {
    period: Time,

    fn modulate(self: SquareModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_square(node_id, param, low, high, self.period.s);
    }
};

/// Sawtooth wave low-frequency oscillator.
///
/// It looks like this: `╱│╱│╱│╱│`.
pub const SawtoothModulator = struct {
    period: Time,

    fn modulate(self: SawtoothModulator, node_id: u32, param: u32, low: f32, high: f32) void {
        bindings.mod_sawtooth(node_id, param, low, high, self.period.s);
    }
};

// const Node = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
// };

// pub const BaseNode = Node;

// pub const Sine = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate oscillation frequency.
//     pub fn modulate(self: Sine, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const Mix = Node;
// pub const AllForOne = Node;
// pub const Gain = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the gain level.
//     pub fn modulate(self: Gain, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 0, low, high);
//     }
// };
// pub const Loop = Node;
// pub const Concat = Node;
// pub const Pan = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the pan value (from 0. to 1.: 0. is only left, 1. is only right).
//     pub fn modulate(self: Pan, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 0, low, high);
//     }
// };
// pub const Mute = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the muted state.
//     ///
//     /// Below 0.5 is muted, above is unmuted.
//     pub fn modulate(self: Mute, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 0, low, high);
//     }
// };
// pub const Pause = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the paused state.
//     ///
//     /// Below 0.5 is paused, above is playing.
//     pub fn modulate(self: Pause, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 0, low, high);
//     }
// };
// pub const TrackPosition = Node;
// pub const LowPass = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the cut-off frequency.
//     pub fn modulate_freq(self: LowPass, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const HighPass = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the cut-off frequency.
//     pub fn modulate_freq(self: HighPass, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const TakeLeft = Node;
// pub const TakeRight = Node;
// pub const Swap = Node;
// pub const Clip = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate the low cut amplitude and adjust the high amplitude to keep the gap.
//     ///
//     /// In other words, the difference between low and high cut points will stay the same.
//     pub fn modulate_both(self: Clip, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 0, low, high);
//     }
//     /// Modulate the low cut amplitude.
//     pub fn modulate_low(self: Clip, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 1, low, high);
//     }
//     /// Modulate the high cut amplitude.
//     pub fn modulate_high(self: Clip, low: f32, high: f32, mod: anytype) void {
//         mod.modulate(self.id, 2, low, high);
//     }
// };
// pub const Square = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate oscillation frequency.
//     pub fn modulate(self: Square, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const Sawtooth = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate oscillation frequency.
//     pub fn modulate(self: Sawtooth, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const Triangle = struct {
//     id: u32,
//     node: NodeMixin(@This()) = .{},
//     /// Modulate oscillation frequency.
//     pub fn modulate(self: Triangle, low: Freq, high: Freq, mod: anytype) void {
//         mod.modulate(self.id, 0, low.h, high.h);
//     }
// };
// pub const Noise = Node;
// pub const Empty = Node;
// pub const Zero = Node;
// pub const File = Node;

const Out = struct {};

pub const out: Node(Out) = .{ .id = 0 };

/// Sine wave oscillator source (`∿`).
pub const Sine = struct { f: Freq, phase: f32 };

/// Square wave oscillator source (`⎍`).
pub const Square = struct { f: Freq, phase: f32 };

/// Sawtooth wave oscillator source (`╱│`).
pub const Sawtooth = struct { f: Freq, phase: f32 };

/// Triangle wave oscillator source (`╱╲`).
pub const Triangle = struct { f: Freq, phase: f32 };

/// White noise source (amplitude on each tick is random).
pub const Noise = struct { seed: i32 };

/// Always stopped source.
pub const Empty = struct {};

/// Silent source producing zeros.
pub const Zero = struct {};

/// An audio file from ROM.
pub const File = struct { path: []const u8 };

/// Node simply mixing all inputs.
pub const Mix = struct {};

/// Mixer node that stops if any of the sources stops.
pub const AllForOne = struct {};

/// Gain control node.
pub const Gain = struct { lvl: f32 };

/// A loop node that resets the input if it stops.
pub const Loop = struct {};

/// A node that plays the inputs one after the other, in the order as they added.
pub const Concat = struct {};

/// Node panning the audio to the left (0.), right (1.), or something in between.
pub const Pan = struct { lvl: f32 };

/// Node that can be muted using modulation.
pub const Mute = struct {};

/// Node that can be paused using modulation.
pub const Pause = struct {};

/// Node tracking the elapsed playback time.
pub const TrackPosition = struct {};

/// Lowpass filter node.
pub const LowPass = struct { freq: Freq, q: f32 };

/// Highpass filter node.
pub const HighPass = struct { freq: Freq, q: f32 };

/// Node converting stereo to mono by taking the left channel.
pub const TakeLeft = struct {};

/// Node converting stereo to mono by taking the right channel.
pub const TakeRight = struct {};

/// Node swapping left and right channels of the stereo input.
pub const Swap = struct {};

/// Node clamping the input amplitude. Can be used for hard distortion.
pub const Clip = struct { low: f32, high: f32 };

fn addNode(parent: anytype, comptime T: type, node: T) Node(T) {
    const id = switch (T) {
        Sine => bindings.add_sine(parent.id, node.f.h, node.phase),
        Square => bindings.add_square(parent.id, node.f.h, node.phase),
        Sawtooth => bindings.add_sawtooth(parent.id, node.f.h, node.phase),
        Triangle => bindings.add_triangle(parent.id, node.f.h, node.phase),
        Noise => bindings.add_noise(parent.id, node.seed),
        Empty => bindings.add_empty(parent.id),
        Zero => bindings.add_zero(parent.id),
        File => bindings.add_file(parent.id, @intFromPtr(node.path.ptr), node.path.len),
        Mix => bindings.add_mix(parent.id),
        AllForOne => bindings.add_all_for_one(parent.id),
        Gain => bindings.add_gain(parent.id, node.lvl),
        Loop => bindings.add_loop(parent.id),
        Concat => bindings.add_concat(parent.id),
        Pan => bindings.add_pan(parent.id, node.lvl),
        Mute => bindings.add_mute(parent.id),
        Pause => bindings.add_pause(parent.id),
        TrackPosition => bindings.add_track_position(parent.id),
        LowPass => bindings.add_low_pass(parent.id, node.freq.h, node.q),
        HighPass => bindings.add_high_pass(parent.id, node.freq.h, node.q),
        TakeLeft => bindings.add_take_left(parent.id),
        TakeRight => bindings.add_take_right(parent.id),
        Swap => bindings.add_swap(parent.id),
        Clip => bindings.add_clip(parent.id, node.low, node.high),
        else => {
            @compileError("not a valid Node");
        },
    };
    return Node(T){ .id = id };
}

pub fn Node(T: type) type {
    return switch (T) {
        Out => struct {
            id: u32,

            pub fn add(self: @This(), comptime N: type, node: N) Node(N) {
                return addNode(self, N, node);
            }
        },
        Sine => struct {
            id: u32,

            pub fn add(self: @This(), comptime N: type, node: N) Node(N) {
                return addNode(self, N, node);
            }
        },
        Square => struct {
            id: u32,
        },
        Sawtooth => struct {
            id: u32,
        },
        Triangle => struct {
            id: u32,
        },
        Noise => struct {
            id: u32,
        },
        Empty => struct {
            id: u32,
        },
        Zero => struct {
            id: u32,
        },
        File => struct {
            id: u32,
        },
        Mix => struct {
            id: u32,
        },
        AllForOne => struct {
            id: u32,
        },
        Gain => struct {
            id: u32,
            pub fn add(self: @This(), comptime N: type, node: N) Node(N) {
                return addNode(self, N, node);
            }
            /// Modulate the gain level.
            pub fn modulate(self: @This(), low: f32, high: f32, mod: anytype) void {
                mod.modulate(self.id, 0, low, high);
            }
        },
        Loop => struct {
            id: u32,
        },
        Concat => struct {
            id: u32,
        },
        Pan => struct {
            id: u32,
        },
        Mute => struct {
            id: u32,
        },
        Pause => struct {
            id: u32,
        },
        TrackPosition => struct {
            id: u32,
        },
        LowPass => struct {
            id: u32,
        },
        HighPass => struct {
            id: u32,
        },
        TakeLeft => struct {
            id: u32,
        },
        TakeRight => struct {
            id: u32,
        },
        Swap => struct {
            id: u32,
        },
        Clip => struct {
            id: u32,
        },
        else => {
            @compileError("not a valid Node");
        },
    };
}
