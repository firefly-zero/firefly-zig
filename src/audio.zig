const bindings = @import("./bindings.zig").audio;

pub const sample_rate: u32 = 44_100;

pub const Freq = struct {
    h: f32,

    pub const zero = Freq{ .h = 0 };
    /// C0, MIDI note #12
    pub const c0 = Freq{ .h = 16.351 };
    pub const cs0 = Freq{ .h = 17.324 };
    pub const d0 = Freq{ .h = 18.354 };
    pub const ds0 = Freq{ .h = 19.445 };
    pub const e0 = Freq{ .h = 20.601 };
    pub const f0 = Freq{ .h = 21.827 };
    pub const fs0 = Freq{ .h = 23.124 };
    pub const g0 = Freq{ .h = 24.499 };
    pub const gs0 = Freq{ .h = 25.956 };
    /// A0, the lowest note of a piano
    pub const a0 = Freq{ .h = 27.5 };
    pub const as0 = Freq{ .h = 29.135 };
    /// B0, the lowest note of a 5 string bass
    pub const b0 = Freq{ .h = 30.868 };
    /// C1, the lowest note of double bass with C extension
    pub const c1 = Freq{ .h = 32.703 };
    pub const cs1 = Freq{ .h = 34.648 };
    pub const d1 = Freq{ .h = 36.708 };
    pub const ds1 = Freq{ .h = 38.891 };
    /// E1, the lowest note of a bass
    pub const e1 = Freq{ .h = 41.203 };
    pub const f1 = Freq{ .h = 43.654 };
    pub const fs1 = Freq{ .h = 46.249 };
    pub const g1 = Freq{ .h = 48.999 };
    pub const gs1 = Freq{ .h = 51.913 };
    pub const a1 = Freq{ .h = 55.0 };
    pub const as1 = Freq{ .h = 58.27 };
    pub const b1 = Freq{ .h = 61.735 };
    pub const c2 = Freq{ .h = 65.406 };
    pub const cs2 = Freq{ .h = 69.296 };
    pub const d2 = Freq{ .h = 73.416 };
    pub const ds2 = Freq{ .h = 77.782 };
    /// E2, the lowest note of a guitar.
    pub const e2 = Freq{ .h = 82.407 };
    pub const f2 = Freq{ .h = 87.307 };
    pub const fs2 = Freq{ .h = 92.499 };
    pub const g2 = Freq{ .h = 97.999 };
    pub const gs2 = Freq{ .h = 103.826 };
    pub const a2 = Freq{ .h = 110.0 };
    pub const as2 = Freq{ .h = 116.541 };
    pub const b2 = Freq{ .h = 123.471 };
    pub const c3 = Freq{ .h = 130.813 };
    pub const cs3 = Freq{ .h = 138.591 };
    pub const d3 = Freq{ .h = 146.832 };
    pub const ds3 = Freq{ .h = 155.563 };
    pub const e3 = Freq{ .h = 164.814 };
    pub const f3 = Freq{ .h = 174.614 };
    pub const fs3 = Freq{ .h = 184.997 };
    /// G3, the lowest note of a violin.
    pub const g3 = Freq{ .h = 195.998 };
    pub const gs3 = Freq{ .h = 207.652 };
    pub const a3 = Freq{ .h = 220.0 };
    pub const as3 = Freq{ .h = 233.082 };
    pub const b3 = Freq{ .h = 246.942 };
    /// C4, the "middle C".
    pub const c4 = Freq{ .h = 261.626 };
    pub const cs4 = Freq{ .h = 277.183 };
    pub const d4 = Freq{ .h = 293.665 };
    pub const ds4 = Freq{ .h = 311.127 };
    pub const e4 = Freq{ .h = 329.628 };
    pub const f4 = Freq{ .h = 349.228 };
    pub const fs4 = Freq{ .h = 369.994 };
    pub const g4 = Freq{ .h = 391.995 };
    pub const gs4 = Freq{ .h = 415.305 };
    /// A4, the tuning reference note.
    pub const a4 = Freq{ .h = 440.0 };
    pub const as4 = Freq{ .h = 466.164 };
    pub const b4 = Freq{ .h = 493.883 };
    pub const c5 = Freq{ .h = 523.251 };
    pub const cs5 = Freq{ .h = 554.365 };
    pub const d5 = Freq{ .h = 587.33 };
    pub const ds5 = Freq{ .h = 622.254 };
    pub const e5 = Freq{ .h = 659.255 };
    pub const f5 = Freq{ .h = 698.456 };
    pub const fs5 = Freq{ .h = 739.989 };
    pub const g5 = Freq{ .h = 783.991 };
    pub const gs5 = Freq{ .h = 830.609 };
    pub const a5 = Freq{ .h = 880.0 };
    pub const as5 = Freq{ .h = 932.328 };
    pub const b5 = Freq{ .h = 987.767 };
    pub const c6 = Freq{ .h = 1046.502 };
    pub const cs6 = Freq{ .h = 1108.731 };
    pub const d6 = Freq{ .h = 1174.659 };
    pub const ds6 = Freq{ .h = 1244.508 };
    pub const e6 = Freq{ .h = 1318.51 };
    pub const f6 = Freq{ .h = 1396.913 };
    pub const fs6 = Freq{ .h = 1479.978 };
    pub const g6 = Freq{ .h = 1567.982 };
    pub const gs6 = Freq{ .h = 1661.219 };
    pub const a6 = Freq{ .h = 1760.0 };
    pub const as6 = Freq{ .h = 1864.655 };
    pub const b6 = Freq{ .h = 1975.533 };
    pub const c7 = Freq{ .h = 2093.005 };
    pub const cs7 = Freq{ .h = 2217.461 };
    pub const d7 = Freq{ .h = 2349.318 };
    pub const ds7 = Freq{ .h = 2489.016 };
    pub const e7 = Freq{ .h = 2637.021 };
    pub const f7 = Freq{ .h = 2793.826 };
    pub const fs7 = Freq{ .h = 2959.955 };
    pub const g7 = Freq{ .h = 3135.964 };
    pub const gs7 = Freq{ .h = 3322.438 };
    pub const a7 = Freq{ .h = 3520.0 };
    pub const as7 = Freq{ .h = 3729.31 };
    pub const b7 = Freq{ .h = 3951.066 };
    /// C8, the highest note of a piano.
    pub const c8 = Freq{ .h = 4186.009 };
    pub const cs8 = Freq{ .h = 4434.922 };
    pub const d8 = Freq{ .h = 4698.636 };
    pub const ds8 = Freq{ .h = 4978.032 };
    pub const e8 = Freq{ .h = 5274.042 };
    pub const f8 = Freq{ .h = 5587.652 };
    pub const fs8 = Freq{ .h = 5919.91 };
    pub const g8 = Freq{ .h = 6271.928 };
    pub const gs8 = Freq{ .h = 6644.876 };
    pub const a8 = Freq{ .h = 7040.0 };
    pub const as8 = Freq{ .h = 7458.62 };
    pub const b8 = Freq{ .h = 7902.132 };
    pub const c9 = Freq{ .h = 8372.018 };
    pub const cs9 = Freq{ .h = 8869.844 };
    pub const d9 = Freq{ .h = 9397.272 };
    pub const ds9 = Freq{ .h = 9956.064 };
    pub const e9 = Freq{ .h = 10548.084 };
    pub const f9 = Freq{ .h = 11175.304 };
    pub const fs9 = Freq{ .h = 11839.82 };
    pub const g9 = Freq{ .h = 12543.856 };
    /// G#9, MIDI note #128, the top of the MIDI tuning range.
    pub const gs9 = Freq{ .h = 13289.752 };
    pub const a9 = Freq{ .h = 14080.0 };
    pub const as9 = Freq{ .h = 14917.24 };
    /// B9. For most of adults, it is already beyond the hearing range.
    pub const b9 = Freq{ .h = 15804.264 };

    pub fn hz(h: f32) Freq {
        return Freq{ .h = h };
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
        const oct = note / 12;
        f *= @floatFromInt(1 << oct);
        return Freq{ .h = f };
    }
};

pub const Time = struct {
    s: u32,

    pub const zero = Time{ .s = 0 };

    pub fn samples(s: u32) Time {
        return Time{ .s = s };
    }

    pub fn seconds(s: u32) Time {
        return Time{ .s = s * sample_rate };
    }

    pub fn ms(s: u32) Time {
        return Time{ .s = s * sample_rate / 1000 };
    }
};

fn NodeMixin(comptime T: type) type {
    return struct {
        const Self = @This();

        fn parentId(self: *const Self) u32 {
            const parent: *const T = @alignCast(@fieldParentPtr("node", self));
            return parent.id;
        }

        /// Add sine wave oscillator source (`∿`).
        pub fn addSine(self: *const Self, f: Freq, phase: f32) Sine {
            const id = bindings.add_sine(self.parentId(), f.h, phase);
            return Sine{ .id = id };
        }

        /// Add square wave oscillator source (`⎍`).
        pub fn addSquare(self: *const Self, f: Freq, phase: f32) Square {
            const id = bindings.add_square(self.parentId(), f.h, phase);
            return Square{ .id = id };
        }

        /// Add sawtooth wave oscillator source (`╱│`).
        pub fn addSawtooth(self: *const Self, f: Freq, phase: f32) Sawtooth {
            const id = bindings.add_sawtooth(self.parentId(), f.h, phase);
            return Sawtooth{ .id = id };
        }

        /// Add triangle wave oscillator source (`╱╲`).
        pub fn addTriangle(self: *const Self, f: Freq, phase: f32) Triangle {
            const id = bindings.add_triangle(self.parentId(), f.h, phase);
            return Triangle{ .id = id };
        }

        /// Add white noise source (amplitude on each tick is random).
        pub fn addNoise(self: *const Self, seed: i32) Noise {
            const id = bindings.add_noise(self.parentId(), seed);
            return Noise{ .id = id };
        }

        /// Add always stopped source.
        pub fn addEmpty(self: *const Self) Empty {
            const id = bindings.add_empty(self.parentId());
            return Empty{ .id = id };
        }

        /// Add silent source producing zeros.
        pub fn addZero(self: *const Self) Zero {
            const id = bindings.add_zero(self.parentId());
            return Zero{ .id = id };
        }

        /// Add node simply mixing all inputs.
        pub fn addMix(self: *const Self) Mix {
            const id = bindings.add_mix(self.parentId());
            return Mix{ .id = id };
        }

        /// Add mixer node that stops if any of the sources stops.
        pub fn addAllForOne(self: *const Self) AllForOne {
            const id = bindings.add_all_for_one(self.parentId());
            return AllForOne{ .id = id };
        }

        /// Add gain control node.
        pub fn addGain(self: *const Self, lvl: f32) Gain {
            const id = bindings.add_gain(self.parentId(), lvl);
            return Gain{ .id = id };
        }

        /// Add a loop node that resets the input if it stops.
        pub fn addLoop(self: *const Self) Loop {
            const id = bindings.add_loop(self.parentId());
            return Loop{ .id = id };
        }

        /// Add a node that plays the inputs one after the other, in the order as they added.
        pub fn addConcat(self: *const Self) Concat {
            const id = bindings.add_concat(self.parentId());
            return Concat{ .id = id };
        }

        /// Add node panning the audio to the left (0.), right (1.), or something in between.
        pub fn addPan(self: *const Self, lvl: f32) Pan {
            const id = bindings.add_pan(self.parentId(), lvl);
            return Pan{ .id = id };
        }

        /// Add node that can be muted using modulation.
        pub fn addMute(self: *const Self) Mute {
            const id = bindings.add_mute(self.parentId());
            return Mute{ .id = id };
        }

        /// Add node that can be paused using modulation.
        pub fn addPause(self: *const Self) Pause {
            const id = bindings.add_pause(self.parentId());
            return Pause{ .id = id };
        }

        /// Add node tracking the elapsed playback time.
        pub fn addTrackPosition(self: *const Self) TrackPosition {
            const id = bindings.add_track_position(self.parentId());
            return TrackPosition{ .id = id };
        }

        /// Add lowpass filter node.
        pub fn addLowPass(self: *const Self, freq: f32, q: f32) LowPass {
            const id = bindings.add_low_pass(self.parentId(), freq, q);
            return LowPass{ .id = id };
        }

        /// Add highpass filter node.
        pub fn addHighPass(self: *const Self, freq: f32, q: f32) HighPass {
            const id = bindings.add_high_pass(self.parentId(), freq, q);
            return HighPass{ .id = id };
        }

        /// Add node converting stereo to mono by taking the left channel.
        pub fn addTakeLeft(self: *const Self) TakeLeft {
            const id = bindings.add_take_left(self.parentId());
            return TakeLeft{ .id = id };
        }

        /// Add node converting stereo to mono by taking the right channel.
        pub fn addTakeRight(self: *const Self) TakeRight {
            const id = bindings.add_take_right(self.parentId());
            return TakeRight{ .id = id };
        }

        /// Add node swapping left and right channels of the stereo input.
        pub fn addSwap(self: *const Self) Swap {
            const id = bindings.add_swap(self.parentId());
            return Swap{ .id = id };
        }

        /// Add node clamping the input amplitude. Can be used for hard distortion.
        pub fn addClip(self: *const Self, low: f32, high: f32) Clip {
            const id = bindings.add_clip(self.parentId(), low, high);
            return Clip{ .id = id };
        }

        /// Reset the node state to how it was when it was just added.
        pub fn reset(self: *const Self) void {
            bindings.reset(self.parentId());
        }

        /// Reset the node and all child nodes to the state to how it was when they were just added.
        pub fn reset_all(self: *const Self) void {
            bindings.reset_all(self.parentId());
        }

        /// Remove all child nodes.
        ///
        /// After it is called, you should make sure to discard all references to the old
        /// child nodes.
        pub fn clear(self: *const Self) void {
            bindings.clear(self.parentId());
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
    start: f32,
    end: f32,
    start_at: Time,
    end_at: Time,

    pub fn modulate(self: LinearModulator, node_id: u32, param: u32) void {
        bindings.mod_linear(node_id, param, self.start, self.end, self.start_at.s, self.end_at.s);
    }
};

/// Hold envelope.
///
/// It looks like this: `⎽│⎺` or `⎺│⎽`.
///
/// The value before `time` is `before` and the value after `time` is `after`.
/// Equivalent to [`LinearModulator`] with `start_at` being equal to `end_at`.
pub const HoldModulator = struct {
    before: f32,
    after: f32,
    time: Time,

    fn modulate(self: HoldModulator, node_id: u32, param: u32) void {
        bindings.mod_hold(node_id, param, self.before, self.after, self.time.s);
    }
};

/// Sine wave low-frequency oscillator.
///
/// It looks like this: `∿`.
///
/// `low` is the lowest produced value, `high` is the highest.
pub const SineModulator = struct {
    f: Freq,
    low: f32,
    high: f32,

    fn modulate(self: SineModulator, node_id: u32, param: u32) void {
        bindings.mod_sine(node_id, param, self.f.h, self.low, self.high);
    }
};

pub const Modulator = union(enum) {
    linear: LinearModulator,
    hold: HoldModulator,
    sine: SineModulator,

    fn modulate(self: Modulator, node_id: u32, param: u32) void {
        switch (self) {
            inline else => |case| case.modulate(node_id, param),
        }
    }
};

const Node = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
};

pub const BaseNode = Node;

pub const Sine = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate oscillation frequency.
    pub fn modulate(self: Sine, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Mix = Node;
pub const AllForOne = Node;
pub const Gain = struct {
    id:u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the gain level.
    pub fn modulate(self: Gain, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Loop = Node;
pub const Concat = Node;
pub const Pan = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the pan value (from 0. to 1.: 0. is only left, 1. is only right).
    pub fn modulate(self: Pan, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Mute = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the muted state.
    ///
    /// Below 0.5 is muted, above is unmuted.
    pub fn modulate(self: Mute, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Pause = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the paused state.
    ///
    /// Below 0.5 is paused, above is playing.
    pub fn modulate(self: Pause, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const TrackPosition = Node;
pub const LowPass = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the cut-off frequency.
    pub fn modulate_freq(self: LowPass, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const HighPass = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the cut-off frequency.
    pub fn modulate_freq(self: HighPass, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const TakeLeft = Node;
pub const TakeRight = Node;
pub const Swap = Node;
pub const Clip = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate the low cut amplitude and adjust the high amplitude to keep the gap.
    ///
    /// In other words, the difference between low and high cut points will stay the same.
    pub fn modulate_both(self: Clip, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
    /// Modulate the low cut amplitude.
    pub fn modulate_low(self: Clip, mod: Modulator) void {
        mod.modulate(self.id, 1);
    }
    /// Modulate the high cut amplitude.
    pub fn modulate_high(self: Clip, mod: Modulator) void {
        mod.modulate(self.id, 2);
    }
};
pub const Square = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate oscillation frequency.
    pub fn modulate(self: Square, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Sawtooth = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate oscillation frequency.
    pub fn modulate(self: Sawtooth, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Triangle = struct {
    id: u32,
    node: NodeMixin(@This()) = .{},
    /// Modulate oscillation frequency.
    pub fn modulate(self: Triangle, mod: Modulator) void {
        mod.modulate(self.id, 0);
    }
};
pub const Noise = Node;
pub const Empty = Node;
pub const Zero = Node;
pub const File = Node;

pub const out: BaseNode = .{ .id = 0 };
