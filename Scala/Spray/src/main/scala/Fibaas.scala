import akka.actor.{Actor, ActorSystem, Props}
import akka.io.IO
import akka.pattern.ask
import akka.util.Timeout

import scala.concurrent.duration._

import spray.can.Http
import spray.http._
import spray.routing._

class FibaasActor extends Actor with Fibaas {
  def actorRefFactory = context
  def receive = runRoute(router)
}

trait Fibaas extends HttpService {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  val router =
    path(IntNumber) { number =>
      get {
        complete {
          fib(number).toString
        }
      }
    }
}

object Main extends App {
  implicit val system = ActorSystem()

  val service = system.actorOf(Props[FibaasActor], "fibaas")

  implicit val timeout = Timeout(5.seconds)
  IO(Http) ? Http.Bind(service, interface = "localhost", port = 4000)
}
