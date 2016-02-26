import static spark.Spark.get;
import static spark.Spark.port;

public class Fibaas {
	public static void main(String[] args) {
		port(4000);
		get("/:number", (req, res) -> {
			int number = Integer.parseInt(req.params(":number"));
			return Integer.toString(fib(number));
		});
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
