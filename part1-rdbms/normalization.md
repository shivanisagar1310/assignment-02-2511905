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

## Normalization Justification
Our current table stores all customer data, product data, order data, and sales representative data in one place. We can also see that the same data is repeated across multiple rows. This creates redundancy in data storage, leads to inconsistencies while updating, and is often error-prone when deleting records.

For example, the sales representative name Ravi Kumar appears in multiple rows. If we want to update his email or office address, we would have to go through the entire table and update it in multiple places. This increases the chances of missing some rows, which can result in inconsistent data.

As data grows, this table becomes hard to maintain and difficult to work with. It is also not easy to extract meaningful insights from it. To solve these maintenance problem and redundancy issues and to keeo the data integrity, we can split the data into separate tables such as,
Customer data, 
Product data,
Order data,  
Sales Representative data.

With this separation, each table will store only relevant data, and reduce duplication. For example, customer details like email can be updated in one place without affecting multiple rows. We can also easily add new attributes, such as a mobile number, without impacting other data.

Additionally, normalized tables make it easier to query and analyze data. For instance, we can find which product is most sold or identify which branch has low inventory more efficiently.

It is a necessary step to ensure data consistency, scalability, and ease of maintenance.
