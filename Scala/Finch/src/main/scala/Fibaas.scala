import com.twitter.finagle.Http
import com.twitter.util.Await

import io.finch._

object Main extends App {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  val router: Endpoint[String] = get(int) { number: Int =>
    Ok(fib(number).toString)
  }

  Await.ready(Http.server.serve(":4000", router.toService))
}
