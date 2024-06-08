from pyspark.sql import SparkSession
import sqlite3
from get_session_data import *

spark = get_session()

#create dataframe
data = [(1,"An"),(2,"Anh"),(3,"Trung")]
columes = ["ID","Name"]
df = spark.createDataFrame(data,columes)
df.show()

con = sqlite3.connect("sample.db")

cur = con.cursor()

create_table = """
CREATE TABLE IF NOT EXISTS example_table(
    ID INTEGER,
    NAME VARCHAR(10)
);
"""

cur.execute(create_table)

for Row in df.collect():
    insert_data = "INSERT INTO example_table (ID, NAME ) VALUES (?,?)"
    cur.execute(insert_data, (Row["ID"],Row["Name"]))

con.commit()
con.close()
