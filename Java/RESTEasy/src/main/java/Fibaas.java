import java.io.IOException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import org.jboss.resteasy.plugins.server.tjws.TJWSEmbeddedJaxrsServer;

@Path("/")
public class Fibaas {
	public static void main(String[] args) throws IOException {
		TJWSEmbeddedJaxrsServer tjws = new TJWSEmbeddedJaxrsServer();
		tjws.setPort(4000);
		tjws.getDeployment().getActualResourceClasses().add(Fibaas.class);
		tjws.start();
	}

	@GET
	@Path("{number}")
	public String fibonacciHandler(@PathParam("number") int number) {
		return Integer.toString(fib(number));
	}

	public static int fib(int n) {
		if (n == 0) {
			return 0;
		} else if (n == 1) {
			return 1;
		} else {
			return fib(n - 1) + fib(n - 2);
		}
	}
}
