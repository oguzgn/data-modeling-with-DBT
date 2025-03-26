
  
    

  create  table "postgres"."classicmodels_star_schema"."fact_orders__dbt_tmp"
  
  
    as
  
  (
    SELECT 
    md5(cast(coalesce(cast(orders.orderNumber as TEXT), '') || '-' || coalesce(cast(orderdetails.orderLineNumber as TEXT), '') as TEXT)) as fact_order_key,
    md5(cast(coalesce(cast(customers.customerNumber as TEXT), '') as TEXT)) AS customer_key, 
    md5(cast(coalesce(cast(employees.employeeNumber as TEXT), '') as TEXT)) AS employee_key,
    md5(cast(coalesce(cast(offices.officeCode as TEXT), '') as TEXT)) AS office_key,
    md5(cast(coalesce(cast(productCode as TEXT), '') as TEXT)) AS product_key, 
    orders.orderDate AS order_date,
    orders.requiredDate AS order_required_date, 
    orders.shippedDate AS order_shipped_date,
    orderdetails.quantityOrdered AS quantity_ordered, 
    orderdetails.priceEach AS product_price
FROM classicmodels.orders
JOIN classicmodels.orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN classicmodels.customers ON orders.customerNumber = customers.customerNumber
JOIN classicmodels.employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN classicmodels.offices ON employees.officeCode = offices.officeCode
  );
  