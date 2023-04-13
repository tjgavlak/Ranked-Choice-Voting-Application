SELECT * FROM issues

SELECT * FROM users

SELECT * FROM choices

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', NULL, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

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

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4, choices.choice_5, choices.choice_6, choices.choice_7, choices.choice_8, choices.choice_9, choices.choice_10 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 1;

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 2;

SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, choices.choice_1, choices.choice_2, choices.choice_3, choices.choice_4 FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = 3;

SELECT issue_id, issue_name, description FROM issues;

BEGIN TRANSACTION;

INSERT INTO issues
(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', NULL, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0) + INTERVAL '2 days', 'active', 'genre_1');

INSERT INTO choices
(issue_id, choice_1, choice_2, choice_3, choice_4, choice_5, choice_6, choice_7, choice_8, choice_9, choice_10)
VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

COMMIT;
ROLLBACK;