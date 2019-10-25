
include:
    - mariadb.repo_installed

mariadb_server_installed:
    pkg.installed:
        - pkgs:
            - MariaDB-client
            - MariaDB-server
