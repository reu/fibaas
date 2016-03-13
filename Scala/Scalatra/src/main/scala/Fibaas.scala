import javax.servlet.ServletContext
import org.eclipse.jetty.server.Server
import org.eclipse.jetty.servlet. DefaultServlet
import org.eclipse.jetty.webapp.WebAppContext
import org.scalatra.{LifeCycle, ScalatraServlet}
import org.scalatra.servlet.ScalatraListener

object Main extends App {
  val server = new Server(4000)
  val context = new WebAppContext()

  context setContextPath "."
  context setResourceBase "."
  context addEventListener new ScalatraListener
  context addServlet (classOf[DefaultServlet], "/")

  server.setHandler(context)
  server.start
  server.join
}

class ScalatraBootstrap extends LifeCycle {
  override def init(context: ServletContext) {
    context mount (new Fibaas, "/*")
  }
}

class Fibaas extends ScalatraServlet {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  get("/:number") {
    fib(params("number").toInt).toString
  }
}
