import pyodbc
import os
 
# initialize the connection
conn = pyodbc.connect("DSN=drill", autocommit=True)
cursor = conn.cursor()

with open('/tmp/test.csv', 'w') as f:
    f.write("foo,bar,baz")
f.close()
  
# setup the query and run it
s = "SELECT * from dfs.root.`/tmp/test.csv`"

# fetch and display filtered output
cursor.execute(s)

a = cursor.fetchall()
j = 0
for i in a:
    print i
    j += 1

if (j == 1):
    print "test successful"
else:
    print "test failed"
os.remove('/tmp/test.csv')
