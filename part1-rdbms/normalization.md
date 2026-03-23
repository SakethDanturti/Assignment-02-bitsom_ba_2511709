## Anomaly Analysis

1). Insert Anomaly - occurs when one cannot insert new data into a table because some other, unrelated data is missing or incomplete.

For Example, If a new product has to be added 

ProductID = P010
ProductName = Wireless Mouse
Category = Electronics
UnitPrice = 799

there is no place to store it independently unless an order already exists for that product.

This is because product details are mixed into order rows and appear together with order-related columns such as:

OrderID
OrderDate
CustomerID
CustomerName

So a new product cannot be inserted without inventing or waiting for an order row.



2) Update Anomaly - It happens when changing a piece of information in one location but failing to update all redundant instances, creating inconsistent records.

For example, if the same CustomerID appears in more than one row and the customer’s city or name changes, then all rows for that customer must be updated.

A typical repeated set of columns is:

CustomerID
CustomerName
City

If CustomerName or City is updated in only one row but not the others, then the table becomes inconsistent.



3) Delete Anomaly - It occurs when deleting a row of data unintentionally removes other, necessary information, resulting in a loss of critical data.

If a product appears in only one order row, and that row is deleted because the order is cancelled or removed, then we also lose the only stored information about that product.

For instance, deleting a row removes both:

the order information (OrderID, OrderDate)
and the product information (ProductID, ProductName, Category, UnitPrice)

Similarly, if a customer has only one order in the file, deleting that row removes the only stored record of that customer as well.


## Normalization Justification
I would dispute the manager’s argument. While it might be easier to have everything in a flat table, it leads to redundancy, inconsistency, and maintenance problems in the dataset.

For instance, the details of the customers, like customer_id, customer_name, customer_email, and customer_city, are repeated in each row of the order table. If a customer like C001 makes multiple orders, their details would be repeated. If the city of a customer changes, their details would have to be changed everywhere. If a single row of the table is left out, the data would be inconsistent. Similarly, the details of the products, like product_id, product_name, category, and unit_price, would be repeated. Similarly, the details of the sales representatives, like sales_rep_id, sales_rep_name, and office_address, would be repeated.

The above dataset also shows the importance of avoiding anomalies in a database. If a new product is to be inserted into the database, there should be a corresponding order for it. Thus, there is an insert anomaly. If the only order of a particular product is deleted, the only record of the existence of the product would also be deleted. An update anomaly occurs when the same sales representative or customer is represented multiple times. In fact, the sales representative SR01 is represented with slightly different wording in the office address.

Normalisation is not over-engineering the design, rather it is a smarter decision when it comes to managing data effectively. Having the data organised into CUSTOMERS, PRODUCTS, SALES_REPS, ORDERS_1, and ORDER_ITEMS makes updating the data safer, reduces redundancy, and enables more accurate queries. Although the data appears to be simpler with one table, it is less manageable as the data increases.

