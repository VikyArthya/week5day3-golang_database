// main.go
package main

import (
	"fmt"
	"log"
	"time"

	"tugas/database"
	"tugas/models"
	"tugas/repositories"
)

func main() {
	database.InitDB()
	defer database.DB.Close()

	customerRepo := repositories.CustomerRepository{}
	driverRepo := repositories.DriverRepository{}
	orderRepo := repositories.OrderRepository{}

	// Example: Add Customer
	newCustomer := &models.Customer{Name: "John Doe", Email: "john@example.com", StatusLogin: true}
	if err := customerRepo.AddCustomer(newCustomer); err != nil {
		log.Println("Error adding customer:", err)
	} else {
		fmt.Println("New customer ID:", newCustomer.CustomerID)
	}

	// Example: Add Driver
	newDriver := &models.Driver{Name: "Jane Smith", TotalOrders: 0}
	if err := driverRepo.AddDriver(newDriver); err != nil {
		log.Println("Error adding driver:", err)
	} else {
		fmt.Println("New driver ID:", newDriver.DriverID)
	}

	// Example: Add Order
	newOrder := &models.Order{
		CustomerID: newCustomer.CustomerID,
		DriverID:   newDriver.DriverID,
		OrderDate:  time.Now(),
		Region:     "Jakarta Barat",
	}
	if err := orderRepo.AddOrder(newOrder); err != nil {
		log.Println("Error adding order:", err)
	} else {
		fmt.Println("New order ID:", newOrder.OrderID)
	}

	// Example: Query Monthly Orders
	monthlyOrders, err := orderRepo.GetMonthlyOrderSummary()
	if err != nil {
		log.Println("Error querying monthly orders:", err)
	} else {
		fmt.Println("Monthly Orders:", monthlyOrders)
	}
}
