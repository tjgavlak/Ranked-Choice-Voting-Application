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
    choices TEXT [],
    description VARCHAR(420),
    date_posted TIMESTAMP NULL,
    expiration_date TIMESTAMP,
    status VARCHAR(40),
    genre_tag VARCHAR(40),
    CONSTRAINT FK_issue_owner_id FOREIGN KEY(issue_owner_id) REFERENCES users(user_id)
);

COMMIT TRANSACTION;