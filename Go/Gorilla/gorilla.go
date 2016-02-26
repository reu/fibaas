package main

import (
	"fmt"
	"github.com/gorilla/mux"
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
	vars := mux.Vars(r)
	number, _ := strconv.Atoi(vars["number"])
	fmt.Fprintln(w, fib(number))
}

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())

	router := mux.NewRouter()
	router.HandleFunc("/{number}", fibHandler)

	http.Handle("/", router)
	http.ListenAndServe(":4000", nil)
}
