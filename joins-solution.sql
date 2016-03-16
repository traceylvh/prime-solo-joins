-- Get all customers and their addresses.
SELECT *
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id;
--
-- Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items
ON orders.id = line_items.order_id;
--
-- Which warehouses have cheetos?
SELECT warehouse.warehouse
FROM warehouse
JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
JOIN products
ON warehouse_product.product_id = products.id
WHERE products.description='cheetos';
--
-- Which warehouses have diet pepsi?
SELECT warehouse.warehouse
FROM warehouse
JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
JOIN products
ON warehouse_product.product_id = products.id
WHERE products.description='diet pepsi';
--
-- Get the number of orders for each customer.
-- note: It is OK if those without orders are not included in results.
SELECT first_name, last_name, COUNT(customers.id)
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id
JOIN orders
ON addresses.id = orders.address_id
GROUP BY customers.id;
--
-- How many customers do we have?
SELECT COUNT(*) FROM customers;
--
-- How many products do we carry?
SELECT COUNT(*) FROM products;
--
-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand)
FROM warehouse
JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
JOIN products
ON warehouse_product.product_id = products.id
WHERE products.description='diet pepsi';
