const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day03.txt");

pub const GeneralPurposeAllocator: type = std.heap.GeneralPurposeAllocator(.{ .enable_memory_limit = true });

pub fn main() !void {
    var global_allocator: GeneralPurposeAllocator = GeneralPurposeAllocator{};
    var allocator = &global_allocator.allocator;

    var lines = List([12]bool).init(allocator);

    var lines1 = std.mem.split(data, "\n");
    while (lines1.next()) |line| {
        var line_data: [12]bool = undefined;
        for (line) |value, index| {
            if (index < 12) {
                line_data[index] = (value != 48);
            }
        }
        try lines.append(line_data);
    }

    var result: [12]u8 = undefined;

    var index: usize = 0;
    while (index < 12) : (index += 1) {
        var ones: usize = 0;
        var zeros: usize = 0;
        for (lines.items) |line| {
            if (line[index]) {
                ones += 1;
            } else {
                zeros += 1;
            }
        }

        if (ones > zeros) {
            result[index] = 1;
        } else {
            result[index] = 0;
        }
    }

    std.log.info("Result: {any}", .{result});
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
