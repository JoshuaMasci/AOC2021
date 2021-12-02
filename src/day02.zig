const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day02.txt");

pub fn main() !void {
    var x: i64 = 0;
    var y: i64 = 0;
    var aim: i64 = 0;

    var lines = std.mem.split(data, "\n");
    while (lines.next()) |line| {
        var op = line[0];

        var i: u64 = 1;
        while (line[i] != ' ') : (i += 1) {}
        var value = line[i + 1] - 48;
        std.log.info("OP: {c} Data: {}", .{ op, value });

        switch (op) {
            'f' => {
                x += value;
                y += aim * value;
            },
            'd' => {
                aim += value;
            },
            'u' => {
                aim -= value;
            },
            else => {},
        }
    }

    std.log.info("X: {} Y: {} T: {}", .{ x, y, x * y });
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;
