import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import org.glassfish.jersey.jetty.JettyHttpContainerFactory;
import org.glassfish.jersey.server.ResourceConfig;

import java.io.IOException;
import java.net.URI;

@Path("/")
public class Fibaas {
	public static final String BASE_URI = "http://localhost:4000/";

	public static void main(String[] args) throws IOException {
		final ResourceConfig rc = new ResourceConfig(Fibaas.class);
		JettyHttpContainerFactory.createServer(URI.create(BASE_URI), rc);
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
