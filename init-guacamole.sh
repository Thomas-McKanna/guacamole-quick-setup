#!/bin/bash

# Start all containers
docker-compose up -d

# Wait for MySQL to fully start. Adjust the sleep time as necessary.
echo "Waiting for MySQL to initialize..."
sleep 30

# Generate the SQL script for initializing the Guacamole database
echo "Generating Guacamole MySQL schema..."
docker-compose exec guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql

# Execute the schema script against the MySQL database
echo "Populating Guacamole MySQL database..."
docker-compose exec -T mysql mysql -u guacamole_user -pguacamole_pass guacamole_db < initdb.sql
docker-compose exec -T mysql mysql -u guacamole_user -pguacamole_pass guacamole_db < connection_init.sql

echo "Guacamole has been successfully initialized!"
echo "Log in with guacadmin:guacadmin at http://localhost:8080/guacamole/"
