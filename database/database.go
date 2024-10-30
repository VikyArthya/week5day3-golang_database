// database/database.go
package database

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

var DB *sql.DB

func InitDB() {
	// Replace with your PostgreSQL credentials
	dsn := "postgres://postgres:superadmin@localhost:5432/ojekonlen?sslmode=disable"
	db, err := sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal("Unable to connect to database:", err)
	}

	// Check if the connection is successful
	if err := db.Ping(); err != nil {
		log.Fatal("Unable to reach the database:", err)
	}

	DB = db
}
