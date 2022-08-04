## Instructions


Use the file 'salon.sql' to scaffold and populate the database, or build it from the requirements below.
Execute the file 'salon.sh' to make an appointment. 
The file 'salon_no_checks.sh' is the same as 'salon.sh' but with a few validity checks commented out in order to pass the tests from the freecodecamp exercise. 



## DB tables requirements : 


Table "public.services"
   Column   |         Type          | Collation | Nullable |                   Default                    
------------+-----------------------+-----------+----------+----------------------------------------------
 service_id | integer               |           | not null | nextval('services_service_id_seq'::regclass)
 name       | character varying(50) |           |          | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (service_id)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)


Table "public.customers"
   Column    |         Type          | Collation | Nullable |                    Default                     
-------------+-----------------------+-----------+----------+------------------------------------------------
 customer_id | integer               |           | not null | nextval('customers_customer_id_seq'::regclass)
 phone       | character varying(15) |           |          | 
 name        | character varying(50) |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)


Table "public.appointments"
     Column     |         Type          | Collation | Nullable |                       Default                        
----------------+-----------------------+-----------+----------+------------------------------------------------------
 appointment_id | integer               |           | not null | nextval('appointments_appointment_id_seq'::regclass)
 customer_id    | integer               |           |          | 
 service_id     | integer               |           |          | 
 time           | character varying(50) |           |          | 
Indexes:
    "appointments_pkey" PRIMARY KEY, btree (appointment_id)
Foreign-key constraints:
    "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)