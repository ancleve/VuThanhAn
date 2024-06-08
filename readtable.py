from get_session_data import *
import sqlite3

spark = get_session();
SQL_Queries(spark,"home/sample.db","example_table")
result = spark.sql("select * from new_table")
result.show()