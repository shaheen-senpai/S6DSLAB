from pyspark.sql import SparkSession
from pyspark.sql.functions import col

print("hello world")

# Create a SparkSession
spark = SparkSession.builder.appName("OddNumberCount").getOrCreate()

# Load the DataFrame from a CSV file
df = spark.read.csv("file:///home/oem/shaheen/people-100.csv", header=True, inferSchema=True)
df.show()

# just take in the Index column alone to check for the odd numbers


# Filter the index to keep only odd numbers
odd_df = df.filter(col("Index") % 2 != 0)

# Count the total number of odd numbers
odd_count = odd_df.count()

# Print the result
print("Total number of odd numbers: ", odd_count)

# Stop the SparkSession
spark.stop()
