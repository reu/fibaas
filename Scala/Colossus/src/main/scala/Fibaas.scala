import akka.actor.ActorSystem
import colossus._
import service._
import protocols.http._
import UrlParsing._
import HttpMethod._

object Main extends App {
  implicit val actorSystem = ActorSystem()
  implicit val ioSystem = IOSystem()

  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  Service.become[Http]("fibaas", 4000) {
    case request @ Get on Root / number =>
      Callback.successful(request.ok(fib(number.toInt).toString))
  }
}
