SELECT * FROM issues

SELECT * FROM users

SELECT * FROM choices

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', NULL, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

SELECT issue_id FROM issues ORDER BY issue_id DESC LIMIT 1; --getter

INSERT INTO choices (issue_id)
VALUES (5);


UPDATE choices SET choice_1 = 'one', choice_2 = 'two', choice_3 = 'three' WHERE issue_id = 5;




--, choice_1, choice_2, choice_3, choice_4, choice_5, choice_6, choice_7, choice_8, choice_9, choice_10

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('May book club', 1, 'Rank what you want to read for next month''s book club', NULL, '2023-04-10 11:30:00', '2023-04-29 11:30:00', 'active', 'genre_2');


INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('Park amenities', 1, 'Rank what you want at the park', '2023-04-10 11:30:00', NULL, '2023-04-29 11:30:00', 'active', 'genre_3');

DROP TABLE IF EXISTS issues;

CREATE TABLE issues (
    issue_id SERIAL PRIMARY KEY,
    issue_name VARCHAR(69),
    issue_owner_id INTEGER,
    description VARCHAR(420),
    date_posted TIMESTAMP NULL,
    expiration_date TIMESTAMP,
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
	CONSTRAINT FK_issue_id FOREIGN KEY(issue_id) REFERENCES issues(issue_id)
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

SELECT * FROM choices c RIGHT OUTER JOIN issues i ON c.issue_id = i.issue_id WHERE i.issue_id = 4;

SELECT choice FROM choices WHERE issue_id = 4;

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');


COMMIT;
ROLLBACK;