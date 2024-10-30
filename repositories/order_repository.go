// repositories/order_repository.go
package repositories

import (
	"context"

	"tugas/database"
	"tugas/models"
)

type OrderRepository struct{}

func (r *OrderRepository) AddOrder(order *models.Order) error {
	query := "INSERT INTO orders (customer_id, driver_id, order_date, region) VALUES ($1, $2, $3, $4) RETURNING order_id"
	return database.DB.QueryRowContext(context.Background(), query, order.CustomerID, order.DriverID, order.OrderDate, order.Region).Scan(&order.OrderID)
}

func (r *OrderRepository) GetMonthlyOrderSummary() ([]MonthlyOrderSummary, error) {
	query := `SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, COUNT(*) AS total_orders
              FROM orders
              GROUP BY month
              ORDER BY month`
	rows, err := database.DB.QueryContext(context.Background(), query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var results []MonthlyOrderSummary
	for rows.Next() {
		var result MonthlyOrderSummary
		if err := rows.Scan(&result.Month, &result.TotalOrders); err != nil {
			return nil, err
		}
		results = append(results, result)
	}
	return results, nil
}

type MonthlyOrderSummary struct {
	Month       string
	TotalOrders int
}
