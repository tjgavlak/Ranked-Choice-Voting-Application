BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('rob','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('phil','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('tanner','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('nicole','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;


INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', CURRENT_TIMESTAMP(0), '2023-12-12', '08:00', 'active', 'genre_1');

INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('May book club', 1, 'Rank what you want to read for next month''s book club', CURRENT_TIMESTAMP(0), '2023-04-09', '13:00', 'completed', 'genre_2');

INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('Park amenities budget', 1, 'The township has a budget surplus for the local park and we are looking to allocate the surplus towards something great to give back to the community! Help us decide which amenities you''d like to see added to the park.', CURRENT_TIMESTAMP(0), '2023-12-12', '08:00', 'active', 'community');

INSERT INTO choices(issue_id, choice) VALUES (1, 'park');
INSERT INTO choices(issue_id, choice) VALUES (1, 'tree');
INSERT INTO choices(issue_id, choice) VALUES (1, 'garage');
INSERT INTO choices(issue_id, choice) VALUES (2, 'Dictionary');
INSERT INTO choices(issue_id, choice) VALUES (2, 'Thesaurus');
INSERT INTO choices(issue_id, choice) VALUES (2, 'BootcampOS');
INSERT INTO choices(issue_id, choice) VALUES (2, 'The Bell Jar');
INSERT INTO choices(issue_id, choice) VALUES (2, 'The Bible');
INSERT INTO choices (issue_id, choice) VALUES (3, 'Little free library');
INSERT INTO choices (issue_id, choice) VALUES (3, 'new tire swing');
INSERT INTO choices (issue_id, choice) VALUES (3, 'new bench');
INSERT INTO choices (issue_id, choice) VALUES (3, 'more trees');
INSERT INTO choices (issue_id, choice) VALUES (3, 'disc golf');

UPDATE choices SET points = 3 WHERE choice_id = 1;
UPDATE choices SET points = 7 WHERE choice_id = 2;
UPDATE choices SET points = 10 WHERE choice_id = 3;

UPDATE choices SET points = 20 WHERE choice_id = 4;
UPDATE choices SET points = 30 WHERE choice_id = 5;
UPDATE choices SET points = 10 WHERE choice_id = 6;
UPDATE choices SET points = 15 WHERE choice_id = 7;
UPDATE choices SET points = 25 WHERE choice_id = 8;

