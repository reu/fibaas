package main

import (
	"fmt"
	"github.com/bmizerany/pat"
	"net/http"
	"runtime"
	"strconv"
)

func fib(n int) int {
	if n == 0 {
		return 0
	}
	if n == 1 {
		return 1
	}
	return fib(n-1) + fib(n-2)
}

func fibHandler(w http.ResponseWriter, r *http.Request) {
	number, _ := strconv.Atoi(r.URL.Query().Get(":number"))
	fmt.Fprintln(w, fib(number))
}

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())

	router := pat.New()
	router.Get("/:number", http.HandlerFunc(fibHandler))

	http.Handle("/", router)
	http.ListenAndServe(":4000", nil)
}
