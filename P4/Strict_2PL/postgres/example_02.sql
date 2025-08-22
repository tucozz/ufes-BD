-- ========================================================================
--  Copyright Universidade Federal do Espirito Santo (Ufes)
-- 
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
-- 
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
-- 
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <https://www.gnu.org/licenses/>.
--  
--  This program is released under license GNU GPL v3+ license.
-- 
-- ========================================================================

\connect db_transactions;

-- example_02 (PostgreSQL 10+)
INSERT INTO
  "Schedule" ("time", "#t", "op", "attr")
VALUES
  (21, 2, 'read_lock', 'Y'),
  (42, 2, 'read_item', 'Y'),
  (43, 2, 'write_lock', 'X'),
  (54, 2, 'unlock', 'Y'),
  (65, 2, 'read_item', 'X'),
  (76, 2, 'write_item', 'X'),
  (77, 2, 'rollback', '-'),
  (89, 2, 'unlock', 'X');
