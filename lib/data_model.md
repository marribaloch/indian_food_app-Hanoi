# Data Models (Phase 1)

## User
| Field        | Type      | Notes |
|--------------|-----------|-------|
| id           | string    | Unique user ID |
| name         | string    |  |
| phone        | string    |  |
| email        | string    |  |
| role         | "customer" \| "restaurant" \| "driver" | User role |
| restaurantId | string?   | Only if role = restaurant |

---

## Restaurant
| Field     | Type    |
|-----------|---------|
| id        | string  |
| name      | string  |
| address   | string  |
| imageUrl  | string  |
| rating    | number  |
| isOpen    | boolean |

---

## MenuItem
| Field        | Type    |
|--------------|---------|
| id           | string  |
| restaurantId | string  |
| name         | string  |
| priceVnd     | number  |
| imageUrl     | string  |
| isAvailable  | boolean |

---

## OrderItem
| Field       | Type    |
|-------------|---------|
| menuItemId  | string  |
| name        | string  |
| qty         | number  |
| priceVnd    | number  |

---

## Order
| Field        | Type          |
|--------------|---------------|
| id           | string        |
| customerId   | string        |
| restaurantId | string        |
| items        | OrderItem[]   |
| totalVnd     | number        |
| status       | enum          |
| createdAt    | timestamp     |

Status values: