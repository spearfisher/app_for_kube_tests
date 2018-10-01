package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "test application for jenkins + kubernetes setup",
			"step_2":  "ci/cd test #3 with github plugin for jenkins",
		})
	})

	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "success",
		})
	})
	r.Run(":3333")
}
