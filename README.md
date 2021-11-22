# warehouse_dbt_postgres

## Requirements
To execute the whole process, you need to go through some configurations:

  1. Download and install docker, docker-compose, postgresql and python3:
  Docker: https://docs.docker.com/desktop/mac/install/
  Compose: https://docs.docker.com/compose/install/
  Postgresql: https://www.postgresql.org/download/macosx/
  Python3: https://docs.python-guide.org/starting/install3/osx/

  2. Modify the profiles.yml (In mac is in /Users/username/.dbt/profiles.yml):
  ```
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
        schema: bi_team
        threads: 10
  ```

  3. Install python libraries:
  ```
  pip install dbt
  pip install dbt-postgres
  pip install psycopg2
  pip install requests
  pip install pandas
  ```

## Execution
To execute the whole process just execute the  ```run.sh``` file and it will:
- Execute the docker-compose command. It will start a new docker container with the Postgres database.
- Execute the python extraction from the API: https://data.sfgov.org/resource/wr8u-xric.csv
- Load the data into the Postgres database. The data will be allocated in the "Public" schema.
- Execute the DBT process and create a new schema "bi_team" and create a new table with aggregated data with the following dimensions: time_period, district, battalion. Also, it has a column "total_incidents" with the total of the incidents for those dimensions.

### Connect to the database:
  ```
  host: 127.0.0.1 (localhost)
  database: postgres
  port: 5438
  username: francoscagnetti
  password: postgresadmin
  ```

### Sample query:
  ```
  SELECT
    *
  FROM
    bi_team.incidents_time_district_batallion
  ```

## Assumptions:
1. The time period dimension will be "days". To change it just change the query in the DBT project.
2. There is no big amount of data, so the process will delete and create the incidents table for each execution. If there is a good amount of data, I would take into account the last incidents inserted in the database, and I will insert the new incidents that come from the API.
3. The execution will be scheduled with crontab. ```0 3 * * * sh ~/warehouse_dbt_postgres/run.sh```.