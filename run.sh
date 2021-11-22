echo "Starting executing the process"
cd ~./

echo "Executing docker-compose command and waiting until the docker container is up"
docker-compose up -d
sleep 20

echo "Executing extract.py command"
python3 extract.py

echo "Executing dbt process"
cd dbt_data_modeling/
dbt run

echo "Finished the process."