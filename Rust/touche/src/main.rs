use touche::{Body, Request, Response, Server, StatusCode};

fn fib(n: u64) -> u64 {
    match n {
        0 | 1 => n,
        n => fib(n - 1) + fib(n - 2),
    }
}

fn main() -> std::io::Result<()> {
    Server::builder()
        .max_threads(400)
        .bind("0.0.0.0:4000")
        .serve(|req: Request<_>| {
            match req.uri().path().split('/').last().map(|n| n.parse::<u64>()) {
                Some(Ok(n)) => Response::builder()
                    .status(StatusCode::OK)
                    .header("content-type", "text/plain; charset=utf-8")
                    .body(Body::from(fib(n).to_string())),

                Some(Err(_)) => Response::builder()
                    .status(StatusCode::BAD_REQUEST)
                    .body(Body::empty()),

                _ => Response::builder()
                    .status(StatusCode::NOT_FOUND)
                    .body(Body::empty()),
            }
        })
}
