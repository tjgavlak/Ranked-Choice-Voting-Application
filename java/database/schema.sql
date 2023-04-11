BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS issues;

CREATE TABLE issues (
    issue_id SERIAL PRIMARY KEY,
    issue_name VARCHAR(69),
    issue_owner_id INTEGER,
    description VARCHAR(420),
	choice_1 VARCHAR(50),
	choice_2 VARCHAR(50),
	choice_3 VARCHAR(50),
    date_posted TIMESTAMP NULL,
    expiration_date TIMESTAMP,
    status VARCHAR(40),
    genre_tag VARCHAR(40),
    CONSTRAINT FK_issue_owner_id FOREIGN KEY(issue_owner_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS choices;

CREATE TABLE choices (
	issue_id INT,
	choice_1 VARCHAR (100) NOT NULL,
	choice_2 VARCHAR (100) NOT NULL,
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

COMMIT TRANSACTION;

