import org.http4s._
import org.http4s.server._
import org.http4s.server.blaze.BlazeBuilder
import org.http4s.dsl._

object Main extends App {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  val service = HttpService {
    case GET -> Root / number =>
      Ok(fib(number.toInt).toString)
  }

  BlazeBuilder.bindHttp(4000)
    .mountService(service, "/")
    .run
    .awaitShutdown()
}
