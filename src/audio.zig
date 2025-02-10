const bindings = @import("./bindings.zig").audio;

pub const Freq = f32;
pub const Time = u32;

fn Node(comptime T: type) type {
    return struct {
        id: u32,
        pub usingnamespace T;

        /// Add sine wave oscillator source (`∿`).
        pub fn addSine(self: BaseNode, f: Freq, phase: f32) Sine {
            const id = bindings.add_sine(self.id, f, phase);
            return Sine{ .id = id };
        }

        /// Add square wave oscillator source (`⎍`).
        pub fn addSquare(self: BaseNode, f: Freq, phase: f32) Square {
            const id = bindings.add_square(self.id, f, phase);
            return Square{ .id = id };
        }

        /// Add sawtooth wave oscillator source (`╱│`).
        pub fn addSawtooth(self: BaseNode, f: Freq, phase: f32) Sawtooth {
            const id = bindings.add_sawtooth(self.id, f, phase);
            return Sawtooth{ .id = id };
        }

        /// Add triangle wave oscillator source (`╱╲`).
        pub fn addTriangle(self: BaseNode, f: Freq, phase: f32) Triangle {
            const id = bindings.add_triangle(self.id, f, phase);
            return Triangle{ .id = id };
        }

        /// Add white noise source (amplitude on each tick is random).
        pub fn addNoise(self: BaseNode, seed: i32) Noise {
            const id = bindings.add_noise(self.id, seed);
            return Noise{ .id = id };
        }

        /// Add always stopped source.
        pub fn addEmpty(self: BaseNode) Empty {
            const id = bindings.add_empty(self.id);
            return Empty{ .id = id };
        }

        /// Add silent source producing zeros.
        pub fn addZero(self: BaseNode) Zero {
            const id = bindings.add_zero(self.id);
            return Zero{ .id = id };
        }

        /// Add node simply mixing all inputs.
        pub fn addMix(self: BaseNode) Mix {
            const id = bindings.add_mix(self.id);
            return Mix{ .id = id };
        }

        /// Add mixer node that stops if any of the sources stops.
        pub fn addAllForOne(self: BaseNode) AllForOne {
            const id = bindings.add_all_for_one(self.id);
            return AllForOne{ .id = id };
        }

        /// Add gain control node.
        pub fn addGain(self: BaseNode, lvl: f32) Gain {
            const id = bindings.add_gain(self.id, lvl);
            return Gain{ .id = id };
        }

        /// Add a loop node that resets the input if it stops.
        pub fn addLoop(self: BaseNode) Loop {
            const id = bindings.add_loop(self.id);
            return Loop{ .id = id };
        }

        /// Add a node that plays the inputs one after the other, in the order as they added.
        pub fn addConcat(self: BaseNode) Concat {
            const id = bindings.add_concat(self.id);
            return Concat{ .id = id };
        }

        /// Add node panning the audio to the left (0.), right (1.), or something in between.
        pub fn addPan(self: BaseNode, lvl: f32) Pan {
            const id = bindings.add_pan(self.id, lvl);
            return Pan{ .id = id };
        }

        /// Add node that can be muted using modulation.
        pub fn addMute(self: BaseNode) Mute {
            const id = bindings.add_mute(self.id);
            return Mute{ .id = id };
        }

        /// Add node that can be paused using modulation.
        pub fn addPause(self: BaseNode) Pause {
            const id = bindings.add_pause(self.id);
            return Pause{ .id = id };
        }

        /// Add node tracking the elapsed playback time.
        pub fn addTrackPosition(self: BaseNode) TrackPosition {
            const id = bindings.add_track_position(self.id);
            return TrackPosition{ .id = id };
        }

        /// Add lowpass filter node.
        pub fn addLowPass(self: BaseNode, freq: f32, q: f32) LowPass {
            const id = bindings.add_low_pass(self.id, freq, q);
            return LowPass{ .id = id };
        }

        /// Add highpass filter node.
        pub fn addHighPass(self: BaseNode, freq: f32, q: f32) HighPass {
            const id = bindings.add_high_pass(self.id, freq, q);
            return HighPass{ .id = id };
        }

        /// Add node converting stereo to mono by taking the left channel.
        pub fn addTakeLeft(self: BaseNode) TakeLeft {
            const id = bindings.add_take_left(self.id);
            return TakeLeft{ .id = id };
        }

        /// Add node converting stereo to mono by taking the right channel.
        pub fn addTakeRight(self: BaseNode) TakeRight {
            const id = bindings.add_take_right(self.id);
            return TakeRight{ .id = id };
        }

        /// Add node swapping left and right channels of the stereo input.
        pub fn addSwap(self: BaseNode) Swap {
            const id = bindings.add_swap(self.id);
            return Swap{ .id = id };
        }

        /// Add node clamping the input amplitude. Can be used for hard distortion.
        pub fn addClip(self: BaseNode, low: f32, high: f32) Clip {
            const id = bindings.add_clip(self.id, low, high);
            return Clip{ .id = id };
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
pub const Mix = Node(struct {});
pub const AllForOne = Node(struct {});
pub const Gain = Node(struct {});
pub const Loop = Node(struct {});
pub const Concat = Node(struct {});
pub const Pan = Node(struct {});
pub const Mute = Node(struct {});
pub const Pause = Node(struct {});
pub const TrackPosition = Node(struct {});
pub const LowPass = Node(struct {});
pub const HighPass = Node(struct {});
pub const TakeLeft = Node(struct {});
pub const TakeRight = Node(struct {});
pub const Swap = Node(struct {});
pub const Clip = Node(struct {});
pub const Square = Node(struct {});
pub const Sawtooth = Node(struct {});
pub const Triangle = Node(struct {});
pub const Noise = Node(struct {});
pub const Empty = Node(struct {});
pub const Zero = Node(struct {});
pub const File = Node(struct {});

pub const out = BaseNode{ .id = 0 };
