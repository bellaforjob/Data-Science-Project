import json
import pandas as pd

file = "/Users/beiwang/Documents/00Data Science SpringBoard/Projects/data_wrangling_json 2/data"

data = pd.read_json(file)
print(data)
