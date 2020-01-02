SELECT
  *,
  DATE_FORMAT(order_date, "%d/%m/%Y")
FROM
  `orders`