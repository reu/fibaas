import com.twitter.finagle.http.Request
import com.twitter.finatra.http.Controller
import com.twitter.finatra.http.HttpServer
import com.twitter.finatra.http.routing.HttpRouter

object FibaasServer extends HttpServer {
  override val disableAdminHttpServer = true
  override val defaultFinatraHttpPort: String = ":4000"

  override def configureHttp(router: HttpRouter) {
    router.add[FibaasController]
  }
}

class FibaasController extends Controller {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  get("/:number") { request: Request =>
    fib(request.params("number").toInt).toString
  }
}
