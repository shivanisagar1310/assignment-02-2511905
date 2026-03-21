## Anomaly Analysis

Insert Anomaly

While inserting new rows in the given table, it requires customer, product, and sales representative data. Also, all these details are repetitive across multiple rows. Since this table is primarily order-based, adding new product data is not possible unless a customer places an order.

For example, a product like Notebook with product_id = P004 can only be added when a customer purchases it. So, new products that are not yet purchased cannot be inserted into this table.

Update Anomaly

If product details like category or unit price, or even customer details like city, need to be updated, we have to go through the entire table and update multiple rows.

For example, if the unit price of the product Notebook with product_id = P004 needs to be updated from 120 to 125, it requires updating all the rows where this product appears in different orders. This increases the chances of inconsistency if any row is missed.

Delete Anomaly

Similarly, if we delete an order, it can also remove important product, customer, and sales representative data.

For example, if order_id = ORD1104 for customer C005 is deleted, it may also remove the associated product, customer, and sales representative details. If that customer has only one order or the product appears only once in the table, we may lose that information completely.
