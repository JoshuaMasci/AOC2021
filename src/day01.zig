const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day01.txt");

fn read_line(buf: []const u8) !i64 {
    var line_len = line.len;
    if (line[line_len - 1] == 13) {
        line_len = line_len - 1;
    }
    var value = try std.fmt.parseInt(i64, line[0..line_len], 10);
    return value;
}

pub const GeneralPurposeAllocator: type = std.heap.GeneralPurposeAllocator(.{ .enable_memory_limit = true });

pub fn main() !void {
    var lines = std.mem.split(data, "\n");

    var global_allocator: GeneralPurposeAllocator = GeneralPurposeAllocator{};
    var allocator = &global_allocator.allocator;

    var data_list = List(i64).init(allocator);
    while (lines.next()) |line| {
        var line_len = line.len;
        if (line[line_len - 1] == 13) {
            line_len = line_len - 1;
        }
        var value = try std.fmt.parseInt(i64, line[0..line_len], 10);
        try data_list.append(value);
    }

    var prev: i64 = std.math.maxInt(i64);
    var count: u64 = 0;

    var i: u64 = 2;
    while (i < data_list.items.len) : (i += 1) {
        var value = data_list.items[i] + data_list.items[i - 1] + data_list.items[i - 2];

        if (value > prev) {
            count += 1;
        }

        prev = value;
        std.log.info("Value: {} ", .{data_list.items[i]});
    }

    std.log.info("Count: {} ", .{count});
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
