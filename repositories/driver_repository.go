// repositories/driver_repository.go
package repositories

import (
	"context"

	"tugas/database"
	"tugas/models"
)

type DriverRepository struct{}

func (r *DriverRepository) AddDriver(driver *models.Driver) error {
	query := "INSERT INTO drivers (name, total_orders) VALUES ($1, $2) RETURNING driver_id"
	return database.DB.QueryRowContext(context.Background(), query, driver.Name, driver.TotalOrders).Scan(&driver.DriverID)
}

func (r *DriverRepository) GetMonthlyDriverOrders() ([]MonthlyDriverOrders, error) {
	query := `SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, drivers.name, COUNT(orders.order_id) AS order_count
              FROM orders
              JOIN drivers ON orders.driver_id = drivers.driver_id
              GROUP BY month, drivers.name
              ORDER BY month, order_count DESC`
	rows, err := database.DB.QueryContext(context.Background(), query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var results []MonthlyDriverOrders
	for rows.Next() {
		var result MonthlyDriverOrders
		if err := rows.Scan(&result.Month, &result.DriverName, &result.OrderCount); err != nil {
			return nil, err
		}
		results = append(results, result)
	}
	return results, nil
}

type MonthlyDriverOrders struct {
	Month      string
	DriverName string
	OrderCount int
}
