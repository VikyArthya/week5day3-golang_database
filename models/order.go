// models/order.go
package models

import "time"

type Order struct {
	OrderID    int
	CustomerID int
	DriverID   int
	OrderDate  time.Time
	Region     string
}
