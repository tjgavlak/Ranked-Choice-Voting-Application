BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;


INSERT INTO issues
(issue_name, issue_owner_id, choices, description, date_posted, expiration_date, status, genre_tag)
VALUES ('squirrel party location', 1, ARRAY ['park', 'school', 'store', 'tree', 'other tree', 'disc golf course'], 'Dis gonna be a party with no upper limit', '2023-04-10 11:30:00', '2023-04-11 11:30:00', 'active', 'genre_1');


INSERT INTO issues
(issue_name, issue_owner_id, choices, description, date_posted, expiration_date, status, genre_tag)
VALUES ('May book club', 1, ARRAY ['Infinite Jest', 'The Bible', 'Atlas Shrugged', 'Harry Potter', 'The Bell Jar'], 'Rank what you want to read for next month''s book club', '2023-04-10 11:30:00', '2023-04-29 11:30:00', 'active', 'genre_2');


INSERT INTO issues
(issue_name, issue_owner_id, choices, description, date_posted, expiration_date, status, genre_tag)
VALUES ('Park amenities', 1, ARRAY ['skate park', 'water fountain', 'disc golf course', 'dog park'], 'Rank what you want at the park', '2023-04-10 11:30:00', '2023-04-29 11:30:00', 'active', 'genre_3');


SELECT issue_name, issue_owner_id, choices, description, date_posted, expiration_date, status, genre_tag FROM issues;