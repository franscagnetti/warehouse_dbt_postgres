# warehouse_dbt_postgres

warehouse_tn:
  target: dev
  outputs:
    dev:
      type: postgres
      host: 127.0.0.1
      user: francoscagnetti
      password: postgresadmin
      port: 5438
      dbname: postgres
      schema: ingest
      threads: 10


pip install dbt
pip install dbt-postgres
pip3 install psycopg2