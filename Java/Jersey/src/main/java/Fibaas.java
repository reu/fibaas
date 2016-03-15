import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.server.ResourceConfig;

import java.io.IOException;
import java.net.URI;

@Path("/")
public class Fibaas {
	public static void main(String[] args) throws IOException {
		final ResourceConfig rc = new ResourceConfig(Fibaas.class);
		GrizzlyHttpServerFactory.createHttpServer(URI.create("http://localhost:4000/"), rc);
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
