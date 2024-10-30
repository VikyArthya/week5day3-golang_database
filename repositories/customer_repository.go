// repositories/customer_repository.go
package repositories

import (
	"context"

	"tugas/database"
	"tugas/models"
)

type CustomerRepository struct{}

func (r *CustomerRepository) AddCustomer(customer *models.Customer) error {
	query := "INSERT INTO customers (name, email, status_login) VALUES ($1, $2, $3) RETURNING customer_id"
	return database.DB.QueryRowContext(context.Background(), query, customer.Name, customer.Email, customer.StatusLogin).Scan(&customer.CustomerID)
}

func (r *CustomerRepository) GetCustomerLoginStatus() (int, int, error) {
	var totalLogin, totalLogout int
	query := `SELECT 
        COUNT(*) FILTER (WHERE status_login = TRUE) AS total_login,
        COUNT(*) FILTER (WHERE status_login = FALSE) AS total_logout
    FROM customers`
	err := database.DB.QueryRowContext(context.Background(), query).Scan(&totalLogin, &totalLogout)
	return totalLogin, totalLogout, err
}
