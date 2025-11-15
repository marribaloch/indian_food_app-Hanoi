# System User Flows

---

## 1. Customer Flow

1. Open app → choose role = "Customer"
2. View list of restaurants
3. Select a restaurant
4. View menu items
5. Add items to cart
6. Press "Place Order"
7. A new order is created with status = "new"
8. Customer can view order status:
   - "new" → "accepted" → "preparing" → "ready"
   - then driver picks up and delivers
9. (Future) Customer can rate order/restaurant

---

## 2. Restaurant Flow

1. Open app → choose role = "Restaurant"
2. See list of incoming orders with latest on top
3. For each order, restaurant can:
   - Accept order → status "accepted"
   - Mark as "preparing"
   - Mark as "ready" (food ready for pickup)
4. Restaurant can manage:
   - Its menu items (add / edit / disable)
   - Open / Close status
5. Restaurant can view:
   - Daily sales
   - Total orders
   - Basic reports

---

## 3. Driver Flow

1. Open app → choose role = "Driver"
2. See list of available jobs (orders with status "ready")
3. Accept a job → status for that order becomes "assigned"
4. When food picked up:
   - Update status to "picked"
5. While going to customer:
   - Update status to "on_the_way"
6. After delivery:
   - Update status to "delivered"
7. (Future) Share live location for tracking

---

## 4. Admin Flow (Web Dashboard)

1. Login to web dashboard as "Admin"
2. View:
   - List of restaurants
   - List of customers
   - List of drivers
3. View reports:
   - Daily sales per restaurant
   - Total orders per day
   - Top-performing restaurants
4. Manage:
   - Approve / block restaurants
   - Reset passwords / roles (basic user management)