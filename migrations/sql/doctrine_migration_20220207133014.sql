-- Doctrine Migration File Generated on 2022-02-07 13:30:14

-- Version 20220207132531
CREATE TABLE projects(id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description TEXT);
INSERT INTO doctrine_migration_versions (version, executed_at) VALUES ('20220207132531', CURRENT_TIMESTAMP);
