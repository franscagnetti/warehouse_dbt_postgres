import psycopg2, requests, pandas as pd, io
from sqlalchemy import create_engine

response = requests.get("https://data.sfgov.org/resource/wr8u-xric.csv")
response.ContentType = "application/CSV"

engine = create_engine('postgresql+psycopg2://francoscagnetti:postgresadmin@localhost:5438/postgres')
connection = engine.raw_connection()

cursor = connection.cursor()
fd = open('incidents_ddl.sql', 'r')
sqlFile = fd.read()
fd.close()
cursor.execute(sqlFile)
cursor.close()
connection.commit()

incidents = pd.read_csv(io.StringIO(response.text))
incidents['point'] = incidents['point'].str.replace(' ',', ').str.replace('POINT, ','').str.strip()
incidents.to_sql('incidents', engine, if_exists='append', index=False)

connection.commit()
connection.close()