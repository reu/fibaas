const std = @import("std");
const zap = @import("zap");

fn fibonacci(index: i32) i32 {
    if (index < 2) return index;
    return fibonacci(index - 1) + fibonacci(index - 2);
}

fn on_request_verbose(r: zap.SimpleRequest) void {
    if (r.path) |the_path| {
        const number = std.fmt.parseInt(i32, the_path[1..], 10) catch return;

        const fib = fibonacci(number);

        var buf: [2]u8 = undefined;
        const myString = std.fmt.bufPrint(&buf, "{d}", .{fib}) catch return;

        r.sendBody(myString) catch return;
    }
}

pub fn main() !void {
    var listener = zap.SimpleHttpListener.init(.{
        .port = 4000,
        .on_request = on_request_verbose,
        .log = false,
        .max_clients = 100000,
    });
    try listener.listen();

    std.debug.print("Listening on 0.0.0.0:4000\n", .{});

    zap.start(.{
        .threads = 4,
        .workers = 4,
    });
}
