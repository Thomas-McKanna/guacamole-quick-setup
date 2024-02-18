INSERT INTO guacamole_connection
(connection_id, connection_name, parent_id, protocol, proxy_port, proxy_hostname, proxy_encryption_method, max_connections, max_connections_per_user, connection_weight, failover_only)
VALUES
(NULL, 'RDesktop', NULL, 'rdp', NULL, NULL, NULL, NULL, NULL, NULL, 0);

INSERT INTO guacamole_connection_parameter (connection_id, parameter_name, parameter_value) 
VALUES 
(1, 'hostname', 'rdesktop'),
(1, 'ignore-cert', 'true'),
(1, 'password', 'abc'),
(1, 'port', '3389'),
(1, 'security', 'any'),
(1, 'username', 'abc');