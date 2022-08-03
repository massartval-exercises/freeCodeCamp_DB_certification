## Instructions


Use the file 'bikes.sql' to scaffold and populate the database, or build it from the requirements below and add a few bikes to rent. 
Execute the file 'bike_shop.sh' to rent and return bikes from the shop. 



## DB tables requirements : 


Table "public.bikes"
+-----------+-----------------------+-----------+----------+----------------------------------------+
|  Column   |         Type          | Collation | Nullable |                Default                 |
+-----------+-----------------------+-----------+----------+----------------------------------------+
| bike_id   | integer               |           | not null | nextval('bikes_bike_id_seq'::regclass) |
| type      | character varying(50) |           | not null |                                        |
| size      | integer               |           | not null |                                        |
| available | boolean               |           | not null | true                                   |
+-----------+-----------------------+-----------+----------+----------------------------------------+
Indexes:
    "bikes_pkey" PRIMARY KEY, btree (bike_id)
Referenced by:
    TABLE "rentals" CONSTRAINT "rentals_bike_id_fkey" FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)


Table "public.customers"
+-------------+-----------------------+-----------+----------+------------------------------------------------+
|   Column    |         Type          | Collation | Nullable |                    Default                     |
+-------------+-----------------------+-----------+----------+------------------------------------------------+
| customer_id | integer               |           | not null | nextval('customers_customer_id_seq'::regclass) |
| phone       | character varying(15) |           | not null |                                                |
| name        | character varying(40) |           | not null |                                                |
+-------------+-----------------------+-----------+----------+------------------------------------------------+
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone)
Referenced by:
    TABLE "rentals" CONSTRAINT "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)


Table "public.rentals"
+---------------+---------+-----------+----------+--------------------------------------------+
|    Column     |  Type   | Collation | Nullable |                  Default                   |
+---------------+---------+-----------+----------+--------------------------------------------+
| rental_id     | integer |           | not null | nextval('rentals_rental_id_seq'::regclass) |
| customer_id   | integer |           | not null |                                            |
| bike_id       | integer |           | not null |                                            |
| date_rented   | date    |           | not null | now()                                      |
| date_returned | date    |           |          |                                            |
+---------------+---------+-----------+----------+--------------------------------------------+
Indexes:
    "rentals_pkey" PRIMARY KEY, btree (rental_id)
Foreign-key constraints:
    "rentals_bike_id_fkey" FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
    "rentals_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)