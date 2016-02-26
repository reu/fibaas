package main

import (
	"github.com/gin-gonic/gin"
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

func main() {
	runtime.GOMAXPROCS(runtime.NumCPU())

	gin.SetMode(gin.ReleaseMode)

	router := gin.New()

	router.GET("/:number", func(c *gin.Context) {
		number, _ := strconv.Atoi(c.Param("number"))
		c.String(200, strconv.Itoa(fib(number)))
	})

	router.Run(":4000")
}
