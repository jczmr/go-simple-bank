package api

import (
	"github.com/gin-gonic/gin"
	"github.com/jczmr/go-simple-bank/db/sqlc"
)

// Server serves HTTP requests for our banking service.
type Server struct {
	store  *sqlc.Store
	router *gin.Engine
}

// NewServer creates a new HTTP server and setup routing
func NewServer(store *sqlc.Store) *Server {
	server := &Server{
		store: store,
	}

	router := gin.Default()

	router.POST("/accounts", server.createAccount)

	server.router = router
	return server
}

// Start runs the HTTP server on a specific address
func (server *Server) Start(address string) error {
	return server.router.Run(address)
}

func errorResponse(err error) gin.H {
	return gin.H{"error": err.Error()}
}
