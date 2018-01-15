DROP TABLE IF EXISTS job;

CREATE TABLE job (

id SERIAL PRIMARY KEY,
title VARCHAR(255),
company TEXT,
sector TEXT,
location TEXT,
salary TEXT

);

INSERT INTO job (title , company, sector, location, salary) VALUES ('Job 1' , 'company text 1, sector text 1, location text 1, salary text 1');
INSERT INTO job (title , company, sector, location, salary) VALUES ('Job 2' , 'company text 2, sector text 2, location text 2, salary text 2');
INSERT INTO job (title , company, sector, location, salary) VALUES ('Job 3' , 'company text 3, sector text 3, location text 3, salary text 3');
INSERT INTO job (title , company, sector, location, salary) VALUES ('Job 4' , 'company text 4, sector text 4, location text 4, salary text 4');