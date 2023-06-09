SELECT * FROM issues

SELECT * FROM users

SELECT * FROM choices

DELETE FROM issues WHERE issue_id = 3;


SELECT issue_id FROM issues ORDER BY issue_id DESC LIMIT 1;

UPDATE choices SET points = points + 1 WHERE choice_id = 13 AND issue_id = 4;

UPDATE choices SET points = points + 3 WHERE choice_id = 1;

SELECT choice, points, choice_id FROM choices WHERE issue_id = 2 ORDER BY points DESC
UPDATE choices SET points = 3 WHERE choice_id = 7;
UPDATE choices SET points = 3 WHERE choice_id = 4;
UPDATE choices SET points = 3 WHERE choice_id = 5;
UPDATE choices SET points = 3 WHERE choice_id = 6;
UPDATE choices SET points = 3 WHERE choice_id = 8;

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', NULL, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

SELECT issue_id FROM issues ORDER BY issue_id DESC LIMIT 1; --getter

INSERT INTO choices (issue_id)
VALUES (5);


UPDATE choices SET choice_1 = 'one', choice_2 = 'two', choice_3 = 'three' WHERE issue_id = 5;

UPDATE choices SET points = 3 WHERE choice_id = 1;
UPDATE choices SET points = 7 WHERE choice_id = 2;
UPDATE choices SET points = 10 WHERE choice_id = 3;


--, choice_1, choice_2, choice_3, choice_4, choice_5, choice_6, choice_7, choice_8, choice_9, choice_10

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('May book club', 1, 'Rank what you want to read for next month''s book club', NULL, '2023-04-10 11:30:00', '2023-04-29 11:30:00', 'active', 'genre_2');


INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('Park amenities', 1, 'Rank what you want at the park', '2023-04-10 11:30:00', NULL, '2023-04-29 11:30:00', 'active', 'genre_3') RETURNING issue_id;


DROP TABLE IF EXISTS issues;

CREATE TABLE issues (
    issue_id SERIAL PRIMARY KEY,
    issue_name VARCHAR(69),
    issue_owner_id INTEGER,
    description VARCHAR(420),
    date_posted TIMESTAMP NULL,
    expiration_date DATE,
	expiration_time TIME,
    status VARCHAR(40),
    genre_tag VARCHAR(40),
    CONSTRAINT FK_issue_owner_id FOREIGN KEY(issue_owner_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS choices;

CREATE TABLE choices (
	issue_id INT,
	choice_1 VARCHAR (100),
	choice_2 VARCHAR (100),
	choice_3 VARCHAR (100),
	choice_4 VARCHAR (100),
	choice_5 VARCHAR (100),
	choice_6 VARCHAR (100),
	choice_7 VARCHAR (100),
	choice_8 VARCHAR (100),
	choice_9 VARCHAR (100),
	choice_10 VARCHAR (100),
	CONSTRAINT FK_issue_id FOREIGN KEY(issue_id) REFERENCES issues(issue_id) 

);

--revised choice table

DROP TABLE IF EXISTS choices;
CREATE TABLE choices (
	choice_id SERIAL PRIMARY KEY,
	issue_id INT,
	choice VARCHAR (100),
	points INT default 0,
	CONSTRAINT FK_issue_id FOREIGN KEY(issue_id) REFERENCES issues(issue_id) ON DELETE CASCADE
);

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4, choices.choice_5, choices.choice_6, choices.choice_7, choices.choice_8, choices.choice_9, choices.choice_10 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 1;

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 2;

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 3;

SELECT issue_id, issue_name, description FROM issues;

BEGIN TRANSACTION;

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', NULL, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

INSERT INTO choices(issue_id, choice) VALUES (4, 'less ham');

SELECT choice FROM choices c RIGHT OUTER JOIN issues i ON c.issue_id = i.issue_id WHERE i.issue_id = 1;

SELECT choice, points FROM choices WHERE issue_id = 1;

SELECT issue_id, choice_id, choice, points FROM choices WHERE issue_id = 1;

SELECT * FROM issues;

UPDATE choices SET points = 20 WHERE choice_id = 4;
UPDATE choices SET points = 15 WHERE choice_id = 5;
UPDATE choices SET points = 5 WHERE choice_id = 6;
UPDATE choices SET points = 40 WHERE choice_id = 7;
UPDATE choices SET points = 40 WHERE choice_id = 8;

SELECT SUM(points) FROM choices WHERE issue_id = 2;

SELECT issue_id, issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag FROM issues WHERE status = 'pending';

SELECT issue_id, issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag FROM issues WHERE status = 'active';

UPDATE issues SET status = 'active' WHERE issue_id = 4;

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)

VALUES ('Park amenities budget', 1, 'The township has a budget surplus for the local park and we are looking to allocate the surplus towards something great to give back to the community! Help us decide which amenities you''d like to see added to the park.', CURRENT_TIMESTAMP(0), '2023-12-12', '08:00', 'active', 'community');

INSERT INTO choices (issue_id, choice) VALUES (3, 'Little free library');
INSERT INTO choices (issue_id, choice) VALUES (3, 'new tire swing');
INSERT INTO choices (issue_id, choice) VALUES (3, 'new bench');
INSERT INTO choices (issue_id, choice) VALUES (3, 'more trees');
INSERT INTO choices (issue_id, choice) VALUES (3, 'disc golf');


COMMIT;
ROLLBACK;