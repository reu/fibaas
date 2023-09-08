use warp::Filter;

fn fib(n: u64) -> u64 {
    match n {
        0 | 1 => n,
        n => fib(n - 1) + fib(n - 2),
    }
}

#[tokio::main]
async fn main() {
    warp::serve(warp::path::param().map(|n: u64| fib(n).to_string()))
        .run(([0, 0, 0, 0], 4000))
        .await;
}
