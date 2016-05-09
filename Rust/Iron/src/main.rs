extern crate iron;
#[macro_use]
extern crate router;

use iron::prelude::*;
use iron::status;
use router::Router;

fn fib(n: u32) -> u32 {
  match n {
    0 => 0,
    1 => 1,
    _ => fib(n - 1) + fib(n - 2),
  }
}

fn main() {
  let router = router!(get "/:num" => index);
  Iron::new(router).http("localhost:4000").unwrap();

  fn index(req: &mut Request) -> IronResult<Response> {
    let ref num = req.extensions.get::<Router>().unwrap().find("num").unwrap_or("/");
    Ok(Response::with((status::Ok, fib(num.parse::<u32>().unwrap()).to_string())))
  }
}
