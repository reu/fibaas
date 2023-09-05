use axum::{extract::Path, routing::get, Router, Server};

fn fib(n: u64) -> u64 {
    match n {
        0 | 1 => n,
        n => fib(n - 1) + fib(n - 2),
    }
}

#[tokio::main]
async fn main() {
    let app = Router::new().route(
        "/:number",
        get(|Path(n): Path<u64>| async move { fib(n).to_string() }),
    );

    Server::bind(&"0.0.0.0:4000".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}
