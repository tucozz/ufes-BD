#========================================================================
# Copyright Universidade Federal do Espirito Santo (Ufes)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# 
# This program is released under license GNU GPL v3+ license.
#
#========================================================================

--> Instructions:

1. Download and unzip the problem description file (.zip);

2. Open a terminal window, change the cursor to the directory containing the
   uncompressed files. Then, run:
	
	docker compose up -d

3. Once the services are up and running, visit http://localhost:8080 and log
   in with the credentials below:

  - MySQL 5.7

	System: MySQL
	Server: db_mysql
	Username: root
	Password: Example@1

  - MySQL 8+

	System: MySQL
	Server: db_mysql8
	Username: root
	Password: Example@1

 - PostgreSQL 16+

	System: PostgreSQL
	Server: db_postgres
	Username: postgres
	Password: Example@1

4. Access db_transactions to view table Schedule and Example 01;

5. Delete all table rows between imports;

6. To stop the servers type Ctrl+C followed by:
	
	docker compose down

--> References:

https://docs.docker.com/engine/install/
https://hub.docker.com/_/mysql
https://hub.docker.com/_/postgres
