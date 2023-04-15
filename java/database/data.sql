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
VALUES ('squirrel party location', 1, 'Dis gonna be a party with no upper limit', CURRENT_TIMESTAMP(0), '04/16/23', '04:00 PM', 'active', 'genre_1');

INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('May book club', 1, 'Rank what you want to read for next month''s book club', CURRENT_TIMESTAMP(0), '04/16/23', '04:00 PM', 'completed', 'genre_2');

INSERT INTO issues
(issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('Park amenities', 1, 'Rank what you want at the park', CURRENT_TIMESTAMP(0), '04/16/23',  '04:00 PM', 'active', 'genre_3');


INSERT INTO choices(issue_id, choice) VALUES (1, 'park');
INSERT INTO choices(issue_id, choice) VALUES (1, 'tree');
INSERT INTO choices(issue_id, choice) VALUES (1, 'garage');
INSERT INTO choices(issue_id, choice) VALUES (2, 'Dictionary');
INSERT INTO choices(issue_id, choice) VALUES (2, 'Thesaurus');
INSERT INTO choices(issue_id, choice) VALUES (2, 'BootcampOS');
INSERT INTO choices(issue_id, choice) VALUES (2, 'The Bell Jar');
INSERT INTO choices(issue_id, choice) VALUES (2, 'The Bible');

UPDATE choices SET points = 3 WHERE choice_id = 1;
UPDATE choices SET points = 7 WHERE choice_id = 2;
UPDATE choices SET points = 10 WHERE choice_id = 3;

