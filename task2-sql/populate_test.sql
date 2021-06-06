-- POPULATE DB FOR TESTING

CREATE TABLE employees (
                          id serial PRIMARY KEY,
                          login VARCHAR ( 50 ) UNIQUE NOT NULL
);

DROP TABLE actions;

CREATE TABLE actions (
                           employee_id serial,
                           dt timestamp,
                           action VARCHAR ( 50 ) UNIQUE NOT NULL,
                           FOREIGN KEY (employee_id) REFERENCES employees (id)
);

INSERT INTO employees VALUES (1, 'ivan');
INSERT INTO employees VALUES (2, 'user2');
INSERT INTO employees VALUES (3, 'user3');
INSERT INTO employees VALUES (4, 'user4');
INSERT INTO employees VALUES (5, 'user5');
INSERT INTO employees VALUES (6, 'user6');
INSERT INTO employees VALUES (7, 'user7');

INSERT INTO actions VALUES (1, '2020-02-22 19:10:25', 'DID STUFF');
INSERT INTO actions VALUES (1, '2020-02-23 18:20:25', 'DID OTHER STUFF');

INSERT INTO actions VALUES (2, '2020-02-01 19:10:26', '2 FEB');
INSERT INTO actions VALUES (2, '2020-02-01 19:10:26', '2 FEB 2');
INSERT INTO actions VALUES (2, '2020-02-01 19:10:26', '2 FEB 3 ');
INSERT INTO actions VALUES (2, '2020-02-01 19:10:26', '2 FEB 4');
INSERT INTO actions VALUES (2, '2020-01-01 19:10:26', '2 JAN');

INSERT INTO actions VALUES (3, '2020-01-03 19:10:26', '3 JAN - 1');
INSERT INTO actions VALUES (3, '2020-01-06 10:10:26', '3 JAN - 2');
INSERT INTO actions VALUES (3, '2020-02-29 10:10:26', '3 FEB - 1');
INSERT INTO actions VALUES (3, '2020-02-20 10:10:26', '3 FEB - 2');

INSERT INTO actions VALUES (4, '2020-01-03 19:00:26', '4 JAN - 1');

INSERT INTO actions VALUES (5, '2020-02-01 19:00:26', '5 FEB - 1');
INSERT INTO actions VALUES (5, '2020-02-01 19:00:26', '5 FEB - 2');
INSERT INTO actions VALUES (5, '2020-02-01 19:00:26', '5 FEB - 3');

INSERT INTO actions VALUES (6, '2020-02-10 19:00:26', '6 FEB - 1');
INSERT INTO actions VALUES (6, '2020-02-11 19:00:26', '6 FEB - 2');
INSERT INTO actions VALUES (6, '2020-02-12 19:00:26', '6 FEB - 3');

INSERT INTO actions VALUES (7, '2020-02-10 19:00:26', '7 FEB - 1');