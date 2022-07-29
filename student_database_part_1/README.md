## Instructions


Use the file 'students.sql' to scaffold the database, or build it from the requirements below. 
Execute the file 'insert_data.sh' to collect data from 'courses.csv' and 'students.csv' and populate the database. 
The result should be identical to 'students_complete.sql'.



## DB tables requirements : 


Table "public.majors"
+----------+-----------------------+-----------+----------+------------------------------------------+
|  Column  |         Type          | Collation | Nullable |                 Default                  |
+----------+-----------------------+-----------+----------+------------------------------------------+
| major_id | integer               |           | not null | nextval('majors_major_id_seq'::regclass) |
| major    | character varying(50) |           | not null |                                          |
+----------+-----------------------+-----------+----------+------------------------------------------+
Indexes:
    "majors_pkey" PRIMARY KEY, btree (major_id)
Referenced by:
    TABLE "majors_courses" CONSTRAINT "majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)
    TABLE "students" CONSTRAINT "students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)


Table "public.courses"
+-----------+------------------------+-----------+----------+--------------------------------------------+
|  Column   |          Type          | Collation | Nullable |                  Default                   |
+-----------+------------------------+-----------+----------+--------------------------------------------+
| course_id | integer                |           | not null | nextval('courses_course_id_seq'::regclass) |
| course    | character varying(100) |           | not null |                                            |
+-----------+------------------------+-----------+----------+--------------------------------------------+
Indexes:
    "courses_pkey" PRIMARY KEY, btree (course_id)
Referenced by:
    TABLE "majors_courses" CONSTRAINT "majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)


Table "public.majors_courses"
+-----------+---------+-----------+----------+---------+
|  Column   |  Type   | Collation | Nullable | Default |
+-----------+---------+-----------+----------+---------+
| major_id  | integer |           | not null |         |
| course_id | integer |           | not null |         |
+-----------+---------+-----------+----------+---------+
Indexes:
    "majors_courses_pkey" PRIMARY KEY, btree (major_id, course_id)
Foreign-key constraints:
    "majors_courses_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)
    "majors_courses_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)


Table "public.students"
+------------+-----------------------+-----------+----------+----------------------------------------------+
|   Column   |         Type          | Collation | Nullable |                   Default                    |
+------------+-----------------------+-----------+----------+----------------------------------------------+
| student_id | integer               |           | not null | nextval('students_student_id_seq'::regclass) |
| first_name | character varying(50) |           | not null |                                              |
| last_name  | character varying(50) |           | not null |                                              |
| major_id   | integer               |           |          |                                              |
| gpa        | numeric(2,1)          |           |          |                                              |
+------------+-----------------------+-----------+----------+----------------------------------------------+
Indexes:
    "students_pkey" PRIMARY KEY, btree (student_id)
Foreign-key constraints:
    "students_major_id_fkey" FOREIGN KEY (major_id) REFERENCES majors(major_id)
